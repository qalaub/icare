import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/professional/tinderv2_c0/tinderv2_c0_widget.dart';
import 'dart:async';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'tinderv2_c1_model.dart';
export 'tinderv2_c1_model.dart';

class Tinderv2C1Widget extends StatefulWidget {
  const Tinderv2C1Widget({super.key});

  @override
  State<Tinderv2C1Widget> createState() => _Tinderv2C1WidgetState();
}

class _Tinderv2C1WidgetState extends State<Tinderv2C1Widget> {
  late Tinderv2C1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Tinderv2C1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.professional = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'rol',
          isNotEqualTo: Roles.user.serialize(),
        ),
      );
      if (loggedIn) {
        _model.professionals = _model.professional!
            .where((e) =>
                (currentUserDocument?.dontShow.toList() ?? [])
                    .contains(e.reference) ==
                false)
            .toList()
            .toList()
            .cast<UsersRecord>();
        safeSetState(() {});
      } else {
        _model.professionals =
            _model.professional!.toList().cast<UsersRecord>();
        safeSetState(() {});
      }

      _model.currentProfessional = _model.professionals.first;
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/werwee.png',
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFDFDFD),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          3.0,
                        ),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (loggedIn == false) {
                          context.pushNamed('Login');
                        } else {
                          context.pushNamed(
                            'profile_info',
                            queryParameters: {
                              'professional': serializeParam(
                                _model.currentProfessional?.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Text(
                              'View Profile',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: const Color(0xFF8D0684),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (_model.professionals.isNotEmpty)
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.sizeOf(context).width * 0.96,
                              maxHeight:
                                  MediaQuery.sizeOf(context).height * 0.65,
                            ),
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final newData = _model.professionals.toList();

                                return FlutterFlowSwipeableStack(
                                  onSwipeFn: (index) {},
                                  onLeftSwipe: (index) async {
                                    final newDataItem = newData[index];
                                    if (loggedIn == false) {
                                      _model.currentIndex =
                                          _model.currentIndex + 1;
                                      _model.currentProfessional =
                                          newData[_model.currentIndex];
                                    } else {
                                      _model.currentIndex =
                                          _model.currentIndex + 1;
                                      _model.currentProfessional =
                                          newData[_model.currentIndex];
                                      unawaited(
                                        () async {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'dontShow':
                                                    FieldValue.arrayUnion([
                                                  newDataItem.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        }(),
                                      );
                                    }
                                  },
                                  onRightSwipe: (index) async {
                                    final newDataItem = newData[index];
                                    final firestoreBatch =
                                        FirebaseFirestore.instance.batch();
                                    try {
                                      if (!loggedIn) {
                                        context.pushNamed('Login');
                                      } else {
                                        firestoreBatch
                                            .update(currentUserReference!, {
                                          ...mapToFirestore(
                                            {
                                              'favorites':
                                                  FieldValue.arrayUnion(
                                                      [newDataItem.reference]),
                                            },
                                          ),
                                        });
                                        _model.currentProfessional =
                                            newDataItem;
                                        _model.chats =
                                            await queryChatsRecordOnce(
                                          queryBuilder: (chatsRecord) =>
                                              chatsRecord
                                                  .where(
                                                    'user_a',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .where(
                                                    'user_b',
                                                    isEqualTo: _model
                                                        .currentProfessional
                                                        ?.reference,
                                                  ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        if (newDataItem.business != null) {
                                          _model.newChatBusiness =
                                              await queryChatsRecordOnce(
                                            queryBuilder: (chatsRecord) =>
                                                chatsRecord
                                                    .where(
                                                      'user_a',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'user_b',
                                                      isEqualTo: _model
                                                          .currentProfessional
                                                          ?.business,
                                                    ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _model.addToUserToAdd(
                                              currentUserReference!);
                                          _model.addToUserToAdd(_model
                                              .currentProfessional!.business!);
                                          if (_model.newChatBusiness
                                                      ?.reference !=
                                                  null
                                              ? (_model.newChatBusiness?.users
                                                      .contains(_model
                                                          .currentProfessional
                                                          ?.business) ==
                                                  true)
                                              : false) {
                                            _model.newRefBusiness =
                                                await queryChatsRecordOnce(
                                              queryBuilder: (chatsRecord) =>
                                                  chatsRecord
                                                      .where(
                                                        'user_a',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      )
                                                      .where(
                                                        'user_b',
                                                        isEqualTo: _model
                                                            .currentProfessional
                                                            ?.business,
                                                      ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                          } else {
                                            // newChat

                                            var chatsRecordReference1 =
                                                ChatsRecord.collection.doc();
                                            firestoreBatch
                                                .set(chatsRecordReference1, {
                                              ...createChatsRecordData(
                                                userA: currentUserReference,
                                                userB: _model
                                                    .currentProfessional
                                                    ?.business,
                                                lastMessage: '',
                                                lastMessageTime:
                                                    getCurrentTimestamp,
                                                lastMessageSentBy:
                                                    currentUserReference,
                                                groupChatId:
                                                    random_data.randomInteger(
                                                        1000000, 9999999),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'users': _model.userToAdd,
                                                },
                                              ),
                                            });
                                            _model.newChatThreadBusiness =
                                                ChatsRecord.getDocumentFromData(
                                                    {
                                                  ...createChatsRecordData(
                                                    userA: currentUserReference,
                                                    userB: _model
                                                        .currentProfessional
                                                        ?.business,
                                                    lastMessage: '',
                                                    lastMessageTime:
                                                        getCurrentTimestamp,
                                                    lastMessageSentBy:
                                                        currentUserReference,
                                                    groupChatId: random_data
                                                        .randomInteger(
                                                            1000000, 9999999),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'users': _model.userToAdd,
                                                    },
                                                  ),
                                                },
                                                    chatsRecordReference1);
                                          }
                                        } else {
                                          _model.addToUserToAdd(
                                              currentUserReference!);
                                          _model.addToUserToAdd(_model
                                              .currentProfessional!.reference);
                                          if (_model.chats?.reference != null
                                              ? (_model.chats?.users.contains(
                                                      _model.currentProfessional
                                                          ?.reference) ==
                                                  true)
                                              : false) {
                                            _model.newRef =
                                                await queryChatsRecordOnce(
                                              queryBuilder: (chatsRecord) =>
                                                  chatsRecord
                                                      .where(
                                                        'user_a',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      )
                                                      .where(
                                                        'user_b',
                                                        isEqualTo: _model
                                                            .currentProfessional
                                                            ?.reference,
                                                      ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                          } else {
                                            // newChat

                                            var chatsRecordReference2 =
                                                ChatsRecord.collection.doc();
                                            firestoreBatch
                                                .set(chatsRecordReference2, {
                                              ...createChatsRecordData(
                                                userA: currentUserReference,
                                                userB: _model
                                                    .currentProfessional
                                                    ?.reference,
                                                lastMessage: '',
                                                lastMessageTime:
                                                    getCurrentTimestamp,
                                                lastMessageSentBy:
                                                    currentUserReference,
                                                groupChatId:
                                                    random_data.randomInteger(
                                                        1000000, 9999999),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'users': _model.userToAdd,
                                                },
                                              ),
                                            });
                                            _model.newChatThread = ChatsRecord
                                                .getDocumentFromData({
                                              ...createChatsRecordData(
                                                userA: currentUserReference,
                                                userB: _model
                                                    .currentProfessional
                                                    ?.reference,
                                                lastMessage: '',
                                                lastMessageTime:
                                                    getCurrentTimestamp,
                                                lastMessageSentBy:
                                                    currentUserReference,
                                                groupChatId:
                                                    random_data.randomInteger(
                                                        1000000, 9999999),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'users': _model.userToAdd,
                                                },
                                              ),
                                            }, chatsRecordReference2);
                                          }
                                        }

                                        context.pushNamed(
                                          'profile_info',
                                          queryParameters: {
                                            'professional': serializeParam(
                                              _model.currentProfessional
                                                  ?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );

                                        _model.currentIndex =
                                            _model.currentIndex + 1;
                                        _model.currentProfessional =
                                            newData[_model.currentIndex];
                                        _model.userToAdd = [];
                                      }
                                    } finally {
                                      await firestoreBatch.commit();
                                    }

                                    safeSetState(() {});
                                  },
                                  onUpSwipe: (index) {},
                                  onDownSwipe: (index) {},
                                  itemBuilder: (context, newDataIndex) {
                                    final newDataItem = newData[newDataIndex];
                                    return Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Tinderv2C0Widget(
                                        key: Key(
                                            'Key3fl_${newDataIndex}_of_${newData.length}'),
                                        professional: newDataItem,
                                      ),
                                    );
                                  },
                                  itemCount: newData.length,
                                  controller: _model.swipeableStackController,
                                  loop: false,
                                  cardDisplayCount: 2,
                                  scale: 0.9,
                                  cardPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  backCardOffset: const Offset(1.0, 1.0),
                                );
                              },
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.swipeableStackController.swipeLeft();
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.18,
                                height: MediaQuery.sizeOf(context).width * 0.18,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/ggy9g_x.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (loggedIn == false) {
                                  context.pushNamed('Login');
                                } else {
                                  _model.swipeableStackController.swipeRight();
                                }
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.18,
                                height: MediaQuery.sizeOf(context).width * 0.18,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/ME-GUSTA.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 30.0)),
                        ),
                      ),
                    ].divide(const SizedBox(height: 2.0)),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Container(
                  height: 73.0,
                  decoration: const BoxDecoration(
                    color: Color(0xB3B928B8),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (currentUserDocument?.rol != Roles.business) {
                        return wrapWithModel(
                          model: _model.navbarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarWidget(),
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.navbarPremiunModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarPremiunWidget(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
