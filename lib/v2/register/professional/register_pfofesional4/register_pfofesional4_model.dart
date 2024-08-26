import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'register_pfofesional4_widget.dart' show RegisterPfofesional4Widget;
import 'package:flutter/material.dart';

class RegisterPfofesional4Model
    extends FlutterFlowModel<RegisterPfofesional4Widget> {
  ///  Local state fields for this page.

  bool photosVerify = true;

  ///  State fields for stateful widgets in this page.

  // Model for imageUpload component.
  late ImageUploadModel imageUploadModel;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;

  @override
  void initState(BuildContext context) {
    imageUploadModel = createModel(context, () => ImageUploadModel());
  }

  @override
  void dispose() {
    imageUploadModel.dispose();
  }
}
