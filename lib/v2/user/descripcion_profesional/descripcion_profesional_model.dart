import '/components/calendario_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/professional/imganes/imganes_widget.dart';
import 'descripcion_profesional_widget.dart' show DescripcionProfesionalWidget;
import 'package:flutter/material.dart';

class DescripcionProfesionalModel
    extends FlutterFlowModel<DescripcionProfesionalWidget> {
  ///  Local state fields for this component.

  bool more = false;

  bool services = true;

  ///  State fields for stateful widgets in this component.

  // Model for imganes component.
  late ImganesModel imganesModel;
  // Model for calendario component.
  late CalendarioModel calendarioModel;
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
  void initState(BuildContext context) {
    imganesModel = createModel(context, () => ImganesModel());
    calendarioModel = createModel(context, () => CalendarioModel());
  }

  @override
  void dispose() {
    imganesModel.dispose();
    calendarioModel.dispose();
  }
}
