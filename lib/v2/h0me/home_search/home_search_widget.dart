import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/home_vista_cuidador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/h0me/map_button/map_button_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:lock_orientation_library_opafp4/custom_code/actions/index.dart'
    as lock_orientation_library_opafp4_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_search_model.dart';
export 'home_search_model.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({
    super.key,
    this.currentLatLng,
    bool? authUser,
  }) : this.authUser = authUser ?? true;

  final List<LatLng>? currentLatLng;
  final bool authUser;

  static String routeName = 'HomeSearch';
  static String routePath = 'homeSearch';

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  late HomeSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeSearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      await lock_orientation_library_opafp4_actions.lockOrientation();
      if (FFAppState().isCreatedProfesional) {
        if (currentUserDocument?.rol != Roles.user) {
          FFAppState().isCreatedProfesional = false;
        }
      }
      if (loggedIn) {
        if (currentUserDocument?.rol != Roles.user) {
          if (valueOrDefault<bool>(currentUserDocument?.freeTrial, false) ==
              true) {
            if (functions.addDays(
                    currentUserDocument!.paymentDate!.secondsSinceEpoch, 15) <
                getCurrentTimestamp.secondsSinceEpoch) {
              await currentUserReference!.update(createUsersRecordData(
                freeTrial: false,
                paymentDate: getCurrentTimestamp,
              ));
            } else {
              if (currentUserDocument?.business != null) {
                context.pushNamed(PeoplewhoputyouinfavoritesWidget.routeName);
              }
            }
          } else {
            if (functions.addDays(
                    currentUserDocument!.paymentDate!.secondsSinceEpoch, 30) <
                getCurrentTimestamp.secondsSinceEpoch) {
              context.pushNamed(
                MembresiasV2Widget.routeName,
                queryParameters: {
                  'professionalUpdate': serializeParam(
                    currentUserReference,
                    ParamType.DocumentReference,
                  ),
                  'currentPlan': serializeParam(
                    currentUserDocument?.plan,
                    ParamType.Enum,
                  ),
                  'isUpdate': serializeParam(
                    true,
                    ParamType.bool,
                  ),
                }.withoutNulls,
              );
            } else {
              if (currentUserDocument?.business != null) {
                context.pushNamed(PeoplewhoputyouinfavoritesWidget.routeName);
              }
            }
          }
        }
      }
      if (currentUserDocument?.rol == Roles.user) {
        _model.newProfessionals = await queryUsersRecordOnce(
          queryBuilder: (usersRecord) => usersRecord.where(
            'rol',
            isNotEqualTo: Roles.user.serialize(),
          ),
        );
        _model.professionalList =
            _model.newProfessionals!.toList().cast<UsersRecord>();
        safeSetState(() {});
        FFAppState().tempLocation = currentUserLocationValue;
        safeSetState(() {});
      }
      FFAppState().currentProfesionalUbication =
          CurrentProfesionalMapStruct.fromSerializableMap(jsonDecode('{}'));
      safeSetState(() {});
      if ((FFAppState().locationPermissionGranted == false) &&
          (valueOrDefault<bool>(currentUserDocument?.firtsLogin, false) ==
              true)) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'After accepting permissions, press the map button again to load the location correctly.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        await requestPermission(locationPermission);
        FFAppState().locationPermissionGranted = true;
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Builder(
                            builder: (context) {
                              if ((currentUserDocument?.rol !=
                                      Roles.profesional) &&
                                  (currentUserDocument?.rol !=
                                      Roles.business)) {
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.1, -1.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.9,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: wrapWithModel(
                                              model: _model.mapButtonModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MapButtonWidget(
                                                isProfessional: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FutureBuilder<List<UsersRecord>>(
                                    future: queryUsersRecordOnce(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where(
                                        'rol',
                                        isEqualTo: Roles.user.serialize(),
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord>
                                          homeVistaCuidadorUsersRecordList =
                                          snapshot.data!;

                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Stack(
                                          children: [
                                            AuthUserStreamWidget(
                                              builder: (context) => Builder(
                                                builder: (_) {
                                                  final child = Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.5),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.94,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .mapButtonModel2,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                MapButtonWidget(
                                                              isProfessional:
                                                                  true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.9, 0.76),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.601,
                                                          height: 220.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .homeVistaCuidadorModel,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                HomeVistaCuidadorWidget(
                                                              participants: homeVistaCuidadorUsersRecordList
                                                                  .where((e) => functions.verifyDistanceFilter(
                                                                      functions.latLngToString(
                                                                          FFAppState()
                                                                              .tempLocation!),
                                                                      e.suburb!,
                                                                      FFAppState()
                                                                          .zoomFilter))
                                                                  .toList()
                                                                  .length
                                                                  .toString(),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                  if (currentUserDocument
                                                          ?.plan ==
                                                      Plan.basic) {
                                                    return ClipRect(
                                                      child: ImageFiltered(
                                                        imageFilter:
                                                            ImageFilter.blur(
                                                          sigmaX: 2.5,
                                                          sigmaY: 2.5,
                                                        ),
                                                        child: child,
                                                      ),
                                                    );
                                                  }
                                                  return child;
                                                },
                                              ),
                                            ),
                                            if (currentUserDocument?.plan ==
                                                Plan.basic)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -0.5),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      Container(
                                                    width: 315.0,
                                                    height: 450.0,
                                                    decoration: BoxDecoration(),
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                MembresiasV2Widget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'professionalUpdate':
                                                                      serializeParam(
                                                                    currentUserReference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'currentPlan':
                                                                      serializeParam(
                                                                    Plan.basic,
                                                                    ParamType
                                                                        .Enum,
                                                                  ),
                                                                  'isUpdate':
                                                                      serializeParam(
                                                                    true,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/pixelcut-export.png',
                                                                width: 250.0,
                                                                height: 250.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.2),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'You need to upgrade your membership to access this feature.\nUpgrade to standard or premium',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.6),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                MembresiasV2Widget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'professionalUpdate':
                                                                      serializeParam(
                                                                    currentUserReference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'currentPlan':
                                                                      serializeParam(
                                                                    Plan.basic,
                                                                    ParamType
                                                                        .Enum,
                                                                  ),
                                                                  'isUpdate':
                                                                      serializeParam(
                                                                    true,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            text: 'Upgrade Now',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 150.0,
                                                              height: 45.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFFA00BAB),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 5.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.01),
                        child: Container(
                          height: 73.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFBD39BA),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              if (currentUserDocument?.rol != Roles.business) {
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: wrapWithModel(
                                    model: _model.navbarModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NavbarWidget(),
                                  ),
                                );
                              } else {
                                return Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.navbarPremiunModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NavbarPremiunWidget(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
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
