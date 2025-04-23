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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> sendConfirmEmailUser(
  String firstName,
  String lastName,
  String userEmail,
  String newEmail,
  String confirmEmail,
) async {
  const String apiUrl = "https://api.emailjs.com/api/v1.0/email/send";

  final Map<String, dynamic> emailData = {
    "service_id": "service_ztseo7e",
    "template_id": "template_5hr76dg",
    "user_id": "qQNfELIJYyyVBPYQ0",
    "accessToken": "EBFuwIlnb06u6ZVZz5ye4",
    "template_params": {
      "firstName": firstName,
      "lastName": lastName,
      "userEmail": userEmail,
      "newEmail": newEmail,
      "confirmEmail": confirmEmail,
    }
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(emailData),
  );

  print("Status Code: ${response.statusCode}");
  print("Response: ${response.body}");

  return response.statusCode == 200;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
