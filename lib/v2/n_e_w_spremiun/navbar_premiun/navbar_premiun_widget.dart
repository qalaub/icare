import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navbar_premiun_model.dart';
export 'navbar_premiun_model.dart';

class NavbarPremiunWidget extends StatefulWidget {
  const NavbarPremiunWidget({super.key});

  @override
  State<NavbarPremiunWidget> createState() => _NavbarPremiunWidgetState();
}

class _NavbarPremiunWidgetState extends State<NavbarPremiunWidget> {
  late NavbarPremiunModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarPremiunModel());
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
                        borderRadius: 34.0,
                        buttonSize: 52.0,
                        icon: const Icon(
                          Icons.search_sharp,
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
                      buttonSize: 52.0,
                      icon: const Icon(
                        Icons.playlist_add_check_sharp,
                        color: Colors.white,
                        size: 34.0,
                      ),
                      onPressed: () async {
                        if (FFAppState().authUserFireBase) {
                          context.pushNamed('listofcollaborators');
                        } else {
                          context.pushNamed('Login');
                        }
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.78, 0.59),
                  child: Text(
                    'Colaborators',
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
                      borderRadius: 34.0,
                      buttonSize: 52.0,
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
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 31.0,
                        buttonSize: 52.0,
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
                  alignment: const AlignmentDirectional(-0.33, 0.64),
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
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 34.0,
                        buttonSize: 52.0,
                        icon: const Icon(
                          Icons.notifications_sharp,
                          color: Colors.white,
                          size: 34.0,
                        ),
                        onPressed: () async {
                          if (FFAppState().authUserFireBase) {
                            context.pushNamed('news');
                          } else {
                            context.pushNamed('Login');
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.33, 0.64),
                  child: Text(
                    'news',
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
