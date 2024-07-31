import '/flutter_flow/flutter_flow_util.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'tinderv2_c0_widget.dart' show Tinderv2C0Widget;
import 'package:flutter/material.dart';

class Tinderv2C0Model extends FlutterFlowModel<Tinderv2C0Widget> {
  ///  State fields for stateful widgets in this component.

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
