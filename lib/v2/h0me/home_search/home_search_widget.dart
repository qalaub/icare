import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/home_vista_cuidador_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/favoritesv2/perfil_profesional_mapa/perfil_profesional_mapa_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/user/mapbuscar/mapbuscar_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
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
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      if (!(await getPermissionStatus(locationPermission))) {
        FFAppState().registerProviderForm = RegisterProviderTypeStruct();
        await Future.delayed(const Duration(milliseconds: 1500));
        await requestPermission(locationPermission);
      }
      if (widget.authUser) {
        if (currentUserDocument?.rol != Roles.user) {
          if (valueOrDefault<bool>(currentUserDocument?.freeTrial, false) ==
              true) {
            if (functions.addDays(
                    currentUserDocument!.paymentDate!.secondsSinceEpoch, 0) <
                getCurrentTimestamp.secondsSinceEpoch) {
              await currentUserReference!.update(createUsersRecordData(
                freeTrial: false,
                paymentDate: getCurrentTimestamp,
              ));
            }
          } else {
            if (functions.addDays(
                    currentUserDocument!.paymentDate!.secondsSinceEpoch, 1) <
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
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.queryTextController ??= TextEditingController();
    _model.queryFocusNode ??= FocusNode();

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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.92,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.6,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -0.99),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(),
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
                                        mapsAustralianUsersRecordList =
                                        snapshot.data!;

                                    return SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: custom_widgets.MapsAustralian(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        current: currentUserLocationValue,
                                        markers: (currentUserDocument?.rol !=
                                                    Roles.profesional) &&
                                                (currentUserDocument?.rol !=
                                                    Roles.business)
                                            ? mapsAustralianUsersRecordList
                                                .where((e) =>
                                                    (e.rol ==
                                                        Roles.profesional) ||
                                                    (e.rol == Roles.business))
                                                .toList()
                                            : mapsAustralianUsersRecordList
                                                .where(
                                                    (e) => e.rol == Roles.user)
                                                .toList(),
                                        distance: valueOrDefault<double>(
                                          FFAppState().filtersPage.distance,
                                          10.0,
                                        ),
                                        markersImage:
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/3ketutb35iu3/markerMap.png',
                                        newUbication: _model.newUbication,
                                        language:
                                            FFAppState().filtersPage.language,
                                        age: FFAppState().filtersPage.age,
                                        service:
                                            FFAppState().filtersPage.services,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            if (valueOrDefault<bool>(
                              _model.showMap == true,
                              false,
                            ))
                              FlutterFlowGoogleMap(
                                controller: _model.googleMapsController,
                                onCameraIdle: (latLng) =>
                                    _model.googleMapsCenter = latLng,
                                initialLocation: _model.googleMapsCenter ??=
                                    const LatLng(13.106061, -59.613158),
                                markerColor: GoogleMarkerColor.violet,
                                mapType: MapType.normal,
                                style: GoogleMapStyle.standard,
                                initialZoom: 14.0,
                                allowInteraction: false,
                                allowZoom: false,
                                showZoomControls: false,
                                showLocation: false,
                                showCompass: false,
                                showMapToolbar: false,
                                showTraffic: false,
                                centerMapOnMarkerTap: false,
                              ),
                            Align(
                              alignment: const AlignmentDirectional(-0.04, -0.84),
                              child: PointerInterceptor(
                                intercepting: isWeb,
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.96,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.97),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              if (_model.isLoading == true) {
                                                return Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/Animation_-_1720469111880.gif',
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.82, -0.96),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 2.0,
                                                                0.0, 3.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor: Colors.white,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor: Colors.white,
                                                      icon: const Icon(
                                                        Icons.search_sharp,
                                                        color:
                                                            Color(0xFFDB00FF),
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.queryTextController,
                                                focusNode:
                                                    _model.queryFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.queryTextController',
                                                  const Duration(milliseconds: 100),
                                                  () async {
                                                    _model.isLoading = true;
                                                    _model.apiResultuev =
                                                        await GetSuggestionMapCall
                                                            .call(
                                                      query: _model
                                                          .queryTextController
                                                          .text,
                                                      types: (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.role,
                                                                      '') !=
                                                                  Roles
                                                                      .profesional
                                                                      .name) &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.role,
                                                                      '') !=
                                                                  Roles.business
                                                                      .name)
                                                          ? '(cities)'
                                                          : ' ',
                                                    );

                                                    if ((_model.apiResultuev
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.queryResults =
                                                          GetSuggestionMapCall
                                                                  .predictions(
                                                        (_model.apiResultuev
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!
                                                              .toList()
                                                              .cast<
                                                                  QueryResultsStruct>();
                                                    } else {
                                                      _model.isLoading = false;
                                                    }

                                                    _model.isLoading = false;

                                                    setState(() {});
                                                  },
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: 'City Or Zip Code',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                validator: _model
                                                    .queryTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 100.0,
                                            child: VerticalDivider(
                                              width: 5.0,
                                              thickness: 1.0,
                                              indent: 5.0,
                                              endIndent: 5.0,
                                              color: Color(0xFFBAB4B4),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 2.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'Filtros',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                              text: 'Filter',
                                              icon: const Icon(
                                                Icons.filter_list_alt,
                                                color: Color(0xAEDB00FF),
                                                size: 26.0,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.309,
                                                height: 39.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 0.0, 14.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Colors.white,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (_model.queryResults.isNotEmpty)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.7),
                                child: PointerInterceptor(
                                  intercepting: isWeb,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.96,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.47,
                                      decoration: BoxDecoration(
                                        color: const Color(0x33000000),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final newquery = _model
                                                      .queryResults
                                                      .toList();

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: newquery.length,
                                                    separatorBuilder: (_, __) =>
                                                        const SizedBox(height: 0.0),
                                                    itemBuilder: (context,
                                                        newqueryIndex) {
                                                      final newqueryItem =
                                                          newquery[
                                                              newqueryIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.newPlace =
                                                              await GetPlaceCall
                                                                  .call(
                                                            placeId:
                                                                newqueryItem
                                                                    .placeId,
                                                          );

                                                          if ((_model.newPlace
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.newUbication = functions
                                                                .concatStrings(
                                                                    GetPlaceCall
                                                                            .location(
                                                                      (_model.newPlace
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )
                                                                        ?.lat
                                                                        .toString(),
                                                                    GetPlaceCall
                                                                        .location(
                                                                      (_model.newPlace
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )?.lng.toString(),
                                                                    ',');
                                                          }
                                                          _model.queryResults =
                                                              [];
                                                          setState(() {
                                                            _model
                                                                .queryTextController
                                                                ?.clear();
                                                          });

                                                          setState(() {});
                                                        },
                                                        child: MapbuscarWidget(
                                                          key: Key(
                                                              'Keybzx_${newqueryIndex}_of_${newquery.length}'),
                                                          icon: const Icon(
                                                            Icons.location_on,
                                                            color: Color(
                                                                0xFFD26AD2),
                                                          ),
                                                          text: newqueryItem
                                                              .description,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
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
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.32,
                          decoration: const BoxDecoration(),
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Builder(
                            builder: (context) {
                              if ((currentUserDocument?.rol !=
                                      Roles.profesional) &&
                                  (currentUserDocument?.rol !=
                                      Roles.business)) {
                                return Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: FutureBuilder<List<UsersRecord>>(
                                    future: queryUsersRecordOnce(
                                      queryBuilder: (usersRecord) => usersRecord
                                          .where(Filter.or(
                                            Filter(
                                              'rol',
                                              isEqualTo:
                                                  Roles.profesional.serialize(),
                                            ),
                                            Filter(
                                              'rol',
                                              isEqualTo:
                                                  Roles.business.serialize(),
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
                                          containerUsersRecordList =
                                          snapshot.data!;

                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFDFDFD),
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
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFAppState()
                                                        .authUserFireBase) {
                                                      context.pushNamed(
                                                          'tinderv2C1');
                                                    } else {
                                                      context
                                                          .pushNamed('Login');
                                                    }
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 60.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFFFDFDFD),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 0.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            3.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 60.0,
                                                                height: 3.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xFFC56AB1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.concatStrings(
                                                                    containerUsersRecordList
                                                                        .length
                                                                        .toString(),
                                                                    'Results',
                                                                    ' '),
                                                                '35 Results',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
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
                                                                  (currentUserDocument
                                                                              ?.blockList
                                                                              .toList() ??
                                                                          [])
                                                                      .contains(
                                                                          e.reference) ==
                                                                  false)
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                          0,
                                                          10.0,
                                                          0,
                                                          0,
                                                        ),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            containerVar.length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 15.0),
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
                                                                  .reference.id,
                                                              containerVarIndex,
                                                            ),
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                PerfilProfesionalMapaWidget(
                                                              key: Key(
                                                                'Keyte3_${containerVarItem.reference.id}',
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
                                            ].divide(const SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
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
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
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
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 60.0,
                                                            height: 3.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFC56AB1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions.concatStrings(
                                                                homeVistaCuidadorUsersRecordList
                                                                    .length
                                                                    .toString(),
                                                                'Results',
                                                                ' '),
                                                            '35 Results',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .black,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.72,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.16,
                                              decoration: const BoxDecoration(),
                                              child: wrapWithModel(
                                                model: _model
                                                    .homeVistaCuidadorModel,
                                                updateCallback: () =>
                                                    setState(() {}),
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
                                          ].divide(const SizedBox(height: 22.0)),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Container(
                  height: 87.0,
                  decoration: const BoxDecoration(
                    color: Color(0xECB928B8),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      if (currentUserDocument?.rol != Roles.business) {
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.navbarModel,
                            updateCallback: () => setState(() {}),
                            child: const NavbarWidget(),
                          ),
                        );
                      } else {
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.navbarPremiunModel,
                            updateCallback: () => setState(() {}),
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
    );
  }
}
