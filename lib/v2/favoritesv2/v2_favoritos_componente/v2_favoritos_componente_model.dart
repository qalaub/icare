import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import 'v2_favoritos_componente_widget.dart' show V2FavoritosComponenteWidget;
import 'package:flutter/material.dart';

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
