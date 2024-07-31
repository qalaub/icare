import '/flutter_flow/flutter_flow_util.dart';
import 'user_widget.dart' show UserWidget;
import 'package:flutter/material.dart';

class UserModel extends FlutterFlowModel<UserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
