import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'add_favorites_model.dart';
export 'add_favorites_model.dart';

class AddFavoritesWidget extends StatefulWidget {
  const AddFavoritesWidget({
    super.key,
    required this.professional,
  });

  final UsersRecord? professional;

  @override
  State<AddFavoritesWidget> createState() => _AddFavoritesWidgetState();
}

class _AddFavoritesWidgetState extends State<AddFavoritesWidget> {
  late AddFavoritesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFavoritesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1, -1),
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
                width: 50,
                height: 50,
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
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 40,
                  icon: const Icon(
                    Icons.favorite,
                    color: Color(0xFFFB4F4F),
                    size: 27,
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
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 40,
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Color(0xFFFB4F4F),
                    size: 27,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    if (currentUserReference != null) {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'favorites': FieldValue.arrayUnion(
                                [widget.professional?.reference]),
                          },
                        ),
                      });
                      FFAppState().favoritesChange = false;
                      if (widget.professional?.business != null) {
                        _model.newChatBusiness = await queryChatsRecordOnce(
                          queryBuilder: (chatsRecord) => chatsRecord
                              .where(
                                'user_a',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'user_b',
                                isEqualTo: widget.professional?.business,
                              ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        _model.addToUserToAdd(widget.professional!.business!);
                        _model.addToUserToAdd(currentUserReference!);
                        if (_model.newChatBusiness != null
                            ? (_model.newChatBusiness?.users
                                    .contains(currentUserReference) ==
                                true)
                            : false) {
                          _model.newRefBusiness = await queryChatsRecordOnce(
                            queryBuilder: (chatsRecord) => chatsRecord
                                .where(
                                  'user_a',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'user_b',
                                  isEqualTo: widget.professional?.business,
                                ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                        } else {
                          // newChat

                          var chatsRecordReference1 =
                              ChatsRecord.collection.doc();
                          await chatsRecordReference1.set({
                            ...createChatsRecordData(
                              userA: currentUserReference,
                              userB: widget.professional?.business,
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
                          _model.newChatThreadBusiness =
                              ChatsRecord.getDocumentFromData({
                            ...createChatsRecordData(
                              userA: currentUserReference,
                              userB: widget.professional?.business,
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
                          }, chatsRecordReference1);
                        }

                        await NewsbusinessRecord.collection
                            .doc()
                            .set(createNewsbusinessRecordData(
                              business: widget.professional?.business,
                              professional: widget.professional?.reference,
                              user: currentUserReference,
                              isView: false,
                            ));
                      } else {
                        _model.addToUserToAdd(widget.professional!.reference);
                        _model.addToUserToAdd(currentUserReference!);
                        if (conditionalBuilderChatsRecord != null
                            ? (conditionalBuilderChatsRecord.users
                                    .contains(currentUserReference) ==
                                true)
                            : false) {
                          _model.newRef = await queryChatsRecordOnce(
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

                          var chatsRecordReference2 =
                              ChatsRecord.collection.doc();
                          await chatsRecordReference2.set({
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
                          _model.newChatThread =
                              ChatsRecord.getDocumentFromData({
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
                          }, chatsRecordReference2);
                        }
                      }

                      _model.userToAdd = [];

                      context.pushNamed(
                        'profile_info',
                        queryParameters: {
                          'professional': serializeParam(
                            widget.professional?.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      context.pushNamed('Login');
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
