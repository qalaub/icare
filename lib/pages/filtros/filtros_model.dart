import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'filtros_widget.dart' show FiltrosWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FiltrosModel extends FlutterFlowModel<FiltrosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for distance widget.
  double? distanceValue;
  // State field(s) for age1 widget.
  bool? age1Value;
  // State field(s) for age2 widget.
  bool? age2Value;
  // State field(s) for age3 widget.
  bool? age3Value;
  // State field(s) for support widget.
  bool? supportValue;
  // State field(s) for coordinators widget.
  bool? coordinatorsValue;
  // State field(s) for recovery widget.
  bool? recoveryValue;
  // State field(s) for therapeutic widget.
  bool? therapeuticValue;
  // State field(s) for home widget.
  bool? homeValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
