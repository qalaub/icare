import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'register_user1_widget.dart' show RegisterUser1Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

  String dateError = 'Field is required';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for formC widget.
  ScrollController? formC;
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
  late MaskTextInputFormatter dateMask;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  // State field(s) for email2 widget.
  FocusNode? email2FocusNode;
  TextEditingController? email2TextController;
  String? Function(BuildContext, String?)? email2TextControllerValidator;
  String? _email2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter a valid e-mail addres';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in email2 widget.
  int? emailExists;
  // State field(s) for emailconfirm2 widget.
  FocusNode? emailconfirm2FocusNode;
  TextEditingController? emailconfirm2TextController;
  String? Function(BuildContext, String?)? emailconfirm2TextControllerValidator;
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
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formV;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - API (getPlace)] action in mapbuscar widget.
  ApiCallResponse? newPlace;

  @override
  void initState(BuildContext context) {
    formC = ScrollController();
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastnameTextControllerValidator = _lastnameTextControllerValidator;
    email2TextControllerValidator = _email2TextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    formC?.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    email2FocusNode?.dispose();
    email2TextController?.dispose();

    emailconfirm2FocusNode?.dispose();
    emailconfirm2TextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    queryFocusNode?.dispose();
    queryTextController?.dispose();

    columnController?.dispose();
    listViewController?.dispose();
  }
}
