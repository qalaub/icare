import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'add_favorites_copy2_model.dart';
export 'add_favorites_copy2_model.dart';

class AddFavoritesCopy2Widget extends StatefulWidget {
  const AddFavoritesCopy2Widget({
    super.key,
    required this.professional,
  });

  final UsersRecord? professional;

  @override
  State<AddFavoritesCopy2Widget> createState() =>
      _AddFavoritesCopy2WidgetState();
}

class _AddFavoritesCopy2WidgetState extends State<AddFavoritesCopy2Widget> {
  late AddFavoritesCopy2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFavoritesCopy2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
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
                    size: 33.0,
                  ),
                  onPressed: () async {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'favorites': FieldValue.arrayRemove(
                              [widget.professional?.reference]),
                        },
                      ),
                    });
                    FFAppState().favoritesChange = true;
                    safeSetState(() {});
                  },
                );
              } else {
                return FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  icon: Icon(
                    Icons.favorite_border,
                    color: Color(0xFFFB4F4F),
                    size: 33.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    await currentUserReference!.update({
                      ...mapToFirestore(
                        {
                          'favorites': FieldValue.arrayUnion(
                              [widget.professional?.reference]),
                        },
                      ),
                    });
                    FFAppState().favoritesChange = false;
                    _model.updatePage(() {});
                    _model.addToUserToAdd(widget.professional!.reference);
                    _model.addToUserToAdd(currentUserReference!);
                    if (conditionalBuilderChatsRecord != null
                        ? (conditionalBuilderChatsRecord.users
                                .contains(currentUserReference) ==
                            true)
                        : false) {
                      _model.newRefCopyCopy = await queryChatsRecordOnce(
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
                      ).then((s) => s.firstOrNull);
                    } else {
                      // newChat

                      var chatsRecordReference = ChatsRecord.collection.doc();
                      await chatsRecordReference.set({
                        ...createChatsRecordData(
                          userA: currentUserReference,
                          userB: widget.professional?.reference,
                          lastMessage: '',
                          lastMessageTime: getCurrentTimestamp,
                          lastMessageSentBy: currentUserReference,
                          groupChatId:
                              random_data.randomInteger(1000000, 9999999),
                        ),
                        ...mapToFirestore(
                          {
                            'users': _model.userToAdd,
                          },
                        ),
                      });
                      _model.newChatThread = ChatsRecord.getDocumentFromData({
                        ...createChatsRecordData(
                          userA: currentUserReference,
                          userB: widget.professional?.reference,
                          lastMessage: '',
                          lastMessageTime: getCurrentTimestamp,
                          lastMessageSentBy: currentUserReference,
                          groupChatId:
                              random_data.randomInteger(1000000, 9999999),
                        ),
                        ...mapToFirestore(
                          {
                            'users': _model.userToAdd,
                          },
                        ),
                      }, chatsRecordReference);
                    }

                    _model.userToAdd = [];
                    if (widget.professional?.business != null) {
                      await NewsbusinessRecord.collection
                          .doc()
                          .set(createNewsbusinessRecordData(
                            business: widget.professional?.business,
                            professional: widget.professional?.reference,
                            user: currentUserReference,
                            isView: false,
                          ));
                    }
                  
                    safeSetState(() {});
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
