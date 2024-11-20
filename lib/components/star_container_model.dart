import '/components/estrellas_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'star_container_widget.dart' show StarContainerWidget;
import 'package:flutter/material.dart';

class StarContainerModel extends FlutterFlowModel<StarContainerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for estrellas component.
  late EstrellasModel estrellasModel;

  @override
  void initState(BuildContext context) {
    estrellasModel = createModel(context, () => EstrellasModel());
  }

  @override
  void dispose() {
    estrellasModel.dispose();
  }
}
