import '/components/calendario_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadari0_copy_widget.dart' show Cadari0CopyWidget;
import 'package:flutter/material.dart';

class Cadari0CopyModel extends FlutterFlowModel<Cadari0CopyWidget> {
  ///  Local state fields for this page.

  bool trueS = true;

  ///  State fields for stateful widgets in this page.

  // Model for calendarioCopy component.
  late CalendarioCopyModel calendarioCopyModel;

  @override
  void initState(BuildContext context) {
    calendarioCopyModel = createModel(context, () => CalendarioCopyModel());
  }

  @override
  void dispose() {
    calendarioCopyModel.dispose();
  }
}
