import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/user/upload_profile_image/upload_profile_image_widget.dart';
import 'profilesettings_widget.dart' show ProfilesettingsWidget;
import 'package:flutter/material.dart';

class ProfilesettingsModel extends FlutterFlowModel<ProfilesettingsWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> imgs = [];
  void addToImgs(FFUploadedFile item) => imgs.add(item);
  void removeFromImgs(FFUploadedFile item) => imgs.remove(item);
  void removeAtIndexFromImgs(int index) => imgs.removeAt(index);
  void insertAtIndexInImgs(int index, FFUploadedFile item) =>
      imgs.insert(index, item);
  void updateImgsAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      imgs[index] = updateFn(imgs[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for upload_profile_image component.
  late UploadProfileImageModel uploadProfileImageModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for services widget.
  String? servicesValue;
  FormFieldController<String>? servicesValueController;
  // State field(s) for servicesPremiun widget.
  List<String>? servicesPremiunValue;
  FormFieldController<List<String>>? servicesPremiunValueController;
  // State field(s) for age widget.
  String? ageValue;
  FormFieldController<String>? ageValueController;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    uploadProfileImageModel =
        createModel(context, () => UploadProfileImageModel());
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    uploadProfileImageModel.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
