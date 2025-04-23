import '/flutter_flow/flutter_flow_util.dart';
import 'other_widget.dart' show OtherWidget;
import 'package:flutter/material.dart';

class OtherModel extends FlutterFlowModel<OtherWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for otherbody widget.
  FocusNode? otherbodyFocusNode;
  TextEditingController? otherbodyTextController;
  String? Function(BuildContext, String?)? otherbodyTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    otherbodyFocusNode?.dispose();
    otherbodyTextController?.dispose();
  }
}
