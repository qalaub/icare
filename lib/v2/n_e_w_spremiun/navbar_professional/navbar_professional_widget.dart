import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'navbar_professional_model.dart';
export 'navbar_professional_model.dart';

class NavbarProfessionalWidget extends StatefulWidget {
  const NavbarProfessionalWidget({super.key});

  @override
  State<NavbarProfessionalWidget> createState() =>
      _NavbarProfessionalWidgetState();
}

class _NavbarProfessionalWidgetState extends State<NavbarProfessionalWidget> {
  late NavbarProfessionalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarProfessionalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord.where(
            'favorites',
            arrayContains: currentUserReference,
          ),
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
          List<UsersRecord> containerUsersRecordList =
              snapshot.data!.where((u) => u.uid != currentUserUid).toList();

          return Container(
            width: double.infinity,
            height: 67.0,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (currentUserDocument?.business == null)
                  AuthUserStreamWidget(
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowIconButton(
                              key: const ValueKey('home'),
                              borderColor: Colors.transparent,
                              borderRadius: 34.0,
                              buttonSize: 48.0,
                              icon: const FaIcon(
                                key: ValueKey('home'),
                                FontAwesomeIcons.houseUser,
                                color: Colors.white,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                if (loggedIn) {
                                  context.pushNamed('HomeSearch');
                                } else {
                                  context.pushNamed('Login');
                                }
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Home',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Container(
                          height: 5.0,
                          decoration: const BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                key: const ValueKey('likes'),
                                borderColor: Colors.transparent,
                                borderRadius: 34.0,
                                buttonSize: 48.0,
                                icon: const Icon(
                                  key: ValueKey('likes'),
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                  size: 33.0,
                                ),
                                onPressed: () async {
                                  if (loggedIn) {
                                    if (currentUserDocument?.rol ==
                                        Roles.user) {
                                      context.pushNamed('favV3Copy');
                                    } else {
                                      if ((currentUserDocument?.plan ==
                                              Plan.standar) ||
                                          (currentUserDocument?.plan ==
                                              Plan.premiun)) {
                                        context.pushNamed(
                                            'peoplewhoputyouinfavorites');
                                      } else {
                                        if (currentUserDocument?.plan ==
                                            Plan.basic) {
                                          context.pushNamed(
                                              'peoplewhoputyouinfavoriteBasic');
                                        }
                                      }
                                    }
                                  } else {
                                    context.pushNamed('Login');
                                  }
                                },
                              ),
                            ),
                            if (containerUsersRecordList.isNotEmpty)
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFF0000),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        containerUsersRecordList.length
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: const Color(0xFFF4F4F4),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.33, 0.64),
                      child: Text(
                        'Likes',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Container(
                      height: 5.0,
                      decoration: const BoxDecoration(),
                    ),
                  ],
                ),
                if (currentUserDocument?.business == null)
                  AuthUserStreamWidget(
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  key: const ValueKey('message'),
                                  borderColor: Colors.transparent,
                                  buttonSize: 48.0,
                                  icon: const Icon(
                                    key: ValueKey('message'),
                                    Icons.wechat_rounded,
                                    color: Colors.white,
                                    size: 34.0,
                                  ),
                                  onPressed: () async {
                                    if (loggedIn) {
                                      context.pushNamed('chat_2_main');
                                    } else {
                                      context.pushNamed('Login');
                                    }
                                  },
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: StreamBuilder<List<ChatsRecord>>(
                                  stream: queryChatsRecord(
                                    queryBuilder: (chatsRecord) => chatsRecord
                                        .where(
                                          'users',
                                          arrayContains: currentUserReference,
                                          isNull:
                                              (currentUserReference) == null,
                                        )
                                        .orderBy('last_message_time',
                                            descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ChatsRecord> containerChatsRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFFF0000),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            containerChatsRecordList
                                                .where((e) =>
                                                    e.lastMessageSeenBy.contains(
                                                        currentUserReference) ==
                                                    false)
                                                .toList()
                                                .length
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: const Color(0xFFF4F4F4),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.29, 0.64),
                          child: Text(
                            'Message',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Container(
                          height: 5.0,
                          decoration: const BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: FlutterFlowIconButton(
                            key: const ValueKey('profile'),
                            borderColor: Colors.transparent,
                            buttonSize: 48.0,
                            icon: const Icon(
                              key: ValueKey('profile'),
                              Icons.person,
                              color: Colors.white,
                              size: 37.0,
                            ),
                            onPressed: () async {
                              if (loggedIn) {
                                context.pushNamed('userprofile');
                              } else {
                                context.pushNamed('Login');
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.78, 0.59),
                      child: Text(
                        'Profile',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Container(
                      height: 5.0,
                      decoration: const BoxDecoration(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
