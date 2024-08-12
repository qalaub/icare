import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 67.0,
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        buttonSize: MediaQuery.sizeOf(context).width * 0.12,
                        icon: const Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                          size: 34.0,
                        ),
                        onPressed: () async {
                          if (FFAppState().authUserFireBase) {
                            context.pushNamed('tinderv2C1');
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
            ),
            if (currentUserDocument?.business == null)
              AuthUserStreamWidget(
                builder: (context) => Column(
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
                            FFIcons.kheart,
                            color: Colors.white,
                            size: 34.0,
                          ),
                          onPressed: () async {
                            if (FFAppState().authUserFireBase) {
                              if (currentUserDocument?.rol == Roles.user) {
                                context.pushNamed('favV2');
                              } else {
                                if (currentUserDocument?.plan == Plan.standar) {
                                  context
                                      .pushNamed('peoplewhoputyouinfavorites');
                                } else {
                                  if (currentUserDocument?.plan == Plan.basic) {
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
                        'Favorite',
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
              ),
            if (currentUserDocument?.business == null)
              AuthUserStreamWidget(
                builder: (context) => Column(
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
                            FFIcons.kmessage,
                            color: Colors.white,
                            size: 34.0,
                          ),
                          onPressed: () async {
                            if (FFAppState().authUserFireBase) {
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
              ),
            if (currentUserDocument?.business == null)
              AuthUserStreamWidget(
                builder: (context) => Column(
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
                            FontAwesomeIcons.map,
                            color: Colors.white,
                            size: 34.0,
                          ),
                          onPressed: () async {
                            if (FFAppState().authUserFireBase) {
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
                        'Maps',
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
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        buttonSize: 48.0,
                        icon: const Icon(
                          FFIcons.kuser,
                          color: Colors.white,
                          size: 34.0,
                        ),
                        onPressed: () async {
                          if (FFAppState().authUserFireBase) {
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
      ),
    );
  }
}
