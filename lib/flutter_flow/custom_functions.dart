import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng? changeUbication(LatLng ubication) {
  // Radio de la Tierra en metros
  const double earthRadius = 6371000;
  const int meters = 5;
  // Calcular el cambi  o en latitud
  double deltaLatitude = meters / earthRadius;
  // Convertir de radianes a grados
  double newLatitude = ubication.latitude + (deltaLatitude * 180 / math.pi);
  // Calcular el cambio en longitud
  double deltaLongitude =
      meters / (earthRadius * math.cos(math.pi * ubication.latitude / 180));
  // Convertir de radianes a grados
  double newLongitude = ubication.longitude + (deltaLongitude * 180 / math.pi);
  return new LatLng(newLatitude, newLongitude);
}

String? fileToStringPath(FFUploadedFile? image) {
  if (image == null) {
    return null;
  }
  return image.name;
}

String verifyImageIsSet(String image) {
  return image;
}

String handlePhone(String phone) {
  if (!phone.startsWith("04")) {
    phone = "04" + phone;
  }
  return phone;
}

bool verifyCorrectPassword(String password) {
  RegExp regex = RegExp(
      r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,50}$');
  return regex.hasMatch(password);
}

String? contactTextAdd(String? name) {
  return "Contact $name";
}

String? concatStrings(
  String? str1,
  String? str2,
  String? space,
) {
  // concat two strings parameters
  // Use the space parameter if it is not null, otherwise use a space
  String separator = space ?? ' ';
  return str1 == null || str2 == null ? null : '$str1$separator$str2';
}

String generateRandomCode() {
  final random = math.Random();
  final letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ12';
  final codeLength = 15;
  final codeUnits = List.generate(
    codeLength,
    (index) => letters.codeUnitAt(random.nextInt(letters.length)),
  );
  return String.fromCharCodes(codeUnits);
}

bool isOdd(int number) {
  if (number % 2 != 0) return true;
  return false;
}

int addDays(
  int seconds,
  int daysToAdd,
) {
  /// Convertir los segundos a DateTime
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);

  /// Agregar los días especificados
  DateTime newDateTime = dateTime.add(Duration(days: daysToAdd));

  /// Convertir de nuevo a segundos
  return newDateTime.millisecondsSinceEpoch ~/ 1000;
}

int getRestantDays(
  DateTime dateStart,
  int days,
) {
  // Fecha actual
  DateTime currentDate = DateTime.now();

  // Fecha de finalización de la membresía
  DateTime endDate = dateStart.add(Duration(days: days));

  // Calcular la diferencia en días
  int remainingDays = endDate.difference(currentDate).inDays;

  // Si los días restantes son negativos, devolver 0 (la membresía ya expiró)
  return remainingDays > 0 ? remainingDays : 0;
}

LatLng stringToLatLng(String ubication) {
  // Dividimos la cadena usando la coma como delimitador.
  List<String> parts = ubication.split(',');

  // Convertimos las partes en valores numéricos.
  double latitude = double.parse(parts[0].trim());
  double longitude = double.parse(parts[1].trim());

  // Creamos y retornamos el objeto LatLng.
  return LatLng(latitude, longitude);
}

String generateBodyForEmail(
  String user1,
  String user2,
  String reason,
  String? additionalMessage,
) {
  String message;

  // Normalizar la razón a minúsculas para comparación
  String normalizedReason = reason.trim().toLowerCase();

  switch (normalizedReason) {
    case 'harassment':
      message = '$user1 has reported $user2 for harassment.';
      break;
    case 'he pretends to be someone else':
      message = '$user1 has reported $user2 for impersonation.';
      break;
    case 'share inappropriate content':
      message = '$user1 has reported $user2 for sharing inappropriate content.';
      break;
    case 'language that incites hatred':
      message =
          '$user1 has reported $user2 for using language that incites hatred.';
      break;
    case 'unauthorized sales':
      message = '$user1 has reported $user2 for unauthorized sales.';
      break;
    case 'scams':
      message = '$user1 has reported $user2 for scams.';
      break;
    case 'others':
      message = '$user1 has reported $user2 for the following reason: Others.';
      if (additionalMessage != null && additionalMessage.trim().isNotEmpty) {
        message += "\n\nAdditional details: $additionalMessage";
      }
      break;
    default:
      message = '$user1 has reported $user2 for the following reason: $reason.';
  }

  return message;
}

int plusOne(double n) {
  return (n + 1).toInt();
}

DateTime convertStringToDate(String dateStr) {
  List<String> dateParts = dateStr.split('/');
  int day = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[2]);

  return DateTime(year, month, day);
}

String suguestionPlan(
  bool firts,
  bool second,
  bool tree,
  bool four,
) {
  if (firts) 'Premiun';
  if (firts && tree) return 'Premiun';
  if (second && four) return 'Standar';
  if (four) return 'Standar';
  if (second) return 'Standar';
  if (tree) 'Premiun';
  return 'Basic';
}

String emptyString() {
  return "";
}

int restOne(int index) {
  return index - 1;
}

int averagueReviews(List<ReviewsRecord> reviews) {
  // averague of Reviews from colletion reviews
  if (reviews.isEmpty) {
    return 0;
  }
  int sum = 0;
  for (final review in reviews) {
    sum += review.num;
  }
  return (sum / reviews.length).round();
}

bool? validateDate(String dateString) {
  try {
    final format = RegExp(r'(\d{2})/(\d{2})/(\d{4})');
    final match = format.firstMatch(dateString);

    if (match == null) {
      throw FormatException(); // El formato no coincide
    }

    final day = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final year = int.parse(match.group(3)!);

    final birthDate = DateTime(year, month, day);
    final now = DateTime.now();
    final adulthoodDate = DateTime(now.year - 18, now.month, now.day);

    if (birthDate.isBefore(adulthoodDate)) {
      return true; // La persona es mayor de edad
    } else {
      // Mensaje de error corto
      print('Must be 18+ years old.');
      return false; // La persona no es mayor de edad
    }
  } catch (e) {
    return false; // Cambié a `false` para manejar casos de error de formato
  }
}

bool verifyDistanceFilter(
  String? current,
  LatLng user,
  int zoom,
) {
  if (current == null || user.toString().isEmpty) {
    return true;
  }
  // Función para convertir grados a radianes
  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  // Función para calcular la distancia entre dos puntos en la superficie de una esfera
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double radius = 6371; // Radio de la Tierra en kilómetros
    final double dLat = _degreesToRadians(lat2 - lat1);
    final double dLon = _degreesToRadians(lon2 - lon1);
    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(lat1)) *
            math.cos(_degreesToRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return radius * c * 1000; // Convertir a metros
  }

  // Parsear el string current para obtener latitud y longitud
  final parts = current.split(',');
  if (parts.length != 2) {
    return true;
  }
  final double currentLat = double.tryParse(parts[0]) ?? 0.0;
  final double currentLng = double.tryParse(parts[1]) ?? 0.0;

  // Calcular la distancia usando la fórmula de Haversine
  final double distance = _calculateDistance(
    currentLat,
    currentLng,
    user.latitude,
    user.longitude,
  );

  const double base = 2;

  // Evita que el zoom sea menor a 10 y ajusta el crecimiento
  double adjustedZoom = zoom - 100;
  if (adjustedZoom <= 0) {
    adjustedZoom = 5;
  }
  if (adjustedZoom == 150) adjustedZoom = 1000;
  double multiplier = 1000.0 * (adjustedZoom * 1.8);
  return distance <=
      ((multiplier) * (math.log(adjustedZoom + 20) / math.log(base + 2)))
          .toInt();

  // Retornar true si la distancia es menor o igual a 100 metros
  // return distance <= (zoom / 10) * 100000; // 100 metros
}

bool filterProfessionals(
  UsersRecord user,
  double distance,
  List<String> services,
  List<String> age,
  LatLng current,
  List<String> schedule,
  int zoom,
) {
  /// FUNCIONES AUXILIARES
  double _degreesToRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  double _calculateDistanceAustralia(
      double lat1, double lon1, double lat2, double lon2) {
    const double radius = 6371; // Radio de la Tierra en kilómetros

    // Diferencias de latitud y longitud en radianes
    final double dLat = _degreesToRadians(lat2 - lat1);
    final double dLon = _degreesToRadians(lon2 - lon1);

    // Latitud promedio de Australia (~25 grados)
    const double avgLatAustralia = -25.0;
    final double scaleFactor = math.cos(_degreesToRadians(avgLatAustralia));

    // Cálculo de la distancia usando la fórmula del haversine
    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_degreesToRadians(lat1)) *
            math.cos(_degreesToRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    // Distancia en kilómetros
    final double distance = radius * c;

    // Ajuste de la distancia horizontal con el factor de escala
    return distance * scaleFactor;
  }

  /// VALIDACIONES INICIALES
  if (user.suburb == null || current == null) return false;

  // Cálculo de la distancia considerando la proyección de Australia
  LatLng userSuburb = user.suburb ?? current;
  double userDistance = _calculateDistanceAustralia(
    current.latitude,
    current.longitude,
    userSuburb.latitude,
    userSuburb.longitude,
  );

  double multiplier = zoom * 0.15;
  multiplier = multiplier * (math.log(zoom) / math.log(1.1));
  print(multiplier);
  if (zoom == 250) multiplier = 3200;
  // Filtrar por distancia
  if (userDistance > (distance * (multiplier / 1000))) {
    return false;
  }

  /// FILTROS ADICIONALES

  // Filtrar por servicios ofrecidos, solo si se han seleccionado filtros de servicio
  if (services.isNotEmpty) {
    if (user.serviceType == null ||
        !user.serviceType.any((service) => services.contains(service))) {
      return false;
    }
  }

  // Filtrar por rango de edad, solo si se ha seleccionado algún filtro de edad
  if (age.isNotEmpty) {
    if (user.age == null || !age.contains(user.age)) {
      return false;
    }
  }

  // Si pasa todos los filtros, retorna true
  return true;
}

String upperCaseFirstLetter(String word) {
  if (word.isEmpty) {
    return '';
  }

  List<String> words = word.split(' ');
  List<String> capitalizedWords = [];

  for (String w in words) {
    if (w.isNotEmpty) {
      // Capitaliza la primera letra y concatena el resto en minúsculas
      String capitalizedWord =
          w[0].toUpperCase() + w.substring(1).toLowerCase();
      capitalizedWords.add(capitalizedWord);
    } else {
      capitalizedWords.add(w); // Para manejar palabras vacías
    }
  }

  return capitalizedWords.length > 1
      ? capitalizedWords.join(' ')
      : capitalizedWords[0];
}

int getLengthString(String str) {
  // get Length String
  return str.length;
}

String latLngToString(LatLng latlng) {
  return '${latlng.latitude}, ${latlng.longitude}';
}

String formatnameStreet(String input) {
  // Dividir la cadena por comas
  List<String> parts = input.split(',');

  // Si el formato es estándar (calle, suburbio+estado+postal, país)
  if (parts.length >= 3) {
    // Se toma la segunda parte (índice 1) que contiene el suburbio junto a estado y postal
    String suburbPart = parts[1].trim();
    List<String> words = suburbPart.split(' ');

    // Conjunto de abreviaturas de estados australianos
    final stateCodes = {'VIC', 'NSW', 'QLD', 'WA', 'SA', 'TAS', 'ACT', 'NT'};

    // Remover palabras finales que sean estados o códigos postales
    while (words.isNotEmpty &&
        (stateCodes.contains(words.last.toUpperCase()) ||
            RegExp(r'^\d+$').hasMatch(words.last))) {
      words.removeLast();
    }
    return words.join(' ').trim();
  }
  // Si se trata de una dirección con plus code (única coma)
  else if (parts.length == 2) {
    // Tomar la parte antes de la coma
    String firstPart = parts[0].trim();
    List<String> tokens = firstPart.split(' ');

    // Si el primer token es un plus code (contiene '+'), lo eliminamos
    if (tokens.isNotEmpty && tokens[0].contains('+')) {
      tokens.removeAt(0);
    }

    // Si los dos últimos tokens forman un nombre de estado completo (ej: "Australia Meridional"), eliminarlos
    if (tokens.length >= 2 &&
        tokens[tokens.length - 2] == "Australia" &&
        tokens[tokens.length - 1] == "Meridional") {
      tokens.removeRange(tokens.length - 2, tokens.length);
    }
    // O bien, remover de atrás tokens que sean abreviaturas de estado o códigos postales
    final stateCodes = {'VIC', 'NSW', 'QLD', 'WA', 'SA', 'TAS', 'ACT', 'NT'};
    while (tokens.isNotEmpty &&
        (stateCodes.contains(tokens.last.toUpperCase()) ||
            RegExp(r'^\d+$').hasMatch(tokens.last))) {
      tokens.removeLast();
    }
    return tokens.join(' ').trim();
  }

  return "Location"; // Formato no reconocido
}

String extractStateAndPostalCode(String input) {
  // Método directo: buscar el patrón "NSW 2716" en cualquier parte de la cadena
  RegExp directRegex = RegExp(r'([A-Z]{2,3})\s+(\d{4})');
  Iterable<Match> matches = directRegex.allMatches(input);

  // Si encontramos coincidencias, usar la primera
  if (matches.isNotEmpty) {
    Match firstMatch = matches.first;
    String state = firstMatch.group(1)!;
    String postalCode = firstMatch.group(2)!;
    return "$state, $postalCode";
  }

  // Método alternativo: dividir por comas y buscar en cada parte
  List<String> parts = input.split(',');

  for (String part in parts) {
    String trimmedPart = part.trim();

    // Buscar patrón estado + código postal en esta parte
    Match? partMatch = directRegex.firstMatch(trimmedPart);
    if (partMatch != null) {
      String state = partMatch.group(1)!;
      String postalCode = partMatch.group(2)!;
      return "$state, $postalCode";
    }

    // Verificar si esta parte tiene un código postal de 4 dígitos
    RegExp postalRegex = RegExp(r'\b(\d{4})\b');
    Match? postalMatch = postalRegex.firstMatch(trimmedPart);

    if (postalMatch != null) {
      // Buscar estado cerca del código postal
      String postalCode = postalMatch.group(0)!;

      // Buscar código de estado antes del código postal
      RegExp stateBeforeRegex = RegExp(r'([A-Z]{2,3})\s+' + postalCode);
      Match? stateMatch = stateBeforeRegex.firstMatch(trimmedPart);

      if (stateMatch != null) {
        String state = stateMatch.group(1)!;
        return "$state, $postalCode";
      }

      // Si no encontramos el estado en esta parte pero sí el código postal,
      // buscar en las palabras anteriores
      List<String> words = trimmedPart.split(' ');
      for (int i = 0; i < words.length; i++) {
        if (words[i].contains(postalCode) && i > 0) {
          String prevWord = words[i - 1];
          if (RegExp(r'^[A-Z]{2,3}$').hasMatch(prevWord)) {
            return "$prevWord, $postalCode";
          }
        }
      }
    }
  }

  // Buscar específicamente los estados australianos seguidos de códigos postales
  List<String> australianStates = [
    'NSW',
    'VIC',
    'QLD',
    'SA',
    'WA',
    'TAS',
    'NT',
    'ACT'
  ];

  for (String state in australianStates) {
    // Buscar el estado seguido de un código postal, con posibles caracteres entre ellos
    RegExp statePostalPattern = RegExp('$state[\\s,]*\\s*(\\d{4})');
    Match? stateMatch = statePostalPattern.firstMatch(input);

    if (stateMatch != null) {
      String postalCode = stateMatch.group(1)!;
      return "$state, $postalCode";
    }
  }

  // Última opción: buscar cualquier código postal de 4 dígitos y suponer el estado más común
  RegExp anyPostalRegex = RegExp(r'\b(\d{4})\b');
  Match? anyPostalMatch = anyPostalRegex.firstMatch(input);

  if (anyPostalMatch != null) {
    // Verificar si hay alguna pista de estado en la dirección
    String postalCode = anyPostalMatch.group(0)!;

    // Buscar en un contexto más amplio alrededor del código postal
    int postalIndex = input.indexOf(postalCode);
    int startContext = math.max(0, postalIndex - 20);
    int endContext = math.min(input.length, postalIndex + 20);
    String context = input.substring(startContext, endContext);

    for (String state in australianStates) {
      if (context.contains(state)) {
        return "$state, $postalCode";
      }
    }
  }

  return "NSW, 2781"; // Valor predeterminado si no se encuentra nada
}

int getDistance(
  LatLng distance,
  LatLng current,
) {
  /// Constante: Radio promedio de la Tierra en km
  const double earthRadius = 6371;
  LatLng userSuburb = distance;

  // Diferencias de latitud y longitud en radianes
  double dLat = (userSuburb.latitude - current.latitude) * math.pi / 180;
  double dLon = (userSuburb.longitude - current.longitude) * math.pi / 180;

  // Conversión de coordenadas a radianes
  double lat1 = current.latitude * math.pi / 180;
  double lat2 = userSuburb.latitude * math.pi / 180;

  // Fórmula de Haversine
  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1) * math.cos(lat2) * math.sin(dLon / 2) * math.sin(dLon / 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  int userDistance = (earthRadius * c) as int;
  return userDistance;
}

int doubleToInt(double number) {
  // double to int
  return number.toInt();
}

List<DocumentReference> reverseArray(List<DocumentReference> users) {
  return users.reversed.toList();
}

String? trimEmail(String? email) {
  return email?.trim();
}

String cleanEmailInput(String email) {
  // Convert to lowercase first
  String cleanedEmail = email.toLowerCase();

  // Remove spaces
  cleanedEmail = cleanedEmail.replaceAll(' ', '');

  // Obtiene la parte del dominio (.com, .es, etc.)
  final domainMatch = RegExp(r'\.[a-z]{2,}$').firstMatch(cleanedEmail);

  // Si encontró un dominio válido, trunca después de él
  if (domainMatch != null) {
    int endIndex = domainMatch.end;
    if (endIndex < cleanedEmail.length) {
      cleanedEmail = cleanedEmail.substring(0, endIndex);
    }
  }

  return cleanedEmail;
}

List<UsersRecord> filterProfessionalsByDistance(
  List<UsersRecord> professionals,
  LatLng? userLocation,
  double maxDistanceKm,
) {
  double _toRad(double deg) => deg * (math.pi / 180);

  double _haversineDistance(LatLng a, LatLng b) {
    const R = 6371; // km
    final dLat = _toRad(b.latitude - a.latitude);
    final dLon = _toRad(b.longitude - a.longitude);
    final lat1 = _toRad(a.latitude);
    final lat2 = _toRad(b.latitude);

    final hav = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1) *
            math.cos(lat2) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    return 2 * R * math.asin(math.sqrt(hav));
  }

  // Si userLocation es null, retornar todos los profesionales
  if (userLocation == null) {
    return professionals;
  }

  final filtered = professionals.where((user) {
    final LatLng? professionalLocation = user.suburb;
    if (professionalLocation == null) return false;

    final distance = _haversineDistance(userLocation, professionalLocation);
    return distance <= maxDistanceKm;
  }).toList();

  // Si no hay resultados cercanos, retornar todos para evitar lista vacía
  return filtered.isEmpty ? professionals : filtered;
}

int getMaxExperience(String ageRangeFull) {
  const maxExpMap = {
    '18-25 years': 7,
    '25-40 years': 15,
    '40-65+ years': 30,
  };
  return maxExpMap[ageRangeFull] ?? 0;
}

bool validatePhoneNumber(String input) {
  final regex = RegExp(r'^\d{10}$');
  return regex.hasMatch(input);
}
