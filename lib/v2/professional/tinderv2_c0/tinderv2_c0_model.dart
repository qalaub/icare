import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'tinderv2_c0_widget.dart' show Tinderv2C0Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Tinderv2C0Model extends FlutterFlowModel<Tinderv2C0Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for MembresiaLogo component.
  late MembresiaLogoModel membresiaLogoModel;

  @override
  void initState(BuildContext context) {
    membresiaLogoModel = createModel(context, () => MembresiaLogoModel());
  }

  @override
  void dispose() {
    membresiaLogoModel.dispose();
  }
}
