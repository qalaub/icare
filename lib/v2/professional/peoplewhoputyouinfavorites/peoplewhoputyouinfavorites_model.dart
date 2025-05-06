import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar_empleado/navbar_empleado_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/n_e_w_spremiun/navbar_professional/navbar_professional_widget.dart';
import '/index.dart';
import 'peoplewhoputyouinfavorites_widget.dart'
    show PeoplewhoputyouinfavoritesWidget;
import 'package:flutter/material.dart';

class PeoplewhoputyouinfavoritesModel
    extends FlutterFlowModel<PeoplewhoputyouinfavoritesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in peoplewhoputyouinfavorites widget.
  ChatsRecord? chats;
  // Model for NavbarProfessional component.
  late NavbarProfessionalModel navbarProfessionalModel;
  // Model for NavbarEmpleado component.
  late NavbarEmpleadoModel navbarEmpleadoModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    navbarProfessionalModel =
        createModel(context, () => NavbarProfessionalModel());
    navbarEmpleadoModel = createModel(context, () => NavbarEmpleadoModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    navbarProfessionalModel.dispose();
    navbarEmpleadoModel.dispose();
    navbarPremiunModel.dispose();
  }
}
