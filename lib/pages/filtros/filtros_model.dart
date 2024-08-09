import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filtros_widget.dart' show FiltrosWidget;
import 'package:flutter/material.dart';

class FiltrosModel extends FlutterFlowModel<FiltrosWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for distance widget.
  double? distanceValue;
  // State field(s) for age1 widget.
  bool? age1Value;
  // State field(s) for age2 widget.
  bool? age2Value;
  // State field(s) for age3 widget.
  bool? age3Value;
  // State field(s) for support widget.
  bool? supportValue1;
  // State field(s) for support widget.
  bool? supportValue2;
  // State field(s) for coordinators widget.
  bool? coordinatorsValue;
  // State field(s) for therapeutic widget.
  bool? therapeuticValue;
  // State field(s) for home widget.
  bool? homeValue;
  // State field(s) for language widget.
  String? languageValue;
  FormFieldController<String>? languageValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
