import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/professional/user_tinder/user_tinder_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tin_d_e_rv1_widget.dart' show TinDERv1Widget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TinDERv1Model extends FlutterFlowModel<TinDERv1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
