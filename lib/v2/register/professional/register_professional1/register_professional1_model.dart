import '/flutter_flow/flutter_flow_util.dart';
import 'register_professional1_widget.dart' show RegisterProfessional1Widget;
import 'package:flutter/material.dart';

class RegisterProfessional1Model
    extends FlutterFlowModel<RegisterProfessional1Widget> {
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

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 16) {
      return 'Maximum 16 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^04\\s?(\\d{2}\\s?\\d{3}\\s?\\d{3})\$').hasMatch(val)) {
      return 'Invalid format. Use 0453463465';
    }
    return null;
  }

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    companyTextControllerValidator = _companyTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    companyFocusNode?.dispose();
    companyTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
