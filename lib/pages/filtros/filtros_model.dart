import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filtros_widget.dart' show FiltrosWidget;
import 'package:flutter/material.dart';

class FiltrosModel extends FlutterFlowModel<FiltrosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for distance widget.
  double? distanceValue;
  // State field(s) for age widget.
  double? ageValue;
  // State field(s) for home widget.
  bool? homeValue;
  // State field(s) for therapeutic widget.
  bool? therapeuticValue;
  // State field(s) for coordinators widget.
  bool? coordinatorsValue;
  // State field(s) for support widget.
  bool? supportValue;
  // State field(s) for language widget.
  String? languageValue;
  FormFieldController<String>? languageValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
