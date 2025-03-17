import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/home_vista_cuidador_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/h0me/map_button/map_button_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v3correciones/user_fav0rites/v3fv0ritesv3/v3fv0ritesv3_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (FFAppState().isCreatedProfesional) {
        if (currentUserDocument?.rol != Roles.user) {
          FFAppState().isCreatedProfesional = false;

          context.pushNamed(RegisterPfofesional5Widget.routeName);
        }
      }
      if (!(await getPermissionStatus(locationPermission))) {
        FFAppState().registerProviderForm =
            RegisterProviderTypeStruct.fromSerializableMap(jsonDecode(
                '{\"images\":\"[]\",\"serviceType\":\"[]\",\"disabilities\":\"[]\",\"schedule\":\"[\\\"Monday\\\",\\\"Tuesday\\\",\\\"Wednesday\\\",\\\"Thursday\\\",\\\"Friday\\\",\\\"Saturday\\\",\\\"Sunday\\\"]\",\"morning\":\"[\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\"]\",\"noon\":\"[\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\"]\",\"afternoon\":\"[\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\",\\\"false\\\"]\"}'));
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
      FFAppState().currentProfesionalUbication = CurrentProfesionalMapStruct();
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Container(
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
                        if ((currentUserDocument?.rol != Roles.profesional) &&
                            (currentUserDocument?.rol != Roles.business)) {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.1, -1.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.925,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.76),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 170.0,
                                      constraints: BoxConstraints(
                                        minHeight: 150.0,
                                        maxHeight: 170.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0x76F9F6F6),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final containerVar = _model
                                              .professionalList
                                              .where((e) =>
                                                  (functions.filterProfessionals(
                                                          e,
                                                          FFAppState()
                                                              .distanceToShow
                                                              .toDouble(),
                                                          FFAppState()
                                                              .filtersPage
                                                              .services
                                                              .toList(),
                                                          FFAppState()
                                                              .filtersPage
                                                              .age
                                                              .toList(),
                                                          FFAppState()
                                                              .tempLocation!,
                                                          FFAppState()
                                                              .filtersPage
                                                              .schedule
                                                              .toList(),
                                                          FFAppState()
                                                              .zoomFilter) ==
                                                      true) &&
                                                  !(currentUserDocument
                                                              ?.blockList
                                                              .toList() ??
                                                          [])
                                                      .contains(e.reference))
                                              .toList();

                                          return ListView.separated(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: containerVar.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(width: 20.0),
                                            itemBuilder:
                                                (context, containerVarIndex) {
                                              final containerVarItem =
                                                  containerVar[
                                                      containerVarIndex];
                                              return V3fv0ritesv3Widget(
                                                key: Key(
                                                    'Keyx22_${containerVarIndex}_of_${containerVar.length}'),
                                                isCollaborator: false,
                                                profesionalId:
                                                    containerVarItem.reference,
                                                isReview: false,
                                                isMap: true,
                                              );
                                            },
                                          );
                                        },
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRecord>
                                    homeVistaCuidadorUsersRecordList =
                                    snapshot.data!;

                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.5),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.94,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: wrapWithModel(
                                            model: _model.mapButtonModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: MapButtonWidget(
                                              isProfessional: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.9, 0.76),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.601,
                                          height: 220.0,
                                          decoration: BoxDecoration(),
                                          child: wrapWithModel(
                                            model:
                                                _model.homeVistaCuidadorModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: HomeVistaCuidadorWidget(
                                              participants:
                                                  homeVistaCuidadorUsersRecordList
                                                      .where((e) => functions
                                                          .verifyDistanceFilter(
                                                              FFAppState()
                                                                  .newUbicationProfessional,
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
                      color: Color(0xD7B928B8),
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
        ),
      ),
    );
  }
}
