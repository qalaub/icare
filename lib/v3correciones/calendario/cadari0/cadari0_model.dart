import '/components/calendario_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cadari0_widget.dart' show Cadari0Widget;
import 'package:flutter/material.dart';

class Cadari0Model extends FlutterFlowModel<Cadari0Widget> {
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
