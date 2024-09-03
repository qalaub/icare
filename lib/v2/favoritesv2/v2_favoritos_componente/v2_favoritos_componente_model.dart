import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'v2_favoritos_componente_widget.dart' show V2FavoritosComponenteWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class V2FavoritosComponenteModel
    extends FlutterFlowModel<V2FavoritosComponenteWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AddFavorites component.
  late AddFavoritesModel addFavoritesModel;

  @override
  void initState(BuildContext context) {
    addFavoritesModel = createModel(context, () => AddFavoritesModel());
  }

  @override
  void dispose() {
    addFavoritesModel.dispose();
  }
}
