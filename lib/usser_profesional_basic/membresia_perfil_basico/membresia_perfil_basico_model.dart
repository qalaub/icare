import '/flutter_flow/flutter_flow_util.dart';
import 'membresia_perfil_basico_widget.dart' show MembresiaPerfilBasicoWidget;
import 'package:flutter/material.dart';

class MembresiaPerfilBasicoModel
    extends FlutterFlowModel<MembresiaPerfilBasicoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
