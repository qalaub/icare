import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/home_vista_cuidador_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/perfil_profesional_mapa/perfil_profesional_mapa_widget.dart';
import '/v2/h0me/map_button/map_button_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'home_search_model.dart';
export 'home_search_model.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({
    super.key,
    this.currentLatLng,
    bool? authUser,
  }) : authUser = authUser ?? true;

  final List<LatLng>? currentLatLng;
  final bool authUser;

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget>
    with TickerProviderStateMixin {
  late HomeSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeSearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(await getPermissionStatus(locationPermission))) {
        FFAppState().registerProviderForm = RegisterProviderTypeStruct();
        await Future.delayed(const Duration(milliseconds: 1500));
        await requestPermission(locationPermission);
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
            }
          } else {
            if (functions.addDays(
                    currentUserDocument!.paymentDate!.secondsSinceEpoch, 30) <
                getCurrentTimestamp.secondsSinceEpoch) {
              context.pushNamed(
                'MembresiasV2',
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
            }
          }
        }
      }
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 780.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
            top: true,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 1.0,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Builder(
                        builder: (context) {
                          if ((currentUserDocument?.rol != Roles.profesional) &&
                              (currentUserDocument?.rol != Roles.business)) {
                            return Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: const BoxDecoration(),
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: FutureBuilder<List<UsersRecord>>(
                                          future: queryUsersRecordOnce(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord
                                                    .where(Filter.or(
                                                      Filter(
                                                        'rol',
                                                        isEqualTo: Roles
                                                            .profesional
                                                            .serialize(),
                                                      ),
                                                      Filter(
                                                        'rol',
                                                        isEqualTo: Roles
                                                            .business
                                                            .serialize(),
                                                      ),
                                                    ))
                                                    .orderBy('created_time',
                                                        descending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UsersRecord>
                                                containerUsersRecordList =
                                                snapshot.data!;

                                            return Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.72,
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 7.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      -2.0,
                                                    ),
                                                  )
                                                ],
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xE1F6F5F5),
                                                    Color(0xD8A5A4A4)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final containerVar =
                                                                containerUsersRecordList
                                                                    .where((e) =>
                                                                        (currentUserDocument?.blockList.toList() ??
                                                                                [])
                                                                            .contains(e.reference) ==
                                                                        false)
                                                                    .toList();

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                0,
                                                                10.0,
                                                                0,
                                                                0,
                                                              ),
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  containerVar
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  const SizedBox(
                                                                      height:
                                                                          15.0),
                                                              itemBuilder: (context,
                                                                  containerVarIndex) {
                                                                final containerVarItem =
                                                                    containerVar[
                                                                        containerVarIndex];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .perfilProfesionalMapaModels
                                                                      .getModel(
                                                                    containerVarItem
                                                                        .reference
                                                                        .id,
                                                                    containerVarIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      PerfilProfesionalMapaWidget(
                                                                    key: Key(
                                                                      'Keyb8l_${containerVarItem.reference.id}',
                                                                    ),
                                                                    profesionalId:
                                                                        containerVarItem,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 5.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: const MapButtonWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.145,
                                            decoration: const BoxDecoration(),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            const MapButtonWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -0.99),
                                                      child: StreamBuilder<
                                                          List<UsersRecord>>(
                                                        stream:
                                                            queryUsersRecord(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<UsersRecord>
                                                              mapsAustralianUsersRecordList =
                                                              snapshot.data!;

                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onDoubleTap:
                                                                () async {
                                                              context.pushNamed(
                                                                  'MapAument');
                                                            },
                                                            child: SizedBox(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              child: custom_widgets
                                                                  .MapsAustralian(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                current:
                                                                    currentUserLocationValue,
                                                                markers: currentUserDocument
                                                                            ?.rol !=
                                                                        Roles
                                                                            .user
                                                                    ? mapsAustralianUsersRecordList
                                                                        .where((e) =>
                                                                            e.rol ==
                                                                            Roles
                                                                                .user)
                                                                        .toList()
                                                                    : mapsAustralianUsersRecordList
                                                                        .where((e) =>
                                                                            (e.rol == Roles.profesional) ||
                                                                            (e.rol ==
                                                                                Roles.business))
                                                                        .toList(),
                                                                distance:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  FFAppState()
                                                                      .filtersPage
                                                                      .distance,
                                                                  10.0,
                                                                ),
                                                                markersImage:
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/3ketutb35iu3/markerMap.png',
                                                                newUbication: _model
                                                                    .newUbication,
                                                                language: FFAppState()
                                                                    .filtersPage
                                                                    .language,
                                                                age: FFAppState()
                                                                    .filtersPage
                                                                    .age,
                                                                service: FFAppState()
                                                                    .filtersPage
                                                                    .services,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      _model.showMap == true,
                                                      false,
                                                    ))
                                                      FlutterFlowGoogleMap(
                                                        controller: _model
                                                            .googleMapsController,
                                                        onCameraIdle: (latLng) =>
                                                            _model.googleMapsCenter =
                                                                latLng,
                                                        initialLocation: _model
                                                                .googleMapsCenter ??=
                                                            const LatLng(13.106061,
                                                                -59.613158),
                                                        markerColor:
                                                            GoogleMarkerColor
                                                                .violet,
                                                        mapType: MapType.normal,
                                                        style: GoogleMapStyle
                                                            .standard,
                                                        initialZoom: 14.0,
                                                        allowInteraction: false,
                                                        allowZoom: false,
                                                        showZoomControls: false,
                                                        showLocation: false,
                                                        showCompass: false,
                                                        showMapToolbar: false,
                                                        showTraffic: false,
                                                        centerMapOnMarkerTap:
                                                            false,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            );
                          } else {
                            return Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
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
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.84,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: wrapWithModel(
                                              model: _model.mapButtonModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: const MapButtonWidget(
                                                isProfessional: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-0.2, 0.76),
                                          child: Container(
                                            width: 290.0,
                                            height: 120.0,
                                            decoration: const BoxDecoration(),
                                            child: wrapWithModel(
                                              model:
                                                  _model.homeVistaCuidadorModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: HomeVistaCuidadorWidget(
                                                participants:
                                                    valueOrDefault<String>(
                                                  functions.concatStrings(
                                                      homeVistaCuidadorUsersRecordList
                                                          .length
                                                          .toString(),
                                                      'participants',
                                                      ' '),
                                                  '35 participants',
                                                ),
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
                    alignment: const AlignmentDirectional(0.0, 1.01),
                    child: Container(
                      height: 73.0,
                      decoration: const BoxDecoration(
                        color: Color(0xD7B928B8),
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (currentUserDocument?.rol != Roles.business) {
                            return Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: wrapWithModel(
                                model: _model.navbarModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const NavbarWidget(),
                              ),
                            );
                          } else {
                            return Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.navbarPremiunModel,
                                updateCallback: () => safeSetState(() {}),
                                child: const NavbarPremiunWidget(),
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
          ),
        ),
      ),
    );
  }
}
