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
import '/v3correciones/user_fav0rites/v3fv0ritesv3/v3fv0ritesv3_widget.dart';
import 'dart:async';

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
    this.markersImage,
    this.newUbication,
    this.age,
    this.service,
    this.language,
    this.isProfessional,
    this.schedule,
    this.selectProfesional,
    this.selectProfesionalRecord,
    this.onUbicationReset,
  });

  final double? width;
  final double? height;
  final LatLng? current;
  final List<UsersRecord>? markers;
  final String? markersImage;
  final String? newUbication;
  final List<String>? age;
  final List<String>? service;
  final String? language;
  final bool? isProfessional;
  final List<String>? schedule;
  final CurrentProfesionalMapStruct? selectProfesional;
  final UsersRecord? selectProfesionalRecord;
  final Function()? onUbicationReset;

  @override
  State<MapsAustralian> createState() => _MapsAustralianState();
}

class _MapsAustralianState extends State<MapsAustralian> {
  // Map controller and variables
  google_maps.GoogleMapController? mapController;
  google_maps.BitmapDescriptor? userMarkerIcon;
  google_maps.BitmapDescriptor? profesionalMarkerIcon;
  google_maps.BitmapDescriptor? currentLocationMarkerIcon;
  google_maps.BitmapDescriptor? selectedProfessionalMarkerIcon;
  bool _isLocatingUser = false;
  ValueNotifier<LatLng?> newUbicationNotifier = ValueNotifier(null);

  bool _lockToNewLocation = false;
  LatLng? _lockedLocation;

  bool _isInteractingWithPageView = false;
  Timer? _interactionTimer;
  // Add this boolean property to your class
  DocumentReference? _lastViewedProfessionalRef;

  // PageView controller
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;
  UsersRecord? _selectedUser;
  CurrentProfesionalMapStruct? _selectedProfessional;

  // Map control variables
  bool isFirstLoad = true;
  bool _markersLoaded = false;
  bool _mapInitialized = false;
  bool _locationPermissionAccepted = false;
  double? _lastZoom;

  // Default location for Australia center
  final google_maps.LatLng _defaultAustraliaCenter =
      google_maps.LatLng(-25.2744, 133.7751);

  // Initial current location
  google_maps.LatLng? _initialCurrentLocation;

  // Lista ordenada de marcadores por proximidad
  List<UsersRecord>? _sortedMarkers;

  final google_maps.LatLngBounds australiaBounds = google_maps.LatLngBounds(
    southwest: google_maps.LatLng(-50.0, 100.0),
    northeast: google_maps.LatLng(0.0, 180.0),
  );

  @override
  void initState() {
    super.initState();

    print('Initial markers count: ${widget.markers?.length ?? 0}');

    // Ordenar los marcadores por cercanía al usuario actual
    _sortMarkersByProximity();

    // Initialize with the first professional if available and NOT in professional mode
    if (_sortedMarkers != null &&
        _sortedMarkers!.isNotEmpty &&
        widget.isProfessional != true) {
      _updateSelectedUser(0);
    }

    // IMPORTANTE: Primero cargar los marcadores personalizados, LUEGO inicializar el mapa
    _loadCustomMarkers().then((_) {
      if (mounted) {
        setState(() {
          _markersLoaded = true;
        });
        // Solo ahora movemos a la ubicación apropiada, después de cargar los íconos
        Future.delayed(Duration(milliseconds: 300), () {
          if (mounted && _mapInitialized) {
            _moveToAppropriateLocation();
          }
        });

        // Intentar cargar marcadores nuevamente después de un breve retraso
        Future.delayed(Duration(seconds: 2), () {
          if (mounted && (_sortedMarkers == null || _sortedMarkers!.isEmpty)) {
            _reloadMarkers();
          }
        });
      }
    });

    if (widget.newUbication != null) {
      try {
        newUbicationNotifier.value = _parseLatLng(widget.newUbication!);
      } catch (e) {
        print('Error parsing newUbication: $e');
      }
    }

    if (widget.current != null) {
      _initialCurrentLocation = google_maps.LatLng(
        widget.current!.latitude,
        widget.current!.longitude,
      );
      _locationPermissionAccepted = true;
    }

    // Check if selectedProfessional exists in FFAppState
    if (_selectedProfessional != null && _selectedProfessional!.sub != null) {
      newUbicationNotifier.value = _selectedProfessional!.sub!;
    }

    newUbicationNotifier.addListener(_handleLocationChange);

    // Only add page listener if not a professional
    if (widget.isProfessional != true) {
      _addPageListener();
    }
  }

  void _addPageListener() {
    _pageController.addListener(() {
      // When the page changes more than halfway, update the selected user
      if (_pageController.page != null) {
        int nextPage = _pageController.page!.round();
        if (nextPage != _currentPage) {
          setState(() {
            _currentPage = nextPage;
            _updateSelectedUser(nextPage);
          });
        }
      }
    });
  }

  void _reloadMarkers() {
    if (widget.markers != null && widget.markers!.isNotEmpty) {
      setState(() {
        _sortMarkersByProximity();
      });
      print('Reloaded markers, new count: ${_sortedMarkers?.length ?? 0}');
    } else {
      print('No markers available to reload');
    }
  }

  void _updateSelectedUser(int index) {
    if (_sortedMarkers == null || _sortedMarkers!.isEmpty) {
      _selectedUser = null;
      _selectedProfessional = null;
      return;
    }

    if (index < 0 || index >= _sortedMarkers!.length) {
      print(
          'Invalid index: $index for markers length: ${_sortedMarkers!.length}');
      return;
    }

    _selectedUser = _sortedMarkers![index];

    if (_selectedUser != null && _selectedUser!.suburb != null) {
      _selectedProfessional = CurrentProfesionalMapStruct(
        sub: _selectedUser!.suburb,
        id: _selectedUser!.reference,
      );

      // Update FFAppState to maintain compatibility with existing code
      FFAppState().currentProfesionalUbication = _selectedProfessional!;
      FFAppState().update(() {});

      // Also update map camera position
      if (mapController != null && _mapInitialized) {
        _animateCameraToPosition(
          google_maps.LatLng(
            _selectedUser!.suburb!.latitude,
            _selectedUser!.suburb!.longitude,
          ),
          7,
        );
      }
    }
  }

  // Función para encontrar el índice de un usuario específico en la lista ordenada
  int _findUserIndex(DocumentReference userRef) {
    if (_sortedMarkers == null) return -1;

    for (int i = 0; i < _sortedMarkers!.length; i++) {
      if (_sortedMarkers![i].reference == userRef) {
        return i;
      }
    }
    return -1;
  }

  void _handleLocationChange() {
    if (newUbicationNotifier.value != null) {
      print('Location notifier changed: ${newUbicationNotifier.value}');

      if (mounted) {
        // Guardar el usuario seleccionado actual antes de reordenar
        UsersRecord? currentSelectedUser = _selectedUser;
        DocumentReference? currentSelectedRef =
            currentSelectedUser != null ? currentSelectedUser.reference : null;

        // Reordenar marcadores sin cambiar la selección
        setState(() {
          _sortMarkersByProximityPreserveSelection(
              newUbicationNotifier.value!, currentSelectedRef);
        });
      }
    }
  }

  void _sortMarkersByProximityPreserveSelection(
      LatLng location, DocumentReference? currentSelectedRef) {
    if (widget.markers == null || widget.markers!.isEmpty) {
      _sortedMarkers = [];
      return;
    }

    // Aplicar filtros
    List<UsersRecord> filteredMarkers = [];
    for (var user in widget.markers!) {
      if (user.suburb != null) {
        if (_applyFilters(user)) {
          filteredMarkers.add(user);
        }
      }
    }

    _sortedMarkers = filteredMarkers;

    // Ordenar por proximidad a la ubicación proporcionada
    if (_sortedMarkers!.isEmpty) {
      return;
    }

    _sortedMarkers!.sort((a, b) {
      if (a.suburb == null && b.suburb == null) return 0;
      if (a.suburb == null) return 1;
      if (b.suburb == null) return -1;

      final distanceA = _calculateDistance(location, a.suburb!);
      final distanceB = _calculateDistance(location, b.suburb!);

      return distanceA.compareTo(distanceB);
    });

    // Si tenemos una referencia del usuario seleccionado, mantenerla después del reordenamiento
    if (currentSelectedRef != null && widget.isProfessional != true) {
      int newIndex = _findUserIndex(currentSelectedRef);
      if (newIndex != -1) {
        // Actualizar el índice actual sin cambiar al primer elemento
        _currentPage = newIndex;

        // Actualizar el usuario seleccionado con el mismo de antes pero en su nueva posición
        _updateSelectedUser(newIndex);

        // Mover el PageView a la nueva posición del mismo usuario
        if (_pageController.hasClients) {
          _pageController.jumpToPage(
              newIndex); // Usamos jumpToPage en lugar de animateToPage para evitar efectos visuales extraños
        }
      }
    }
  }

  void _forceMapMoveWithRetry(LatLng location, double zoom, int retries) {
    if (!_mapInitialized || mapController == null) {
      print('Mapa no inicializado, reintentando más tarde...');
      if (retries > 0) {
        Future.delayed(Duration(milliseconds: 300), () {
          _forceMapMoveWithRetry(location, zoom, retries - 1);
        });
      }
      return;
    }

    print(
        'Moviendo mapa con animación a: $location (intento ${5 - retries + 1})');

    mapController!.animateCamera(
      google_maps.CameraUpdate.newCameraPosition(
        google_maps.CameraPosition(
          target: google_maps.LatLng(
            location.latitude,
            location.longitude,
          ),
          zoom: zoom,
        ),
      ),
    );

    // Programar reintentos adicionales para mantener la posición
    if (retries > 0) {
      Future.delayed(Duration(milliseconds: 600), () {
        if (mounted && _lockToNewLocation) {
          _forceMapMoveWithRetry(location, zoom, retries - 1);
        }
      });
    }
  }

  void _forceMapMove(LatLng location, double zoom) {
    if (_mapInitialized && mapController != null) {
      // Si estamos interactuando con el PageView, permitir el movimiento
      // Si no estamos interactuando y hay una ubicación bloqueada, verificar
      if (_isInteractingWithPageView ||
          !_lockToNewLocation ||
          (_lockToNewLocation && _lockedLocation == location)) {
        mapController!.moveCamera(
          google_maps.CameraUpdate.newCameraPosition(
            google_maps.CameraPosition(
              target: google_maps.LatLng(
                location.latitude,
                location.longitude,
              ),
              zoom: zoom,
            ),
          ),
        );
      }
    }
  }

  void _setPageViewInteraction(bool isInteracting) {
    setState(() {
      _isInteractingWithPageView = isInteracting;
    });

    // Cancela cualquier temporizador existente
    _interactionTimer?.cancel();

    // Si estamos interactuando, establece un temporizador para restaurar el bloqueo
    if (isInteracting) {
      _interactionTimer = Timer(Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _isInteractingWithPageView = false;

            // Restaura la ubicación bloqueada si existe
            if (_lockToNewLocation && _lockedLocation != null) {
              _forceMapMove(_lockedLocation!, 9.0);
            }
          });
        }
      });
    }
  }

  LatLng? parseSuburbValue(dynamic value) {
    // If it's already a LatLng, return it
    if (value is LatLng) {
      return value;
    }

    // If it's a string, try to parse it
    if (value is String) {
      try {
        // Remove brackets, degree symbols, and split by comma
        String cleaned =
            value.replaceAll('[', '').replaceAll(']', '').replaceAll('°', '');
        List<String> parts = cleaned.split(',');

        if (parts.length == 2) {
          double? lat;
          double? lng;

          // Parse latitude (handle S direction as negative)
          String latStr = parts[0].trim();
          if (latStr.contains('S')) {
            lat = -double.parse(latStr.replaceAll('S', '').trim());
          } else {
            lat = double.parse(latStr.replaceAll('N', '').trim());
          }

          // Parse longitude (handle W direction as negative)
          String lngStr = parts[1].trim();
          if (lngStr.contains('W')) {
            lng = -double.parse(lngStr.replaceAll('W', '').trim());
          } else {
            lng = double.parse(lngStr.replaceAll('E', '').trim());
          }

          return LatLng(lat, lng);
        }
      } catch (e) {
        print('Error parsing suburb: $e for value: $value');
      }
    }

    return null;
  }

  void _moveToAppropriateLocation() {
    if (!_mapInitialized || mapController == null) return;

    if (_lockToNewLocation && _lockedLocation != null) {
      _forceMapMove(
          _lockedLocation!, widget.isProfessional == true ? 6.0 : 12.0);
      return;
    }

    // For professionals, center on the default Australia location with lower zoom
    if (widget.isProfessional == true) {
      mapController!.moveCamera(
        google_maps.CameraUpdate.newCameraPosition(
          google_maps.CameraPosition(
            target: _defaultAustraliaCenter,
            zoom: 4, // Use appropriate zoom for viewing all of Australia
          ),
        ),
      );
      return; // Exit the function after centering the map
    }

    // For regular users, follow the existing logic:
    // Priority order for camera position:
    // 1. Selected professional
    // 2. Current user location
    // 3. Default Australia center
    if (_selectedProfessional != null && _selectedProfessional!.sub != null) {
      _animateCameraToPosition(
        google_maps.LatLng(
          _selectedProfessional!.sub!.latitude,
          _selectedProfessional!.sub!.longitude,
        ),
        11,
      );
    } else if (_locationPermissionAccepted && _initialCurrentLocation != null) {
      _animateCameraToPosition(_initialCurrentLocation!, 11);
    } else {
      // Default to Australia view
      mapController!.moveCamera(
        google_maps.CameraUpdate.newLatLngBounds(australiaBounds, 50),
      );
    }
  }

  void _animateCameraToPosition(google_maps.LatLng position, double zoom) {
    if (mapController != null) {
      mapController!.animateCamera(
        google_maps.CameraUpdate.newCameraPosition(
          google_maps.CameraPosition(
            target: position,
            zoom: zoom,
          ),
        ),
      );
    }
  }

  @override
  void didUpdateWidget(covariant MapsAustralian oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Verifica si la ubicación cambió
    if (widget.newUbication != oldWidget.newUbication &&
        widget.newUbication != null) {
      try {
        final newLocation = _parseLatLng(widget.newUbication!);
        if (newLocation != null) {
          print('New location detected: $newLocation - LOCKING MAP');

          // ACTIVAR BLOQUEO - Esta es la clave para evitar que se mueva automáticamente
          setState(() {
            _lockToNewLocation = true;
            _lockedLocation = newLocation;
            _isInteractingWithPageView =
                false; // Reinicia el estado de interacción
          });

          // Usar un enfoque de fuerza bruta: intentar mover el mapa varias veces
          _forceMapMoveWithRetry(newLocation, 12.0, 5); // 5 intentos

          // Ordenar marcadores por proximidad a esta nueva ubicación
          _sortMarkersByProximityWithLocation(newLocation);

          // Resetear el PageView al primer elemento
          if (_sortedMarkers != null && _sortedMarkers!.isNotEmpty) {
            _updateSelectedUser(0);
            if (_pageController.hasClients) {
              _pageController.jumpToPage(0);
            }
          }
        }
      } catch (e) {
        print('Error en nueva ubicación: $e');
      }
      return; // Salir temprano para evitar otros comportamientos
    }

    // Si hay un bloqueo activo, evitar cualquier actualización de ubicación
    if (_lockToNewLocation && _lockedLocation != null) {
      // Si hay intentos de mover el mapa por otras razones, forzar de nuevo a la ubicación bloqueada
      if (_mapInitialized && mapController != null) {
        _forceMapMove(_lockedLocation!, 12.0);
      }
      return; // Evitar que se procese el resto de la función
    }

    // El resto del código de didUpdateWidget continúa aquí...
    // Check if current location was just provided
    if (widget.current != null && oldWidget.current == null) {
      setState(() {
        _isLocatingUser = true;
        _initialCurrentLocation = google_maps.LatLng(
          widget.current!.latitude,
          widget.current!.longitude,
        );
        _locationPermissionAccepted = true;
      });

      // Solo procesar ubicación actual si no hay una nueva ubicación activa
      if (newUbicationNotifier.value == null) {
        Future.delayed(Duration(milliseconds: 300), () {
          if (mounted) {
            setState(() {
              _isLocatingUser = false;
            });
            _sortMarkersByProximity();

            if (_mapInitialized && mapController != null) {
              _moveToAppropriateLocation();
            }
          }
        });
      } else {
        setState(() {
          _isLocatingUser = false;
        });
      }
    }

    // Simplificado: Comprueba si los filtros de edad o servicio han cambiado
    bool filtersChanged = false;

    // Compara listas de filtros de edad
    if (widget.age != oldWidget.age) {
      if ((widget.age == null && oldWidget.age != null) ||
          (widget.age != null && oldWidget.age == null)) {
        filtersChanged = true;
      } else if (widget.age != null && oldWidget.age != null) {
        if (widget.age!.length != oldWidget.age!.length) {
          filtersChanged = true;
        } else {
          for (var age in widget.age!) {
            if (!oldWidget.age!.contains(age)) {
              filtersChanged = true;
              break;
            }
          }
        }
      }
    }

    // Compara listas de filtros de servicio
    if (!filtersChanged && widget.service != oldWidget.service) {
      if ((widget.service == null && oldWidget.service != null) ||
          (widget.service != null && oldWidget.service == null)) {
        filtersChanged = true;
      } else if (widget.service != null && oldWidget.service != null) {
        if (widget.service!.length != oldWidget.service!.length) {
          filtersChanged = true;
        } else {
          for (var service in widget.service!) {
            if (!oldWidget.service!.contains(service)) {
              filtersChanged = true;
              break;
            }
          }
        }
      }
    }

    // Si algún filtro ha cambiado, actualiza los marcadores
    if (filtersChanged) {
      _sortMarkersByProximity();
      setState(() {}); // Actualiza la UI

      // Actualiza la selección si hay marcadores disponibles y no es profesional
      if (_sortedMarkers != null &&
          _sortedMarkers!.isNotEmpty &&
          widget.isProfessional != true) {
        _updateSelectedUser(0);
        _pageController.jumpToPage(0);
      } else if (_sortedMarkers != null &&
          _sortedMarkers!.isEmpty &&
          widget.isProfessional != true) {
        // Reset selection if no markers match filters
        _selectedUser = null;
        _selectedProfessional = null;
      }
    }

    // Check if markers list has changed
    if (widget.markers != oldWidget.markers) {
      // Reordenar marcadores
      _sortMarkersByProximity();
      setState(() {}); // Refresh to update markers

      // Reset to first marker if markers changed and not professional
      if (_sortedMarkers != null &&
          _sortedMarkers!.isNotEmpty &&
          widget.isProfessional != true) {
        _updateSelectedUser(0);
        _pageController.jumpToPage(0);
      } else if (_sortedMarkers != null &&
          _sortedMarkers!.isEmpty &&
          widget.isProfessional != true) {
        // Reset selection if no markers are available
        _selectedUser = null;
        _selectedProfessional = null;
      }
    }
  }

  // Función para calcular la distancia entre dos puntos
  double _calculateDistance(LatLng point1, LatLng point2) {
    const int earthRadius = 6371000; // Radio de la Tierra en metros

    // Convertir a radianes
    final double lat1 = point1.latitude * math.pi / 180;
    final double lon1 = point1.longitude * math.pi / 180;
    final double lat2 = point2.latitude * math.pi / 180;
    final double lon2 = point2.longitude * math.pi / 180;

    // Haversine formula
    final double dLat = lat2 - lat1;
    final double dLon = lon2 - lon1;
    final double a = math.pow(math.sin(dLat / 2), 2) +
        math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLon / 2), 2);
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c; // Distancia en metros
  }

  // Add this new method to sort by a specific location
  void _sortMarkersByProximityWithLocation(LatLng location) {
    if (widget.markers == null || widget.markers!.isEmpty) {
      _sortedMarkers = [];
      return;
    }

    // Guardamos la referencia actual antes de reordenar
    DocumentReference? currentSelectedRef =
        _selectedUser != null ? _selectedUser!.reference : null;

    // First apply filters
    List<UsersRecord> filteredMarkers = [];
    for (var user in widget.markers!) {
      if (user.suburb != null) {
        if (_applyFilters(user)) {
          filteredMarkers.add(user);
        }
      }
    }

    _sortedMarkers = filteredMarkers;

    // Sort by proximity to the provided location
    if (_sortedMarkers!.isEmpty) {
      return;
    }

    _sortedMarkers!.sort((a, b) {
      if (a.suburb == null && b.suburb == null) return 0;
      if (a.suburb == null) return 1;
      if (b.suburb == null) return -1;

      final distanceA = _calculateDistance(location, a.suburb!);
      final distanceB = _calculateDistance(location, b.suburb!);

      return distanceA.compareTo(distanceB);
    });

    // Si tenemos un usuario seleccionado y no estamos en modo profesional,
    // intentamos mantener ese usuario seleccionado después del reordenamiento
    if (currentSelectedRef != null && widget.isProfessional != true) {
      int newIndex = _findUserIndex(currentSelectedRef);
      if (newIndex != -1) {
        // Actualizar el usuario seleccionado sin resetear al primero
        _updateSelectedUser(newIndex);

        // Mover PageView a la nueva posición del mismo usuario, si existe
        if (_pageController.hasClients) {
          _pageController.jumpToPage(newIndex);
        }
        return; // Salimos para evitar el reseteo abajo
      }
    }

    // Solo si no pudimos mantener la selección actual, o no había ninguna,
    // caemos en el comportamiento original
    if (widget.isProfessional != true &&
        _sortedMarkers != null &&
        _sortedMarkers!.isNotEmpty) {
      // Update the selected user to be the first in the new sorted list
      _updateSelectedUser(0);

      // Animate PageView to the first item smoothly
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  // Ordenar marcadores por proximidad a la ubicación actual
  void _sortMarkersByProximity() {
    print('Sorting markers, input count: ${widget.markers?.length ?? 0}');

    if (widget.markers == null || widget.markers!.isEmpty) {
      _sortedMarkers = [];
      print('No markers to sort');
      return;
    }

    // First apply filters
    List<UsersRecord> filteredMarkers = [];
    for (var user in widget.markers!) {
      if (user.suburb != null) {
        // Solo incluir usuarios con ubicación válida
        if (_applyFilters(user)) {
          filteredMarkers.add(user);
          print('Added user ${user.uid} with suburb ${user.suburb}');
        } else {
          print('User ${user.uid} filtered out');
        }
      } else {
        print('User ${user.uid} has null suburb');
      }
    }

    _sortedMarkers = filteredMarkers;
    print('Filtered markers count: ${_sortedMarkers?.length ?? 0}');

    // If all markers were filtered out, we don't need to sort
    if (_sortedMarkers!.isEmpty) {
      return;
    }

    // If we have a current location, sort by proximity
    if (widget.current != null) {
      final currentLocation = widget.current!;

      _sortedMarkers!.sort((a, b) {
        if (a.suburb == null && b.suburb == null) return 0;
        if (a.suburb == null) return 1;
        if (b.suburb == null) return -1;

        final distanceA = _calculateDistance(currentLocation, a.suburb!);
        final distanceB = _calculateDistance(currentLocation, b.suburb!);

        return distanceA.compareTo(distanceB);
      });
    }
  }

  LatLng? _parseLatLng(String latLngString) {
    try {
      print('Parsing LatLng string: $latLngString');

      // Eliminar caracteres no necesarios
      String cleaned = latLngString
          .replaceAll(' ', '')
          .replaceAll('{', '')
          .replaceAll('}', '')
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll('°', '')
          .replaceAll('lat:', '')
          .replaceAll('lng:', '')
          .replaceAll('latitude:', '')
          .replaceAll('longitude:', '');

      // Intentar diferentes formatos
      // Formato 1: "latitude,longitude"
      if (cleaned.contains(',')) {
        final parts = cleaned.split(',');
        if (parts.length >= 2) {
          final latitude = double.parse(parts[0]);
          final longitude = double.parse(parts[1]);
          print('Successfully parsed: ($latitude, $longitude)');
          return LatLng(latitude, longitude);
        }
      }

      print('Failed to parse LatLng string');
      return null;
    } catch (e) {
      print('Error parsing LatLng string: $e');
      return null;
    }
  }

  Future<void> _loadCustomMarkers() async {
    try {
      print('Loading custom markers started');

      // Crear una variable local para almacenar temporalmente los íconos
      google_maps.BitmapDescriptor? tempUserMarkerIcon;
      google_maps.BitmapDescriptor? tempProfesionalMarkerIcon;
      google_maps.BitmapDescriptor? tempCurrentLocationMarkerIcon;
      google_maps.BitmapDescriptor? tempSelectedProfessionalMarkerIcon;

      // Cargamos todos los íconos en paralelo para mayor eficiencia
      List<Future> iconLoadingFutures = [];

      // 1. Cargar ícono de usuario normal
      if (widget.markersImage != null) {
        iconLoadingFutures
            .add(_buildMarkerIcon(widget.markersImage!, 100).then((icon) {
          tempUserMarkerIcon = icon;
        }));
      } else {
        tempUserMarkerIcon = google_maps.BitmapDescriptor.defaultMarker;
      }

      // 2. Cargar ícono para profesional
      tempProfesionalMarkerIcon = google_maps.BitmapDescriptor.defaultMarker;

      // 3. Cargar ícono para profesional seleccionado
      final selectedProfessionalImageUrl =
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/znz4vzyqj65b/profesionalMarker.png';
      iconLoadingFutures.add(_buildMarkerIcon(
              widget.markersImage != null
                  ? widget.markersImage!
                  : selectedProfessionalImageUrl,
              120,
              scale: 1.5)
          .then((icon) {
        tempSelectedProfessionalMarkerIcon = icon;
      }));

      // 4. Cargar ícono para ubicación actual
      final currentLocationImageUrl =
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/evrj8rjucpf8/currentMarker.png';
      iconLoadingFutures
          .add(_buildMarkerIcon(currentLocationImageUrl, 100).then((icon) {
        tempCurrentLocationMarkerIcon = icon;
      }));

      // Esperar a que se completen todas las cargas
      await Future.wait(iconLoadingFutures);

      // Solo actualizar el estado una vez con todos los íconos, evitando renders intermedios
      if (mounted) {
        setState(() {
          userMarkerIcon = tempUserMarkerIcon;
          profesionalMarkerIcon = tempProfesionalMarkerIcon;
          currentLocationMarkerIcon = tempCurrentLocationMarkerIcon;
          selectedProfessionalMarkerIcon = tempSelectedProfessionalMarkerIcon;
        });
      }

      print('Loading custom markers completed');
    } catch (e) {
      print('Error loading markers: $e');
      // Set default markers if there's an error
      if (mounted) {
        setState(() {
          userMarkerIcon = google_maps.BitmapDescriptor.defaultMarkerWithHue(
              google_maps.BitmapDescriptor.hueViolet);
          profesionalMarkerIcon =
              google_maps.BitmapDescriptor.defaultMarkerWithHue(
                  google_maps.BitmapDescriptor.hueViolet);
          currentLocationMarkerIcon =
              google_maps.BitmapDescriptor.defaultMarkerWithHue(
                  google_maps.BitmapDescriptor.hueRed);
          selectedProfessionalMarkerIcon =
              google_maps.BitmapDescriptor.defaultMarkerWithHue(
                  google_maps.BitmapDescriptor.hueBlue);
        });
      }
    }
  }

  Future<google_maps.BitmapDescriptor> _buildMarkerIcon(
      String pathImage, double size,
      {double scale = 1.0}) async {
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
      // Aplicar escala al tamaño base
      final int scaledWidth = (80 * scale).toInt();
      final int scaledHeight = (140 * scale).toInt();
      final resizedImage =
          img.copyResize(image, width: scaledWidth, height: scaledHeight);

      final Uint8List resizedBytes =
          Uint8List.fromList(img.encodePng(resizedImage));

      return google_maps.BitmapDescriptor.fromBytes(resizedBytes);
    } catch (e) {
      print('Error loading marker image: $e');
      return google_maps.BitmapDescriptor.defaultMarker;
    }
  }

  bool _applyFilters(UsersRecord user) {
    // If no filters are applied or we're in professional mode, show all markers
    if (widget.isProfessional == true ||
        ((widget.age == null || widget.age!.isEmpty) &&
            (widget.service == null || widget.service!.isEmpty))) {
      return true;
    }

    // Verify if user meets age filters
    bool ageMatch = widget.age == null ||
        widget.age!.isEmpty ||
        widget.age!.contains(user.age ?? '');

    // Verify if user meets service filters
    bool serviceMatch = widget.service == null ||
        widget.service!.isEmpty ||
        (user.serviceType != null &&
            user.serviceType
                .any((service) => widget.service!.contains(service)));

    // Return true if both filters match
    return ageMatch && serviceMatch;
  }

  void navigateToProfileInfo(dynamic user) {
    if (widget.isProfessional != true) {
      // Guarda la referencia del profesional que se está viendo
      // Necesitamos comprobar si user es UsersRecord o tiene una propiedad reference
      if (user is UsersRecord) {
        _lastViewedProfessionalRef = user.reference;
      } else if (user != null && user.reference != null) {
        _lastViewedProfessionalRef = user.reference;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileInfoWidget(
            professional: user,
          ),
        ),
      ).then((_) {
        // Cuando regresemos, restaura la vista del profesional
        if (_lastViewedProfessionalRef != null && _sortedMarkers != null) {
          _restoreLastViewedProfessional();
        }
      });
    }
  }

// Añade esta nueva función para restaurar la vista al profesional anterior
  void _restoreLastViewedProfessional() {
    if (_lastViewedProfessionalRef == null || _sortedMarkers == null) return;

    // Busca el índice del profesional en la lista ordenada
    final index = _findUserIndex(_lastViewedProfessionalRef!);

    if (index != -1) {
      // Actualiza la selección
      _updateSelectedUser(index);

      // Mueve el PageView a esta posición
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }

      // Actualiza el mapa para centrar en este profesional
      if (_sortedMarkers![index].suburb != null) {
        _forceMapMove(_sortedMarkers![index].suburb!, 12.0);
      }
    }
  }

  Set<google_maps.Marker> _buildMarkers() {
    final Set<google_maps.Marker> markers = {};
    final Map<String, List<UsersRecord>> positionGroups = {};

    print('Building markers from ${_sortedMarkers?.length ?? 0} records');

    // Group markers by position
    if (_sortedMarkers != null) {
      for (final user in _sortedMarkers!) {
        print('User suburb raw value: ${user.suburb}');
        // Try to parse the suburb value correctly
        final LatLng? marker =
            user.suburb is LatLng ? user.suburb : parseSuburbValue(user.suburb);

        print('User ${user.uid}: parsing suburb ${user.suburb} -> $marker');

        if (marker != null) {
          final String positionKey = '${marker.latitude},${marker.longitude}';
          if (!positionGroups.containsKey(positionKey)) {
            positionGroups[positionKey] = [];
          }
          positionGroups[positionKey]!.add(user);
        } else {
          print('User ${user.uid} has invalid suburb format: ${user.suburb}');
        }
      }
    }

    // Create markers with offset for overlapping positions
    positionGroups.forEach((positionKey, users) {
      final parts = positionKey.split(',');
      final lat = double.parse(parts[0]);
      final lng = double.parse(parts[1]);

      if (users.length == 1) {
        // Single marker, no offset needed
        final user = users.first;
        // Verify if this user is selected
        // For professionals, never mark as selected
        bool isSelected = widget.isProfessional != true &&
            _selectedUser != null &&
            user.uid == _selectedUser!.uid;

        markers.add(
          google_maps.Marker(
            markerId: google_maps.MarkerId(user.uid),
            position: google_maps.LatLng(lat, lng),
            icon: isSelected
                ? selectedProfessionalMarkerIcon ??
                    google_maps.BitmapDescriptor.defaultMarkerWithHue(
                        google_maps.BitmapDescriptor.hueBlue)
                : userMarkerIcon ??
                    google_maps.BitmapDescriptor.defaultMarkerWithHue(
                        google_maps.BitmapDescriptor.hueViolet),
            onTap: widget.isProfessional == true
                ? null
                : () {
                    final index = _sortedMarkers!.indexOf(user);
                    if (index != -1) {
                      _setPageViewInteraction(true);

                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      _updateSelectedUser(index);

                      // AQUÍ sí movemos el mapa porque el usuario ha tocado el marcador directamente
                      if (user.suburb != null) {
                        _forceMapMove(user.suburb!, 7.0);
                      }
                    }
                  },
            zIndex: isSelected ? 2.0 : 1.0, // Higher zIndex for selected
          ),
        );
      } else {
        // Multiple markers, apply offset to each
        for (int i = 0; i < users.length; i++) {
          final user = users[i];
          // For professionals, never mark as selected
          bool isSelected = widget.isProfessional != true &&
              _selectedUser != null &&
              user.uid == _selectedUser!.uid;

          // Calculate offset in a circular pattern
          final double offsetAmount = 0.0001 * (i + 1); // ~11 meters at equator
          final double angle = (2 * math.pi * i) / users.length;
          final double latOffset = offsetAmount * math.cos(angle);
          final double lngOffset = offsetAmount * math.sin(angle);

          markers.add(
            google_maps.Marker(
              markerId: google_maps.MarkerId(user.uid),
              position: google_maps.LatLng(lat + latOffset, lng + lngOffset),
              icon: isSelected
                  ? selectedProfessionalMarkerIcon ??
                      google_maps.BitmapDescriptor.defaultMarkerWithHue(
                          google_maps.BitmapDescriptor.hueBlue)
                  : userMarkerIcon ??
                      google_maps.BitmapDescriptor.defaultMarkerWithHue(
                          google_maps.BitmapDescriptor.hueViolet),
              // IMPORTANT: Only enable onTap for regular users, disable for professionals
              onTap: widget.isProfessional == true
                  ? null // Explicitly disable onTap for professionals
                  : () {
                      final index = _sortedMarkers!.indexOf(user);
                      if (index != -1) {
                        // Indicate we're interacting
                        _setPageViewInteraction(true);

                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        _updateSelectedUser(index);

                        // Always move to this marker when tapped
                        if (user.suburb != null) {
                          _forceMapMove(user.suburb!, 12.0);
                        }
                      }
                    },
              zIndex: isSelected ? 2.0 : 1.0, // Higher zIndex for selected
            ),
          );
        }
      }
    });

    // Add current location marker only if not a professional
    if (_initialCurrentLocation != null) {
      markers.add(
        google_maps.Marker(
          markerId: google_maps.MarkerId('currentLocation'),
          position: _initialCurrentLocation!,
          icon: currentLocationMarkerIcon ??
              google_maps.BitmapDescriptor.defaultMarkerWithHue(
                  google_maps.BitmapDescriptor.hueRed),
          zIndex: 3.0,
        ),
      );
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    // Set isFirstLoad to false after first build
    if (isFirstLoad) {
      Future.delayed(Duration.zero, () {
        if (mounted) {
          setState(() {
            isFirstLoad = false;
          });
        }
      });
    }

    // Build the markers set only if markers are loaded
    final markers = _markersLoaded ? _buildMarkers() : <google_maps.Marker>{};

    return Stack(
      children: [
        // Map Container - Takes up entire screen
        // Using IgnorePointer to disable map interactions when PageView is being used
        IgnorePointer(
          ignoring: _isInteractingWithPageView,
          child: Container(
            width: widget.width ?? double.infinity,
            height: double.infinity,
            child: google_maps.GoogleMap(
              // IMPORTANTE: Muestra un indicador de carga mientras el mapa se inicializa
              initialCameraPosition: google_maps.CameraPosition(
                target: _defaultAustraliaCenter,
                zoom: 4,
              ),
              onMapCreated: (google_maps.GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                  _mapInitialized = true;
                });

                // Delay to ensure the map is fully loaded - pero no mostramos marcadores todavía
                // hasta que estén cargados completamente
                if (_markersLoaded) {
                  Future.delayed(Duration(milliseconds: 500), () {
                    if (mounted) {
                      _moveToAppropriateLocation();
                    }
                  });
                }
              },
              mapType: google_maps.MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: false,
              mapToolbarEnabled: false,
              // Different zoom limits based on whether it's a professional or regular user
              minMaxZoomPreference: widget.isProfessional == true
                  ? google_maps.MinMaxZoomPreference(4,
                      10) // Lower max zoom (more zoomed out) for professionals
                  : google_maps.MinMaxZoomPreference(4,
                      14), // Higher max zoom (more zoomed in) for regular users
              cameraTargetBounds:
                  google_maps.CameraTargetBounds(australiaBounds),
              markers:
                  markers, // Solo muestra marcadores si están completamente cargados
              onCameraMove: (google_maps.CameraPosition position) {
                FFAppState().update(() {
                  FFAppState().tempLocation = LatLng(
                    position.target.latitude,
                    position.target.longitude,
                  );
                });
                // If there's a lock and the map moves to another position, correct it
                if (_lockToNewLocation && _lockedLocation != null) {
                  // Calculate distance between current position and locked position
                  double distance = _calculateDistance(
                      LatLng(
                          position.target.latitude, position.target.longitude),
                      _lockedLocation!);

                  // If it's too far, force back to the locked position
                  if (distance > 500) {
                    // 500 meters tolerance
                    _forceMapMove(_lockedLocation!, position.zoom);
                    return;
                  }
                }

                // Update zoom level
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

                // Ensure map stays within Australia bounds
                if (!australiaBounds.contains(position.target)) {
                  mapController!.moveCamera(
                    google_maps.CameraUpdate.newLatLngBounds(
                        australiaBounds, 0),
                  );
                }
              },
            ),
          ),
        ),

        // My location button - Repositioned
        Positioned(
          right: 10,
          bottom: 230,
          child: FloatingActionButton(
            onPressed: () {
              // Desactivar el bloqueo cuando se usa el botón de ubicación actual
              setState(() {
                _lockToNewLocation = false;
                _lockedLocation = null;
                _isInteractingWithPageView = false; // Ensure map is interactive

                // También limpia el notificador de nueva ubicación
                newUbicationNotifier.value = null;
              });

              if (_initialCurrentLocation != null) {
                _animateCameraToPosition(_initialCurrentLocation!, 12.0);

                // Actualizar marcadores por cercanía a la ubicación actual
                _sortMarkersByProximity();

                // Seleccionar el primer marcador si es apropiado
                if (_sortedMarkers != null &&
                    _sortedMarkers!.isNotEmpty &&
                    widget.isProfessional != true) {
                  _updateSelectedUser(0);
                  _pageController.jumpToPage(0);
                }
              }
            },
            child: Icon(
              Icons.my_location,
              size: 28,
            ),
          ),
        ),

        // Loading indicator while markers are loading
        if (!_markersLoaded && _isLocatingUser)
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_initialCurrentLocation != null) {
                        setState(() {
                          _markersLoaded = true;
                          _isInteractingWithPageView =
                              false; // Ensure map is interactive
                        });
                        _moveToAppropriateLocation();
                      }
                    },
                    child: Text('Retry Loading Map'),
                  )
                ],
              ),
            ),
          ),

        // PageView positioned at the bottom - Now with gesture detection
        if (widget.isProfessional != true)
          Positioned(
            left: 0,
            right: 0,
            bottom: 45, // Adjust as needed
            child: GestureDetector(
              // This will handle horizontal drags on the PageView area without letting them pass to the map
              onHorizontalDragStart: (_) {
                setState(() {
                  _isInteractingWithPageView = true;
                });
              },
              onHorizontalDragEnd: (_) {
                // Add a small delay before re-enabling map interactions
                Future.delayed(Duration(milliseconds: 300), () {
                  if (mounted) {
                    setState(() {
                      _isInteractingWithPageView = false;
                    });
                  }
                });
              },
              child: Container(
                height: 170,
                // Add a very slight background color to ensure the gesture detector works
                // but still appears transparent to the user
                color: Colors.transparent,
                child: _sortedMarkers != null && _sortedMarkers!.isNotEmpty
                    ? PageView.builder(
                        controller: _pageController,
                        itemCount: _sortedMarkers!.length,
                        onPageChanged: (index) {
                          // Set the interaction flag when PageView is used
                          _setPageViewInteraction(true);

                          // Actualizar el usuario seleccionado
                          _updateSelectedUser(index);

                          // Guardar el usuario actual como el seleccionado
                          // para evitar que se resetee con el reordenamiento
                          final newSelectedUser = _sortedMarkers![index];
                          _selectedUser = newSelectedUser;

                          // SOLUCIÓN: NO movemos el mapa cuando cambia la página
                          // Solo actualizamos el estado para reflejar el cambio de marcador seleccionado
                          setState(() {
                            // Esta llamada actualizará los marcadores mostrando el resaltado correcto
                          });

                          // Re-enable map interactions after a short delay
                          Future.delayed(Duration(milliseconds: 300), () {
                            if (mounted) {
                              setState(() {
                                _isInteractingWithPageView = false;
                              });
                            }
                          });
                        },
                        itemBuilder: (context, index) {
                          final user = _sortedMarkers![index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(
                                    0x00000000), // Fondo completamente transparente
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  // Ensure map is interactive when tapping on a card
                                  setState(() {
                                    _isInteractingWithPageView = false;
                                  });
                                  navigateToProfileInfo(user);
                                },
                                child: V3fv0ritesv3Widget(
                                  profesionalId: user.reference,
                                  isMap: true,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'No professionals match your filters',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    mapController?.dispose();
    newUbicationNotifier.removeListener(_handleLocationChange);
    super.dispose();
  }
}
