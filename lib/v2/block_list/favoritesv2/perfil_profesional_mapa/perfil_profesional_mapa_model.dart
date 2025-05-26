import '/flutter_flow/flutter_flow_util.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'perfil_profesional_mapa_widget.dart' show PerfilProfesionalMapaWidget;
import 'package:flutter/material.dart';

class PerfilProfesionalMapaModel
    extends FlutterFlowModel<PerfilProfesionalMapaWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> usersToAdd = [];
  void addToUsersToAdd(DocumentReference item) => usersToAdd.add(item);
  void removeFromUsersToAdd(DocumentReference item) => usersToAdd.remove(item);
  void removeAtIndexFromUsersToAdd(int index) => usersToAdd.removeAt(index);
  void insertAtIndexInUsersToAdd(int index, DocumentReference item) =>
      usersToAdd.insert(index, item);
  void updateUsersToAddAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      usersToAdd[index] = updateFn(usersToAdd[index]);

  ///  State fields for stateful widgets in this component.

  // Model for MembresiaLogo component.
  late MembresiaLogoModel membresiaLogoModel;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {
    membresiaLogoModel = createModel(context, () => MembresiaLogoModel());
  }

  @override
  void dispose() {
    membresiaLogoModel.dispose();
  }
}
