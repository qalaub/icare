import '/flutter_flow/flutter_flow_util.dart';
import 'membresias_v2_widget.dart' show MembresiasV2Widget;
import 'package:flutter/material.dart';

class MembresiasV2Model extends FlutterFlowModel<MembresiasV2Widget> {
  ///  Local state fields for this page.

  bool basic = false;

  bool standar = false;

  bool premiun = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
