import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/calendario_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/professional/imagenesfotos_users/imagenesfotos_users_widget.dart';
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

  ///  State fields for stateful widgets in this page.

  // Model for upload_profile_image component.
  late UploadProfileImageModel uploadProfileImageModel;
  // Model for imagenesfotosUsers component.
  late ImagenesfotosUsersModel imagenesfotosUsersModel;
  // Model for calendarioCopy component.
  late CalendarioCopyModel calendarioCopyModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for query widget.
  FocusNode? queryFocusNode;
  TextEditingController? queryTextController;
  String? Function(BuildContext, String?)? queryTextControllerValidator;
  // Stores action output result for [Backend Call - API (getSuggestionMapProfesional)] action in query widget.
  ApiCallResponse? apiResultuev;
  // State field(s) for services widget.
  String? servicesValue;
  FormFieldController<String>? servicesValueController;
  // State field(s) for servicesPremiun widget.
  List<String>? servicesPremiunValue;
  FormFieldController<List<String>>? servicesPremiunValueController;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // State field(s) for age widget.
  String? ageValue;
  FormFieldController<String>? ageValueController;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - verifySizeVideo] action in Button widget.
  bool? verifyVideo;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

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
    imagenesfotosUsersModel =
        createModel(context, () => ImagenesfotosUsersModel());
    calendarioCopyModel = createModel(context, () => CalendarioCopyModel());
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    uploadProfileImageModel.dispose();
    imagenesfotosUsersModel.dispose();
    calendarioCopyModel.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();

    queryFocusNode?.dispose();
    queryTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
