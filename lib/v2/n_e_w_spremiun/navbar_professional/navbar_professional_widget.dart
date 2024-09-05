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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 34.0,
                          buttonSize: 48.0,
                          icon: const FaIcon(
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
                      alignment: const AlignmentDirectional(0.29, 0.64),
                      child: Text(
                        'Home',
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (containerUsersRecordList.isNotEmpty)
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            buttonSize: 48.0,
                            icon: const Icon(
                              Icons.favorite,
                              color: Color(0xFFFD2121),
                              size: 36.0,
                            ),
                            onPressed: () async {
                              if (loggedIn) {
                                if (currentUserDocument?.rol == Roles.user) {
                                  context.pushNamed('favV3Copy');
                                } else {
                                  if (currentUserDocument?.plan ==
                                      Plan.standar) {
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
                      ),
                    if (containerUsersRecordList.isEmpty)
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 34.0,
                            buttonSize: 48.0,
                            icon: const Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.white,
                              size: 33.0,
                            ),
                            onPressed: () async {
                              if (loggedIn) {
                                if (currentUserDocument?.rol == Roles.user) {
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          buttonSize: 48.0,
                          icon: const Icon(
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
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.29, 0.64),
                      child: Text(
                        'Message',
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
                            borderColor: Colors.transparent,
                            buttonSize: 48.0,
                            icon: const Icon(
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
