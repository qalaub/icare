import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'register_pfofesional5_widget.dart' show RegisterPfofesional5Widget;
import 'package:flutter/material.dart';

class RegisterPfofesional5Model
    extends FlutterFlowModel<RegisterPfofesional5Widget> {
  ///  Local state fields for this page.

  String? video;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData80lA = false;
  FFUploadedFile uploadedLocalFile_uploadData80lA =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - verifySizeVideo] action in Button widget.
  bool? verifyVideo;
  bool isDataUploading_uploadDataZ712 = false;
  FFUploadedFile uploadedLocalFile_uploadDataZ712 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataZ712 = '';

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
