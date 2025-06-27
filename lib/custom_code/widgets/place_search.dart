// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlaceSearch extends StatefulWidget {
  const PlaceSearch({
    super.key,
    this.width,
    this.height,
    this.onPlacePicked,
  });

  final double? width;
  final double? height;
  final Function(google_maps.LatLng)? onPlacePicked;

  @override
  State<PlaceSearch> createState() => _PlaceSearchState();
}

class _PlaceSearchState extends State<PlaceSearch>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _errorMessage = '';
  List<dynamic> _predictions = [];
  bool _isLoading = false;
  bool _showResults = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Listen for focus changes
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _predictions.isNotEmpty) {
        setState(() {
          _showResults = true;
        });
        _animationController.forward();
      } else if (!_focusNode.hasFocus && !_isLoading) {
        Future.delayed(Duration(milliseconds: 200), () {
          if (!_focusNode.hasFocus && mounted) {
            setState(() {
              _showResults = false;
            });
            _animationController.reverse();
          }
        });
      }
    });
  }

  Future<void> _searchPlace(String query) async {
    if (query.isEmpty) {
      setState(() {
        _predictions = [];
        _isLoading = false;
        _showResults = false;
        _animationController.reverse();
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
      _showResults = true;
    });

    if (!_animationController.isCompleted) {
      _animationController.forward();
    }

    try {
      final apiKey =
          'AIzaSyAx_Q_RFYYLIK5KUSiikml_iln1Pd2ryGw'; // Replace with your actual API key
      final url =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$apiKey&components=country:au';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['status'] == 'OK') {
          setState(() {
            _predictions = json['predictions'];
            _isLoading = false;
          });
        } else {
          setState(() {
            _predictions = [];
            _errorMessage = 'No suggestions found';
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _predictions = [];
          _errorMessage = 'Error: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _predictions = [];
        _errorMessage = 'Client exception occurred: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _selectPlace(String placeId) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final apiKey =
          'AIzaSyAx_Q_RFYYLIK5KUSiikml_iln1Pd2ryGw'; // Replace with your actual API key
      final url =
          'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);

      if (json['status'] == 'OK') {
        final location = json['result']['geometry']['location'];
        final latLng = google_maps.LatLng(location['lat'], location['lng']);

        // Update the search field with the selected place name
        final placeName = json['result']['name'] ??
            _predictions.firstWhere((pred) => pred['place_id'] == placeId,
                orElse: () => {'description': ''})['description'];

        _controller.text = placeName;

        // Clear results and hide dropdown
        setState(() {
          _predictions = [];
          _errorMessage = '';
          _isLoading = false;
          _showResults = false;
        });

        _animationController.reverse();
        _focusNode.unfocus();

        // Call the onPlacePicked callback
        if (widget.onPlacePicked != null) {
          widget.onPlacePicked!(latLng);
        }
      } else {
        setState(() {
          _errorMessage = 'Location not found';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error selecting place: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300,
      child: Stack(
        children: [
          // Search field
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Search icon
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.purple,
                    size: 24,
                  ),
                ),
                // Text field
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Enter a location',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onChanged: _searchPlace,
                  ),
                ),
                // Filter button
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.filter_list,
                    color: Colors.purple,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          // Search results
          if (_showResults)
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: SizeTransition(
                sizeFactor: _animation,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 300,
                  ),
                  child: _isLoading
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.purple),
                            ),
                          ),
                        )
                      : _errorMessage.isNotEmpty && _predictions.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                _errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: _predictions.length,
                              separatorBuilder: (context, index) =>
                                  Divider(height: 1),
                              itemBuilder: (context, index) {
                                final prediction = _predictions[index];

                                // Split description into main text and secondary text
                                final description =
                                    prediction['description'] as String;
                                final parts = description.split(', ');
                                final mainText = parts.first;
                                final secondaryText = parts.length > 1
                                    ? parts.sublist(1).join(', ')
                                    : '';

                                return Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () =>
                                        _selectPlace(prediction['place_id']),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 16),
                                      child: Row(
                                        children: [
                                          // Location icon
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.purple
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Icon(
                                              Icons.location_on,
                                              color: Colors.purple,
                                              size: 20,
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          // Location text
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  mainText,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                if (secondaryText.isNotEmpty)
                                                  Text(
                                                    secondaryText,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          // Arrow icon
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.grey,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
