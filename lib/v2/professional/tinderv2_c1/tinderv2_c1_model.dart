import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/professional/mensage_tinder/mensage_tinder_widget.dart';
import '/index.dart';
import 'tinderv2_c1_widget.dart' show Tinderv2C1Widget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class Tinderv2C1Model extends FlutterFlowModel<Tinderv2C1Widget> {
  ///  Local state fields for this page.

  List<DocumentReference> userToAdd = [];
  void addToUserToAdd(DocumentReference item) => userToAdd.add(item);
  void removeFromUserToAdd(DocumentReference item) => userToAdd.remove(item);
  void removeAtIndexFromUserToAdd(int index) => userToAdd.removeAt(index);
  void insertAtIndexInUserToAdd(int index, DocumentReference item) =>
      userToAdd.insert(index, item);
  void updateUserToAddAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      userToAdd[index] = updateFn(userToAdd[index]);

  UsersRecord? currentProfessional;

  List<UsersRecord> professionals = [];
  void addToProfessionals(UsersRecord item) => professionals.add(item);
  void removeFromProfessionals(UsersRecord item) => professionals.remove(item);
  void removeAtIndexFromProfessionals(int index) =>
      professionals.removeAt(index);
  void insertAtIndexInProfessionals(int index, UsersRecord item) =>
      professionals.insert(index, item);
  void updateProfessionalsAtIndex(int index, Function(UsersRecord) updateFn) =>
      professionals[index] = updateFn(professionals[index]);

  int currentIndex = 0;

  bool showMessage = false;

  String temp = 'hola';

  List<UsersRecord> lastRejectedItem = [];
  void addToLastRejectedItem(UsersRecord item) => lastRejectedItem.add(item);
  void removeFromLastRejectedItem(UsersRecord item) =>
      lastRejectedItem.remove(item);
  void removeAtIndexFromLastRejectedItem(int index) =>
      lastRejectedItem.removeAt(index);
  void insertAtIndexInLastRejectedItem(int index, UsersRecord item) =>
      lastRejectedItem.insert(index, item);
  void updateLastRejectedItemAtIndex(
          int index, Function(UsersRecord) updateFn) =>
      lastRejectedItem[index] = updateFn(lastRejectedItem[index]);

  UsersRecord? lastRetrievedItem;

  List<String> favoriteRefs = [];
  void addToFavoriteRefs(String item) => favoriteRefs.add(item);
  void removeFromFavoriteRefs(String item) => favoriteRefs.remove(item);
  void removeAtIndexFromFavoriteRefs(int index) => favoriteRefs.removeAt(index);
  void insertAtIndexInFavoriteRefs(int index, String item) =>
      favoriteRefs.insert(index, item);
  void updateFavoriteRefsAtIndex(int index, Function(String) updateFn) =>
      favoriteRefs[index] = updateFn(favoriteRefs[index]);

  List<UsersRecord> listaFiltrada = [];
  void addToListaFiltrada(UsersRecord item) => listaFiltrada.add(item);
  void removeFromListaFiltrada(UsersRecord item) => listaFiltrada.remove(item);
  void removeAtIndexFromListaFiltrada(int index) =>
      listaFiltrada.removeAt(index);
  void insertAtIndexInListaFiltrada(int index, UsersRecord item) =>
      listaFiltrada.insert(index, item);
  void updateListaFiltradaAtIndex(int index, Function(UsersRecord) updateFn) =>
      listaFiltrada[index] = updateFn(listaFiltrada[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in tinderv2C1 widget.
  List<UsersRecord>? professional;
  // Stores action output result for [Firestore Query - Query a collection] action in tinderv2C1 widget.
  List<FavoritesRecord>? allProfessionals;
  // Model for MENSAGE_TINDER component.
  late MensageTinderModel mensageTinderModel;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController1;
  // Stores action output result for [Firestore Query - Query a collection] action in SwipeableStack widget.
  ChatsRecord? newRefCopyCopy;
  // Stores action output result for [Backend Call - Create Document] action in SwipeableStack widget.
  ChatsRecord? newChatThread;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController2;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    mensageTinderModel = createModel(context, () => MensageTinderModel());
    swipeableStackController1 = CardSwiperController();
    swipeableStackController2 = CardSwiperController();
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    mensageTinderModel.dispose();
    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
