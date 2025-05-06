import '/components/calendario_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/professional/imagenesfotos_users/imagenesfotos_users_widget.dart';
import '/index.dart';
import 'verperfil_widget.dart' show VerperfilWidget;
import 'package:flutter/material.dart';

class VerperfilModel extends FlutterFlowModel<VerperfilWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> imgs = [];
  void addToImgs(FFUploadedFile item) => imgs.add(item);
  void removeFromImgs(FFUploadedFile item) => imgs.remove(item);
  void removeAtIndexFromImgs(int index) => imgs.removeAt(index);
  void insertAtIndexInImgs(int index, FFUploadedFile item) =>
      imgs.insert(index, item);
  void updateImgsAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      imgs[index] = updateFn(imgs[index]);

  List<String> userImg = [];
  void addToUserImg(String item) => userImg.add(item);
  void removeFromUserImg(String item) => userImg.remove(item);
  void removeAtIndexFromUserImg(int index) => userImg.removeAt(index);
  void insertAtIndexInUserImg(int index, String item) =>
      userImg.insert(index, item);
  void updateUserImgAtIndex(int index, Function(String) updateFn) =>
      userImg[index] = updateFn(userImg[index]);

  List<String> ages = [];
  void addToAges(String item) => ages.add(item);
  void removeFromAges(String item) => ages.remove(item);
  void removeAtIndexFromAges(int index) => ages.removeAt(index);
  void insertAtIndexInAges(int index, String item) => ages.insert(index, item);
  void updateAgesAtIndex(int index, Function(String) updateFn) =>
      ages[index] = updateFn(ages[index]);

  bool isEdit = true;

  bool dontShow = false;

  ///  State fields for stateful widgets in this page.

  // Model for imagenesfotosUsers component.
  late ImagenesfotosUsersModel imagenesfotosUsersModel;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for company widget.
  FocusNode? companyFocusNode;
  TextEditingController? companyTextController;
  String? Function(BuildContext, String?)? companyTextControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for query widget.
  FocusNode? queryFocusNode;
  TextEditingController? queryTextController;
  String? Function(BuildContext, String?)? queryTextControllerValidator;
  // State field(s) for abn widget.
  FocusNode? abnFocusNode;
  TextEditingController? abnTextController;
  String? Function(BuildContext, String?)? abnTextControllerValidator;
  // State field(s) for services widget.
  String? servicesValue;
  FormFieldController<String>? servicesValueController;
  // State field(s) for servicesPremiun widget.
  List<String>? servicesPremiunValue;
  FormFieldController<List<String>>? servicesPremiunValueController;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // State field(s) for NDIS widget.
  FocusNode? ndisFocusNode;
  TextEditingController? ndisTextController;
  String? Function(BuildContext, String?)? ndisTextControllerValidator;
  // Model for calendario component.
  late CalendarioModel calendarioModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    imagenesfotosUsersModel =
        createModel(context, () => ImagenesfotosUsersModel());
    calendarioModel = createModel(context, () => CalendarioModel());
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    imagenesfotosUsersModel.dispose();
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    companyFocusNode?.dispose();
    companyTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController6?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    queryFocusNode?.dispose();
    queryTextController?.dispose();

    abnFocusNode?.dispose();
    abnTextController?.dispose();

    ndisFocusNode?.dispose();
    ndisTextController?.dispose();

    calendarioModel.dispose();
    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
