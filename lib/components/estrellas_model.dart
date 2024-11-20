import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'estrellas_widget.dart' show EstrellasWidget;
import 'package:flutter/material.dart';

class EstrellasModel extends FlutterFlowModel<EstrellasWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // Stores action output result for [Firestore Query - Query a collection] action in RatingBar widget.
  ChatsRecord? chatsR;
  // Stores action output result for [Firestore Query - Query a collection] action in RatingBar widget.
  List<ChatMessagesRecord>? chatsM;
  // Stores action output result for [Firestore Query - Query a collection] action in RatingBar widget.
  ReviewsRecord? reviewsC;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
