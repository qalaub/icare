import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/user/mapbuscar/mapbuscar_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'register_business1_widget.dart' show RegisterBusiness1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterBusiness1Model extends FlutterFlowModel<RegisterBusiness1Widget> {
  ///  Local state fields for this page.

  bool? isLoading;

  List<QueryResultsStruct> queryResults = [];
  void addToQueryResults(QueryResultsStruct item) => queryResults.add(item);
  void removeFromQueryResults(QueryResultsStruct item) =>
      queryResults.remove(item);
  void removeAtIndexFromQueryResults(int index) => queryResults.removeAt(index);
  void insertAtIndexInQueryResults(int index, QueryResultsStruct item) =>
      queryResults.insert(index, item);
  void updateQueryResultsAtIndex(
          int index, Function(QueryResultsStruct) updateFn) =>
      queryResults[index] = updateFn(queryResults[index]);

  String? newUbication;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^(?!.*\\b(?:[Uu]suario|[Pp]erfil)\\b).*\$').hasMatch(val)) {
      return 'Please enter a valid name.';
    }
    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for company widget.
  FocusNode? companyFocusNode;
  TextEditingController? companyTextController;
  String? Function(BuildContext, String?)? companyTextControllerValidator;
  String? _companyTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in email widget.
  int? emailExists;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for query widget.
  FocusNode? queryFocusNode;
  TextEditingController? queryTextController;
  String? Function(BuildContext, String?)? queryTextControllerValidator;
  // Stores action output result for [Backend Call - API (getSuggestionMapProfesional)] action in query widget.
  ApiCallResponse? apiResultuev;
  // Stores action output result for [Backend Call - API (getPlace)] action in mapbuscar widget.
  ApiCallResponse? newPlace;

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    companyTextControllerValidator = _companyTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    companyFocusNode?.dispose();
    companyTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    queryFocusNode?.dispose();
    queryTextController?.dispose();
  }
}
