import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/calendario_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/user/upload_profile_image/upload_profile_image_widget.dart';
import '/index.dart';
import 'profile_settings_widget.dart' show ProfileSettingsWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ProfileSettingsModel extends FlutterFlowModel<ProfileSettingsWidget> {
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

  List<QueryResultsStruct> queryResults = [];
  void addToQueryResults(QueryResultsStruct item) => queryResults.add(item);
  void removeFromQueryResults(QueryResultsStruct item) =>
      queryResults.remove(item);
  void removeAtIndexFromQueryResults(int index) => queryResults.removeAt(index);
  void insertAtIndexInQueryResults(int index, QueryResultsStruct item) =>
      queryResults.insert(index, item);
  void updateQueryResultsAtIndex(
          int index, Function(QueryResultsStruct) updateFn) =>
      queryResults[index] = updateFn(queryResults[index]);

  String? newUbication;

  bool dontShow = false;

  String? initialSudbur = 'P Melborne, D';

  String experienceError = ' ';

  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for upload_profile_image component.
  late UploadProfileImageModel uploadProfileImageModel;
  bool isDataUploading_uploadData80l = false;
  FFUploadedFile uploadedLocalFile_uploadData80l =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - verifySizeVideo] action in Button widget.
  bool? verifyVideo;
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
  String? _ageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'years is required';
    }

    if (val.length < 0) {
      return 'Requires at least 0 characters.';
    }
    if (val.length > 0) {
      return 'Maximum 0 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^(?:[1-9]|[1-3][0-9]|4[0-7])\$').hasMatch(val)) {
      return 'It can\'t be more than 47 years old';
    }
    return null;
  }

  // Stores action output result for [Custom Action - validateNumberRange] action in age widget.
  bool? esValido;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Do not leave this field empty is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  late MaskTextInputFormatter dateMask;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  // State field(s) for query widget.
  FocusNode? queryFocusNode;
  TextEditingController? queryTextController;
  String? Function(BuildContext, String?)? queryTextControllerValidator;
  // Stores action output result for [Backend Call - API (getSuggestionMapProfesional)] action in query widget.
  ApiCallResponse? apiResultuev;
  // State field(s) for abn widget.
  FocusNode? abnFocusNode;
  TextEditingController? abnTextController;
  String? Function(BuildContext, String?)? abnTextControllerValidator;
  // State field(s) for servicesPremiun widget.
  List<String>? servicesPremiunValue;
  FormFieldController<List<String>>? servicesPremiunValueController;
  // State field(s) for serviceemple widget.
  List<String>? serviceempleValue;
  FormFieldController<List<String>>? serviceempleValueController;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Model for calendarioCopy component.
  late CalendarioCopyModel calendarioCopyModel;
  bool isDataUploading_uploadDataZ71 = false;
  FFUploadedFile uploadedLocalFile_uploadDataZ71 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataZ71 = '';

  // Stores action output result for [Backend Call - API (getPlace)] action in mapbuscar widget.
  ApiCallResponse? newPlace;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    uploadProfileImageModel =
        createModel(context, () => UploadProfileImageModel());
    ageTextControllerValidator = _ageTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    calendarioCopyModel = createModel(context, () => CalendarioCopyModel());
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    uploadProfileImageModel.dispose();
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

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    queryFocusNode?.dispose();
    queryTextController?.dispose();

    abnFocusNode?.dispose();
    abnTextController?.dispose();

    calendarioCopyModel.dispose();
    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
