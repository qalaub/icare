import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'register_pfofesional5_widget.dart' show RegisterPfofesional5Widget;
import 'package:flutter/material.dart';

class RegisterPfofesional5Model
    extends FlutterFlowModel<RegisterPfofesional5Widget> {
  ///  Local state fields for this page.

  String? video;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - verifySizeVideo] action in Button widget.
  bool? verifyVideo;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
