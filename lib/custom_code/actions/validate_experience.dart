// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> validateExperience(
  String experienceInput,
  int max,
) async {
  final value = int.tryParse(experienceInput);
  if (value == null) {
    return 'Please enter a valid number';
  } else if (value > max) {
    return 'Maximum allowed: $max years';
  } else {
    return '';
  }
}
