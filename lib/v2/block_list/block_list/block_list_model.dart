import '/flutter_flow/flutter_flow_util.dart';
import 'block_list_widget.dart' show BlockListWidget;
import 'package:flutter/material.dart';

class BlockListModel extends FlutterFlowModel<BlockListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
