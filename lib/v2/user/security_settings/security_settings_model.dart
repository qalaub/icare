import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/index.dart';
import 'security_settings_widget.dart' show SecuritySettingsWidget;
import 'package:flutter/material.dart';

class SecuritySettingsModel extends FlutterFlowModel<SecuritySettingsWidget> {
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

  // State field(s) for NuevoCorreoElectronico widget.
  FocusNode? nuevoCorreoElectronicoFocusNode;
  TextEditingController? nuevoCorreoElectronicoTextController;
  String? Function(BuildContext, String?)?
      nuevoCorreoElectronicoTextControllerValidator;
  // State field(s) for ConfirmNuevoCorreoElectronico widget.
  FocusNode? confirmNuevoCorreoElectronicoFocusNode;
  TextEditingController? confirmNuevoCorreoElectronicoTextController;
  String? Function(BuildContext, String?)?
      confirmNuevoCorreoElectronicoTextControllerValidator;
  // State field(s) for TextFieldOldPass widget.
  FocusNode? textFieldOldPassFocusNode;
  TextEditingController? textFieldOldPassTextController;
  late bool textFieldOldPassVisibility;
  String? Function(BuildContext, String?)?
      textFieldOldPassTextControllerValidator;
  // State field(s) for TextFieldNewPass widget.
  FocusNode? textFieldNewPassFocusNode;
  TextEditingController? textFieldNewPassTextController;
  late bool textFieldNewPassVisibility;
  String? Function(BuildContext, String?)?
      textFieldNewPassTextControllerValidator;
  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? isChange;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    textFieldOldPassVisibility = false;
    textFieldNewPassVisibility = false;
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    nuevoCorreoElectronicoFocusNode?.dispose();
    nuevoCorreoElectronicoTextController?.dispose();

    confirmNuevoCorreoElectronicoFocusNode?.dispose();
    confirmNuevoCorreoElectronicoTextController?.dispose();

    textFieldOldPassFocusNode?.dispose();
    textFieldOldPassTextController?.dispose();

    textFieldNewPassFocusNode?.dispose();
    textFieldNewPassTextController?.dispose();

    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
