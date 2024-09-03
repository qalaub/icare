import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/user/mapbuscar/mapbuscar_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'register_user1_widget.dart' show RegisterUser1Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class RegisterUser1Model extends FlutterFlowModel<RegisterUser1Widget> {
  ///  Local state fields for this page.

  String? newUbication;

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

  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameTextController;
  String? Function(BuildContext, String?)? lastnameTextControllerValidator;
  String? _lastnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  final dateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dateTextControllerValidator;
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
    lastnameTextControllerValidator = _lastnameTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    queryFocusNode?.dispose();
    queryTextController?.dispose();
  }
}
