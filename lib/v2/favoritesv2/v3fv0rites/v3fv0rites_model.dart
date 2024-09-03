import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'v3fv0rites_widget.dart' show V3fv0ritesWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class V3fv0ritesModel extends FlutterFlowModel<V3fv0ritesWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? chat;
  // Model for AddFavorites component.
  late AddFavoritesModel addFavoritesModel;
  // Model for MembresiaLogo component.
  late MembresiaLogoModel membresiaLogoModel;

  @override
  void initState(BuildContext context) {
    addFavoritesModel = createModel(context, () => AddFavoritesModel());
    membresiaLogoModel = createModel(context, () => MembresiaLogoModel());
  }

  @override
  void dispose() {
    addFavoritesModel.dispose();
    membresiaLogoModel.dispose();
  }
}
