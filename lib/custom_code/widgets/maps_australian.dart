// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'dart:math' as math;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class MapsAustralian extends StatefulWidget {
  const MapsAustralian({
    super.key,
    this.width,
    this.height,
    this.current,
    this.markers,
    this.distance,
    this.markersImage,
    this.newUbication,
    this.age,
    this.service,
    this.language,
  });

  final double? width;
  final double? height;
  final LatLng? current;
  final List<UsersRecord>? markers;
  final double? distance;
  final String? markersImage;
  final String? newUbication;
  final List<String>? age;
  final List<String>? service;
  final String? language;

  @override
  State<MapsAustralian> createState() => _MapsAustralianState();
}

class _MapsAustralianState extends State<MapsAustralian> {
  google_maps.GoogleMapController? mapController;
  google_maps.BitmapDescriptor? customMarker;
  ValueNotifier<LatLng?> newUbicationNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();

    if (widget.newUbication != null) {
      newUbicationNotifier.value = _parseLatLng(widget.newUbication!);
    }

    newUbicationNotifier.addListener(() {
      if (newUbicationNotifier.value != null && mapController != null) {
        mapController!.animateCamera(
          google_maps.CameraUpdate.newCameraPosition(
            google_maps.CameraPosition(
              target: google_maps.LatLng(
                newUbicationNotifier.value!.latitude,
                newUbicationNotifier.value!.longitude,
              ),
              zoom: 14,
            ),
          ),
        );
      }
    });
  }

  @override
  void didUpdateWidget(covariant MapsAustralian oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.newUbication != oldWidget.newUbication) {
      newUbicationNotifier.value = _parseLatLng(widget.newUbication!);
    }
  }

  LatLng _parseLatLng(String latLngString) {
    final parts = latLngString.split(',');
    final latitude = double.parse(parts[0]);
    final longitude = double.parse(parts[1]);
    return LatLng(latitude, longitude);
  }

  Future<void> _loadCustomMarker() async {
    if (widget.markersImage != null) {
      final bitmapDescriptor =
          await google_maps.BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(28, 34)),
        widget.markersImage!,
      );
      setState(() {
        customMarker = bitmapDescriptor;
      });
    } else {
      final bitmapDescriptor = await _createCustomMarkerFromAsset(
          'https://i.ibb.co/5WVX7XJ/marker-Map.png');
      setState(() {
        customMarker = bitmapDescriptor;
      });
    }
  }

  Future<google_maps.BitmapDescriptor> _createCustomMarkerFromAsset(
      String imageUrl) async {
    final http.Response response = await http.get(Uri.parse(imageUrl));
    final Uint8List bytes = response.bodyBytes;
    final ui.Codec codec = await ui.instantiateImageCodec(bytes,
        targetWidth: 28, targetHeight: 34);
    final ui.FrameInfo fi = await codec.getNextFrame();
    final ByteData? byteData =
        await fi.image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List resizedMarkerImageBytes = byteData!.buffer.asUint8List();
    return google_maps.BitmapDescriptor.fromBytes(resizedMarkerImageBytes);
  }

  final google_maps.LatLngBounds australiaBounds = google_maps.LatLngBounds(
    southwest: google_maps.LatLng(-50.0, 100.0),
    northeast: google_maps.LatLng(0.0, 180.0),
  );

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double radius = 6371;
    final double dLat = _degreesToRadians(lat2 - lat1);
    final double dLon = _degreesToRadians(lon2 - lon1);
    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(lat1)) *
            math.cos(_degreesToRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return radius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    final Set<google_maps.Marker> markers = {};

    if (widget.current != null) {
      markers.add(
        google_maps.Marker(
          markerId: google_maps.MarkerId('currentLocation'),
          position: google_maps.LatLng(
            widget.current!.latitude,
            widget.current!.longitude,
          ),
          icon: google_maps.BitmapDescriptor.defaultMarkerWithHue(
            google_maps.BitmapDescriptor.hueViolet,
          ),
        ),
      );

      if (widget.markers != null) {
        for (UsersRecord user in widget.markers!) {
          final LatLng? marker = user.suburb;
          if (marker != null) {
            if (_applyFilters(user)) {
              if (widget.distance != null) {
                final double distance = _calculateDistance(
                  widget.current!.latitude,
                  widget.current!.longitude,
                  marker.latitude,
                  marker.longitude,
                );
                if (distance <= widget.distance!) {
                  markers.add(
                    google_maps.Marker(
                      markerId: google_maps.MarkerId(user.uid),
                      position: google_maps.LatLng(
                        marker.latitude,
                        marker.longitude,
                      ),
                      icon: customMarker ??
                          google_maps.BitmapDescriptor.defaultMarker,
                    ),
                  );
                }
              } else {
                markers.add(
                  google_maps.Marker(
                    markerId: google_maps.MarkerId(user.uid),
                    position: google_maps.LatLng(
                      marker.latitude,
                      marker.longitude,
                    ),
                    icon: customMarker ??
                        google_maps.BitmapDescriptor.defaultMarker,
                  ),
                );
              }
            }
          }
        }
      }
    }

    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          child: google_maps.GoogleMap(
            initialCameraPosition: google_maps.CameraPosition(
              target: google_maps.LatLng(-25.2744, 133.7751),
              zoom: 4,
            ),
            onMapCreated: (google_maps.GoogleMapController controller) {
              mapController = controller;
              mapController!.moveCamera(
                google_maps.CameraUpdate.newLatLngBounds(australiaBounds, 0),
              );

              if (widget.current != null) {
                mapController!.animateCamera(
                  google_maps.CameraUpdate.newCameraPosition(
                    google_maps.CameraPosition(
                      target: google_maps.LatLng(
                        widget.current!.latitude,
                        widget.current!.longitude,
                      ),
                      zoom: 14,
                    ),
                  ),
                );
              }
            },
            mapType: google_maps.MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            minMaxZoomPreference: google_maps.MinMaxZoomPreference(4, 10),
            cameraTargetBounds: google_maps.CameraTargetBounds(australiaBounds),
            markers: markers,
            onCameraMove: (google_maps.CameraPosition position) {
              if (!australiaBounds.contains(position.target)) {
                mapController!.moveCamera(
                  google_maps.CameraUpdate.newLatLngBounds(australiaBounds, 0),
                );
              }
            },
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: FloatingActionButton(
            onPressed: () {
              if (widget.current != null) {
                mapController!.animateCamera(
                  google_maps.CameraUpdate.newCameraPosition(
                    google_maps.CameraPosition(
                      target: google_maps.LatLng(
                        widget.current!.latitude,
                        widget.current!.longitude,
                      ),
                      zoom: 14,
                    ),
                  ),
                );
              }
            },
            child: Icon(Icons.my_location),
          ),
        ),
      ],
    );
  }

  bool _applyFilters(UsersRecord user) {
    bool ageMatch = widget.age == null ||
        widget.age!.isEmpty ||
        widget.age!.contains(user.age ?? '');
    bool serviceMatch = widget.service == null ||
        widget.service!.isEmpty ||
        user.serviceType.any((service) => widget.service!.contains(service));
    bool languageMatch = widget.language == null ||
        widget.language!.isEmpty ||
        (user.languagues != null &&
            user.languagues!.contains(widget.language!));

    return ageMatch && serviceMatch && languageMatch;
  }
}
