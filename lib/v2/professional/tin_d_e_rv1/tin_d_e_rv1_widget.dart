import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/professional/user_tinder/user_tinder_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'tin_d_e_rv1_model.dart';
export 'tin_d_e_rv1_model.dart';

class TinDERv1Widget extends StatefulWidget {
  const TinDERv1Widget({super.key});

  @override
  State<TinDERv1Widget> createState() => _TinDERv1WidgetState();
}

class _TinDERv1WidgetState extends State<TinDERv1Widget> {
  late TinDERv1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TinDERv1Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'rol',
          isEqualTo: Roles.profesional.serialize(),
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
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
        List<UsersRecord> tinDERv1UsersRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/fondo-de-membresia.png',
                          ).image,
                        ),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.sizeOf(context).height * 0.8,
                            maxWidth: MediaQuery.sizeOf(context).width * 0.9,
                            maxHeight: 680.0,
                          ),
                          decoration: const BoxDecoration(),
                          child: Visibility(
                            visible: tinDERv1UsersRecordList.isNotEmpty,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final containerVar =
                                            tinDERv1UsersRecordList.toList();

                                        return FlutterFlowSwipeableStack(
                                          onSwipeFn: (index) {},
                                          onLeftSwipe: (index) {},
                                          onRightSwipe: (index) {},
                                          onUpSwipe: (index) {},
                                          onDownSwipe: (index) {},
                                          itemBuilder:
                                              (context, containerVarIndex) {
                                            final containerVarItem =
                                                containerVar[containerVarIndex];
                                            return UserTinderWidget(
                                              key: Key(
                                                  'Key88o_${containerVarIndex}_of_${containerVar.length}'),
                                              professional: containerVarItem,
                                            );
                                          },
                                          itemCount: containerVar.length,
                                          controller:
                                              _model.swipeableStackController,
                                          loop: false,
                                          cardDisplayCount: 2,
                                          scale: 1.0,
                                          threshold: 1.0,
                                          maxAngle: 25.0,
                                          backCardOffset:
                                              const Offset(1.0, 0.0),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 40.0),
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
                                          _model.swipeableStackController
                                              .swipeLeft();
                                        },
                                        child: Container(
                                          width: 80.0,
                                          height: 80.0,
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
                                          _model.swipeableStackController
                                              .swipeRight();
                                        },
                                        child: Container(
                                          width: 80.0,
                                          height: 80.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/chuI0.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 29.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      height: 70.0,
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60.0,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC56AB1),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Text(
                                valueOrDefault<String>(
                                  functions.concatStrings(
                                      tinDERv1UsersRecordList.length.toString(),
                                      'Results',
                                      ' '),
                                  '35 Results',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
