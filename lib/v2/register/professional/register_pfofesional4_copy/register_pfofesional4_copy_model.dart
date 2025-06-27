import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'register_pfofesional4_copy_widget.dart'
    show RegisterPfofesional4CopyWidget;
import 'package:flutter/material.dart';

class RegisterPfofesional4CopyModel
    extends FlutterFlowModel<RegisterPfofesional4CopyWidget> {
  ///  Local state fields for this page.

  bool photosVerify = true;

  bool changevideo = false;

  String? video;

  ///  State fields for stateful widgets in this page.

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
  bool isDataUploading_uploadData80lB = false;
  FFUploadedFile uploadedLocalFile_uploadData80lB =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - verifySizeVideo] action in Button widget.
  bool? verifyVideo;
  bool isDataUploading_uploadDataZ713 = false;
  FFUploadedFile uploadedLocalFile_uploadDataZ713 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataZ713 = '';

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
