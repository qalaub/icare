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
  const int meters = 10;
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
) {
  return '$user1 has reported $user2 for the following reason: $reason.';
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
    return 4;
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
