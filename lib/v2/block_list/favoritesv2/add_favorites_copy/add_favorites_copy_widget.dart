import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'add_favorites_copy_model.dart';
export 'add_favorites_copy_model.dart';

class AddFavoritesCopyWidget extends StatefulWidget {
  const AddFavoritesCopyWidget({
    super.key,
    required this.professional,
  });

  final UsersRecord? professional;

  @override
  State<AddFavoritesCopyWidget> createState() => _AddFavoritesCopyWidgetState();
}

class _AddFavoritesCopyWidgetState extends State<AddFavoritesCopyWidget> {
  late AddFavoritesCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFavoritesCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, -1.0),
      child: StreamBuilder<List<ChatsRecord>>(
        stream: queryChatsRecord(
          queryBuilder: (chatsRecord) => chatsRecord
              .where(
                'user_a',
                isEqualTo: currentUserReference,
              )
              .where(
                'user_b',
                isEqualTo: widget.professional?.reference,
              ),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<ChatsRecord> conditionalBuilderChatsRecordList = snapshot.data!;
          final conditionalBuilderChatsRecord =
              conditionalBuilderChatsRecordList.isNotEmpty
                  ? conditionalBuilderChatsRecordList.first
                  : null;

          return Builder(
            builder: (context) {
              if ((currentUserDocument?.favorites.toList() ?? [])
                  .contains(widget.professional?.reference)) {
                return FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  icon: Icon(
                    Icons.favorite,
                    color: Color(0xFFFB4F4F),
                    size: 30.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                );
              } else {
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 45.0,
                    icon: Icon(
                      Icons.favorite_border,
                      color: Color(0xFFFB4F4F),
                      size: 30.0,
                    ),
                    showLoadingIndicator: true,
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
