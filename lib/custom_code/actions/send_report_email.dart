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

Future<bool> sendReportEmail(
  String user1,
  String user2,
  String reason,
  String userEmail,
  String additionalMessage,
) async {
  final String serviceId = "service_ztseo7e";
  final String templateId =
      "template_dpvtwsq"; // Reemplaza con tu template real
  final String userId = "qQNfELIJYyyVBPYQ0";
  final String accessToken = "EBFuwIlnb06u6ZVZz5ye4";

  final Uri url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

  final Map<String, dynamic> data = {
    "service_id": serviceId,
    "template_id": templateId,
    "user_id": userId,
    "accessToken": accessToken,
    "template_params": {
      "userEmail": userEmail,
      "user1": user1,
      "user2": user2,
      "reason": reason,
      "additionalMessage": additionalMessage,
    }
  };

  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      print("✅ Email enviado correctamente.");
      return true;
    } else {
      print("⚠️ Error al enviar el email: ${response.body}");
      return false;
    }
  } catch (e) {
    print("❌ Excepción: $e");
    return false;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
