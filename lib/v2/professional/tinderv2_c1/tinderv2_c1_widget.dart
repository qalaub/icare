import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/professional/mensage_tinder/mensage_tinder_widget.dart';
import '/v2/professional/tinderv2_c0/tinderv2_c0_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tinderv2_c1_model.dart';
export 'tinderv2_c1_model.dart';

class Tinderv2C1Widget extends StatefulWidget {
  const Tinderv2C1Widget({super.key});

  static String routeName = 'tinderv2C1';
  static String routePath = 'tinderv2C1';

  @override
  State<Tinderv2C1Widget> createState() => _Tinderv2C1WidgetState();
}

class _Tinderv2C1WidgetState extends State<Tinderv2C1Widget> {
  late Tinderv2C1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

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
                ((currentUserDocument?.dontShow.toList() ?? [])
                        .contains(e.reference) ==
                    false) &&
                ((currentUserDocument?.favorites.toList() ?? [])
                        .contains(e.reference) ==
                    false) &&
                ((currentUserDocument?.rejections.toList() ?? [])
                        .contains(e.reference) ==
                    false))
            .toList()
            .toList()
            .cast<UsersRecord>();
        safeSetState(() {});
      } else {
        _model.professionals =
            _model.professional!.toList().cast<UsersRecord>();
        safeSetState(() {});
      }

      _model.currentProfessional = _model.professionals.firstOrNull;
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFBD39BA),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                if (currentUserLocationValue != null)
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
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 60.0,
                    decoration: BoxDecoration(
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (loggedIn == false) {
                            context.pushNamed(LoginWidget.routeName);
                          } else {
                            if (_model.currentProfessional != null) {
                              context.pushNamed(
                                ProfileInfoWidget.routeName,
                                queryParameters: {
                                  'professional': serializeParam(
                                    _model.currentProfessional?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              context.goNamed(HomeSearchWidget.routeName);
                            }
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Text(
                                'View Profile',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF8D0684),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
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
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.75,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Builder(
                          builder: (context) {
                            if ((_model.professionals.length <= 0) ||
                                _model.showMessage ||
                                (_model.currentProfessional == null)) {
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 0.96,
                                    maxHeight:
                                        MediaQuery.sizeOf(context).height *
                                            0.65,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.mensageTinderModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MensageTinderWidget(),
                                  ),
                                ),
                              );
                            } else {
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.sizeOf(context).width * 0.96,
                                    maxHeight:
                                        MediaQuery.sizeOf(context).height *
                                            0.65,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Builder(
                                      builder: (context) {
                                        final newData = functions
                                            .filterProfessionalsByDistance(
                                                _model.professionals.toList(),
                                                currentUserDocument?.suburb,
                                                300.0)
                                            .toList();

                                        return FlutterFlowSwipeableStack(
                                          onSwipeFn: (index) async {
                                            final newDataItem = newData[index];
                                            _model.currentProfessional =
                                                newDataItem;
                                            _model.currentIndex =
                                                _model.currentIndex + 1;
                                            _model.currentProfessional =
                                                newData.elementAtOrNull(
                                                    _model.currentIndex);
                                            safeSetState(() {});
                                          },
                                          onLeftSwipe: (index) async {
                                            final newDataItem = newData[index];
                                            if (!loggedIn) {
                                              context.pushNamed(
                                                  LoginWidget.routeName);
                                            } else {
                                              _model.addToLastRejectedItem(
                                                  newDataItem);
                                              safeSetState(() {});
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 3000));

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'rejections':
                                                        FieldValue.arrayUnion([
                                                      newDataItem.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                            }
                                          },
                                          onRightSwipe: (index) async {
                                            final newDataItem = newData[index];
                                            final firestoreBatch =
                                                FirebaseFirestore.instance
                                                    .batch();
                                            try {
                                              if (!loggedIn) {
                                                context.pushNamed(
                                                    LoginWidget.routeName);
                                              } else {
                                                firestoreBatch.update(
                                                    currentUserReference!, {
                                                  ...mapToFirestore(
                                                    {
                                                      'favorites': FieldValue
                                                          .arrayUnion([
                                                        newDataItem.reference
                                                      ]),
                                                    },
                                                  ),
                                                });
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
                                                _model.addToUserToAdd(
                                                    newDataItem.reference);
                                                _model.addToUserToAdd(
                                                    currentUserReference!);
                                                if (_model.chats?.reference !=
                                                        null
                                                    ? (_model.chats?.users
                                                            .contains(_model
                                                                .currentProfessional
                                                                ?.reference) ==
                                                        true)
                                                    : false) {
                                                  _model.newRef =
                                                      await queryChatsRecordOnce(
                                                    queryBuilder:
                                                        (chatsRecord) =>
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

                                                  var chatsRecordReference =
                                                      ChatsRecord.collection
                                                          .doc();
                                                  firestoreBatch.set(
                                                      chatsRecordReference, {
                                                    ...createChatsRecordData(
                                                      userA:
                                                          currentUserReference,
                                                      userB: _model
                                                          .currentProfessional
                                                          ?.reference,
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
                                                        'users':
                                                            _model.userToAdd,
                                                      },
                                                    ),
                                                  });
                                                  _model.newChatThread =
                                                      ChatsRecord
                                                          .getDocumentFromData({
                                                    ...createChatsRecordData(
                                                      userA:
                                                          currentUserReference,
                                                      userB: _model
                                                          .currentProfessional
                                                          ?.reference,
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
                                                        'users':
                                                            _model.userToAdd,
                                                      },
                                                    ),
                                                  }, chatsRecordReference);
                                                }

                                                if (newDataItem.business !=
                                                    null) {
                                                  firestoreBatch.set(
                                                      NewsbusinessRecord
                                                          .collection
                                                          .doc(),
                                                      createNewsbusinessRecordData(
                                                        business: newDataItem
                                                            .business,
                                                        professional:
                                                            newDataItem
                                                                .reference,
                                                        user:
                                                            currentUserReference,
                                                        isView: false,
                                                      ));
                                                }

                                                context.pushNamed(
                                                  ProfileInfoWidget.routeName,
                                                  queryParameters: {
                                                    'professional':
                                                        serializeParam(
                                                      newDataItem.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                _model.userToAdd = [];
                                                if (_model.currentIndex >=
                                                    newData.length) {
                                                  _model.showMessage = true;
                                                  _model.temp = 'mostrar';
                                                  safeSetState(() {});
                                                }
                                              }
                                            } finally {
                                              await firestoreBatch.commit();
                                            }

                                            safeSetState(() {});
                                          },
                                          onUpSwipe: (index) {},
                                          onDownSwipe: (index) {},
                                          itemBuilder: (context, newDataIndex) {
                                            final newDataItem =
                                                newData[newDataIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Tinderv2C0Widget(
                                                key: Key(
                                                    'Keyx4t_${newDataIndex}_of_${newData.length}'),
                                                professional: newDataItem,
                                              ),
                                            );
                                          },
                                          itemCount: newData.length,
                                          controller:
                                              _model.swipeableStackController,
                                          loop: false,
                                          cardDisplayCount: 1,
                                          scale: 0.9,
                                          cardPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          backCardOffset:
                                              const Offset(1.0, 1.0),
                                          allowedSwipeDirection:
                                              AllowedSwipeDirection.symmetric(
                                                  horizontal: true),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.swipeableStackController.swipeLeft();
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.18,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.18,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      key: ValueKey('dislike'),
                                      'assets/images/ggy9g_x.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Builder(
                                    builder: (context) {
                                      if (_model.currentProfessional == null) {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  Tinderv2C1Widget.routeName,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.13,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.13,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Group_100-2_(1).png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (loggedIn) {
                                                  if (_model.lastRejectedItem
                                                          .length >
                                                      0) {
                                                    _model.lastRetrievedItem =
                                                        _model.lastRejectedItem
                                                            .lastOrNull;
                                                    safeSetState(() {});
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 500));
                                                    _model.currentProfessional =
                                                        _model
                                                            .lastRetrievedItem;
                                                    safeSetState(() {});

                                                    await currentUserReference!
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'rejections':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            _model
                                                                .lastRejectedItem
                                                                .lastOrNull
                                                                ?.reference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    _model.insertAtIndexInProfessionals(
                                                        _model.currentIndex,
                                                        _model
                                                            .lastRetrievedItem!);
                                                    safeSetState(() {});
                                                    _model
                                                        .removeFromLastRejectedItem(
                                                            _model
                                                                .lastRejectedItem
                                                                .lastOrNull!);
                                                  }
                                                } else {
                                                  context.pushNamed(
                                                      LoginWidget.routeName);
                                                }
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.13,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.13,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  key: ValueKey('like'),
                                                  'assets/images/Group_100-2_(1).png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (loggedIn == false) {
                                      context.pushNamed(LoginWidget.routeName);
                                    } else {
                                      _model.swipeableStackController
                                          .swipeRight();
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.18,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.18,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      key: ValueKey('like'),
                                      'assets/images/ME-GUSTA.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 12.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 2.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    height: 73.0,
                    decoration: BoxDecoration(
                      color: Color(0xB3B928B8),
                    ),
                    child: Builder(
                      builder: (context) {
                        if (currentUserDocument?.rol != Roles.business) {
                          return wrapWithModel(
                            model: _model.navbarModel,
                            updateCallback: () => safeSetState(() {}),
                            child: NavbarWidget(),
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.navbarPremiunModel,
                            updateCallback: () => safeSetState(() {}),
                            child: NavbarPremiunWidget(),
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
      ),
    );
  }
}
