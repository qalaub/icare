import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/home_vista_cuidador_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/perfil_profesional_mapa/perfil_profesional_mapa_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import 'home_search_widget.dart' show HomeSearchWidget;
import 'package:flutter/material.dart';

class HomeSearchModel extends FlutterFlowModel<HomeSearchWidget> {
  ///  Local state fields for this page.

  DocumentReference? currentProfesionalMap;

  bool showMap = false;

  List<QueryResultsStruct> queryResults = [];
  void addToQueryResults(QueryResultsStruct item) => queryResults.add(item);
  void removeFromQueryResults(QueryResultsStruct item) =>
      queryResults.remove(item);
  void removeAtIndexFromQueryResults(int index) => queryResults.removeAt(index);
  void insertAtIndexInQueryResults(int index, QueryResultsStruct item) =>
      queryResults.insert(index, item);
  void updateQueryResultsAtIndex(
          int index, Function(QueryResultsStruct) updateFn) =>
      queryResults[index] = updateFn(queryResults[index]);

  bool isLoading = false;

  String? newUbication;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for query widget.
  FocusNode? queryFocusNode;
  TextEditingController? queryTextController;
  String? Function(BuildContext, String?)? queryTextControllerValidator;
  // Stores action output result for [Backend Call - API (getSuggestionMap)] action in query widget.
  ApiCallResponse? apiResultuev;
  // Stores action output result for [Backend Call - API (getPlace)] action in mapbuscar widget.
  ApiCallResponse? newPlace;
  // Models for PerfilProfesionalMapa dynamic component.
  late FlutterFlowDynamicModels<PerfilProfesionalMapaModel>
      perfilProfesionalMapaModels;
  // Model for HomeVistaCuidador component.
  late HomeVistaCuidadorModel homeVistaCuidadorModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    perfilProfesionalMapaModels =
        FlutterFlowDynamicModels(() => PerfilProfesionalMapaModel());
    homeVistaCuidadorModel =
        createModel(context, () => HomeVistaCuidadorModel());
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    queryFocusNode?.dispose();
    queryTextController?.dispose();

    perfilProfesionalMapaModels.dispose();
    homeVistaCuidadorModel.dispose();
    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }

  /// Action blocks.
  Future pruebaBlock(BuildContext context) async {}
}
