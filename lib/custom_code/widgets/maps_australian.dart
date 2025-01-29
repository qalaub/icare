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

import 'package:i_care/v2/user/profile_info/profile_info_widget.dart';

import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'dart:math' as math;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

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
    this.isProfessional,
    this.schedule,
    this.selectProfesional,
    this.selectProfesionalRecord,
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
  final bool? isProfessional;
  final List<String>? schedule;
  final CurrentProfesionalMapStruct? selectProfesional;
  final UsersRecord? selectProfesionalRecord;

  @override
  State<MapsAustralian> createState() => _MapsAustralianState();
}

class _MapsAustralianState extends State<MapsAustralian> {
  google_maps.GoogleMapController? mapController;
  google_maps.BitmapDescriptor? userMarkerIcon;
  google_maps.BitmapDescriptor? profesionalMarkerIcon;
  google_maps.BitmapDescriptor? currentLocationMarkerIcon;
  ValueNotifier<LatLng?> newUbicationNotifier = ValueNotifier(null);

  // Variable para controlar si es la primera carga
  bool isFirstLoad = true;

  double? _lastZoom;

  // Guardar la ubicación inicial de "current"
  late final google_maps.LatLng _initialCurrentLocation;

  @override
  void initState() {
    super.initState();
    _loadCustomMarkers();

    if (widget.newUbication != null) {
      newUbicationNotifier.value = _parseLatLng(widget.newUbication!);
    }

    if (widget.current != null) {
      _initialCurrentLocation = google_maps.LatLng(
        widget.current!.latitude,
        widget.current!.longitude,
      );
    }

    // Verificamos si `selectProfesional` tiene valor antes de asignarlo
    if (widget.selectProfesional != null &&
        widget.selectProfesional!.sub != null) {
      newUbicationNotifier.value = widget.selectProfesional!.sub!;
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

    // Verificamos si `selectProfesional` ha cambiado
    if (widget.selectProfesional != oldWidget.selectProfesional) {
      if (widget.selectProfesional != null &&
          widget.selectProfesional!.sub != null) {
        newUbicationNotifier.value = widget.selectProfesional!.sub!;
      }
    }
  }

  LatLng _parseLatLng(String latLngString) {
    final parts = latLngString.split(',');
    final latitude = double.parse(parts[0]);
    final longitude = double.parse(parts[1]);
    return LatLng(latitude, longitude);
  }

  Future<void> _loadCustomMarkers() async {
    if (widget.markersImage != null) {
      final markerIcon = await _buildMarkerIcon(widget.markersImage!, 100);
      final markerIconP = await _buildMarkerIcon(
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/7wzzhll9km4s/pin_rosa_blanco.png',
          100);
      setState(() {
        userMarkerIcon = markerIcon;
        profesionalMarkerIcon = markerIconP;
      });
    } else {
      setState(() {
        userMarkerIcon = google_maps.BitmapDescriptor.defaultMarker;
      });
    }

    final currentLocationImageUrl =
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/evrj8rjucpf8/currentMarker.png';
    final currentLocationMarkerIcon =
        await _buildMarkerIcon(currentLocationImageUrl, 100);

    setState(() {
      this.currentLocationMarkerIcon = currentLocationMarkerIcon;
    });
  }

  Future<google_maps.BitmapDescriptor> _buildMarkerIcon(
      String pathImage, double size) async {
    try {
      final Uint8List bytes;

      if (pathImage.startsWith('http://') || pathImage.startsWith('https://')) {
        final response = await http.get(Uri.parse(pathImage));
        if (response.statusCode == 200) {
          bytes = response.bodyBytes;
        } else {
          throw Exception(
              'Failed to load image. Status code: ${response.statusCode}');
        }
      } else {
        final ByteData data = await rootBundle.load(pathImage);
        bytes = data.buffer.asUint8List();
      }

      final image = img.decodeImage(Uint8List.fromList(bytes))!;
      final resizedImage = img.copyResize(image, width: 60, height: 105);

      final Uint8List resizedBytes =
          Uint8List.fromList(img.encodePng(resizedImage));

      return google_maps.BitmapDescriptor.fromBytes(resizedBytes);
    } catch (e) {
      print('Error loading marker image: $e');
      return google_maps.BitmapDescriptor.defaultMarker;
    }
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

  bool _applyFilters(UsersRecord user) {
    // Si es la primera carga, no aplicar filtros
    if (isFirstLoad) {
      return true;
    }

    // Verifica si el usuario cumple con los filtros de edad
    bool ageMatch = widget.age == null ||
        widget.age!.isEmpty ||
        widget.age!.contains(user.age ?? '');

    // Verifica si el usuario cumple con los filtros de servicio
    bool serviceMatch = widget.service == null ||
        widget.service!.isEmpty ||
        user.serviceType.any((service) => widget.service!.contains(service));

    // Verifica si el usuario cumple con los filtros de idioma
    bool languageMatch = widget.language == null ||
        widget.language!.isEmpty ||
        (user.languagues != null &&
            user.languagues!.contains(widget.language!));

    // Verifica si el usuario tiene algún día en común con el horario especificado
    bool scheduleMatch = widget.schedule == null ||
        widget.schedule!.isEmpty ||
        user.schedule.any((day) => widget.schedule!.contains(day));

    // Si el usuario es profesional, no se aplican los filtros
    if (widget.isProfessional == true) {
      return true;
    }

    // Retorna verdadero si cumple con alguno de los filtros
    return ageMatch || serviceMatch || languageMatch || scheduleMatch;
  }

  void navigateToProfileInfo(user) {
    if (widget.isProfessional != true) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileInfoWidget(
                    professional: user,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Set<google_maps.Marker> markers = {};

    // Manejamos la ubicación inicial (si `selectProfesional` no es null)
    if (widget.selectProfesional != null &&
        widget.selectProfesional!.sub != null) {
      markers.add(
        google_maps.Marker(
          markerId: google_maps.MarkerId('selectedProfessional'),
          position: google_maps.LatLng(
            widget.selectProfesional!.sub!.latitude,
            widget.selectProfesional!.sub!.longitude,
          ),
          icon: profesionalMarkerIcon ??
              google_maps.BitmapDescriptor.defaultMarkerWithHue(
                  google_maps.BitmapDescriptor.hueViolet),
          onTap: () {
            // AccFFión al hacer clic en el marcador
            navigateToProfileInfo(widget.selectProfesional!.id!);
          },
        ),
      );
    }

    if (widget.current != null) {
      markers.add(
        google_maps.Marker(
          markerId: google_maps.MarkerId('currentLocation'),
          position: _initialCurrentLocation, // Fija la ubicación inicial
          icon: currentLocationMarkerIcon ??
              google_maps.BitmapDescriptor.defaultMarkerWithHue(
                  google_maps.BitmapDescriptor.hueRed),
        ),
      );
    }

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
                    icon: userMarkerIcon ??
                        google_maps.BitmapDescriptor.defaultMarkerWithHue(
                            google_maps.BitmapDescriptor.hueViolet),
                    onTap: () {
                      // Acción al hacer clic en el marcador
                      navigateToProfileInfo(user.reference);
                    },
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
                  icon: userMarkerIcon ??
                      google_maps.BitmapDescriptor.defaultMarkerWithHue(
                          google_maps.BitmapDescriptor.hueViolet),
                  onTap: () {
                    // Acción al hacer clic en el marcador
                    navigateToProfileInfo(user.reference);
                  },
                ),
              );
            }
          }
        }
      }
    }

    if (isFirstLoad) {
      setState(() {
        isFirstLoad = false;
      });
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

              // Si selectProfesional no es null, mueve el mapa a esa ubicación
              if (widget.selectProfesional != null &&
                  widget.selectProfesional!.sub != null) {
                mapController!.animateCamera(
                  google_maps.CameraUpdate.newCameraPosition(
                    google_maps.CameraPosition(
                      target: google_maps.LatLng(
                        widget.selectProfesional!.sub!.latitude,
                        widget.selectProfesional!.sub!.longitude,
                      ),
                      zoom: 14,
                    ),
                  ),
                );
              }
            },
            mapType: google_maps.MapType.normal,
            myLocationButtonEnabled:
                false, // Desactiva el botón de "My Location"
            zoomControlsEnabled: false, // Desactiva los controles de zoom
            compassEnabled: false, // Desactiva la brújula
            mapToolbarEnabled: false, // Desactiva la barra de herramientas

            minMaxZoomPreference: google_maps.MinMaxZoomPreference(4, 10),
            cameraTargetBounds: google_maps.CameraTargetBounds(australiaBounds),
            markers: markers,
            onCameraMove: (google_maps.CameraPosition position) {
              // Actualizar la posición central relativa al mapa en FFAppState
              FFAppState().update(() {
                FFAppState().tempLocation = LatLng(
                  position.target.latitude,
                  position.target.longitude,
                );
              });

              if (_lastZoom == null ||
                  (position.zoom - _lastZoom!).abs() > 0.1) {
                _lastZoom = position.zoom;
                int tempNumber = ((10 / position.zoom) * 100.0).toInt();
                FFAppState().update(() {
                  FFAppState().zoomFilter = tempNumber;
                  int multiplier =
                      (50 + (math.log(tempNumber / 50) * 70).toInt())
                          .clamp(50, 600) as int;
                  FFAppState().distanceToShow = multiplier;
                });
              }
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
          top: MediaQuery.of(context).size.height / 2 - 28,
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
}
