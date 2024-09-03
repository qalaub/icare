import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_business4_widget.dart' show RegisterBusiness4Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterBusiness4Model extends FlutterFlowModel<RegisterBusiness4Widget> {
  ///  Local state fields for this page.

  bool photoVerify = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for img1.
  late ImageUploadModel img1Model;
  // Model for img2.
  late ImageUploadModel img2Model;
  // Model for img3.
  late ImageUploadModel img3Model;
  // Model for img4.
  late ImageUploadModel img4Model;
  // Model for img5.
  late ImageUploadModel img5Model;
  // Model for img6.
  late ImageUploadModel img6Model;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;

  @override
  void initState(BuildContext context) {
    img1Model = createModel(context, () => ImageUploadModel());
    img2Model = createModel(context, () => ImageUploadModel());
    img3Model = createModel(context, () => ImageUploadModel());
    img4Model = createModel(context, () => ImageUploadModel());
    img5Model = createModel(context, () => ImageUploadModel());
    img6Model = createModel(context, () => ImageUploadModel());
  }

  @override
  void dispose() {
    img1Model.dispose();
    img2Model.dispose();
    img3Model.dispose();
    img4Model.dispose();
    img5Model.dispose();
    img6Model.dispose();
  }
}
