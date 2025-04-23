import '/flutter_flow/flutter_flow_util.dart';
import 'add_favorites_copy_widget.dart' show AddFavoritesCopyWidget;
import 'package:flutter/material.dart';

class AddFavoritesCopyModel extends FlutterFlowModel<AddFavoritesCopyWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> userToAdd = [];
  void addToUserToAdd(DocumentReference item) => userToAdd.add(item);
  void removeFromUserToAdd(DocumentReference item) => userToAdd.remove(item);
  void removeAtIndexFromUserToAdd(int index) => userToAdd.removeAt(index);
  void insertAtIndexInUserToAdd(int index, DocumentReference item) =>
      userToAdd.insert(index, item);
  void updateUserToAddAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      userToAdd[index] = updateFn(userToAdd[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
