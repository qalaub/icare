import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/estrellas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/block_list/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'v3fv0ritesv3_model.dart';
export 'v3fv0ritesv3_model.dart';

class V3fv0ritesv3Widget extends StatefulWidget {
  const V3fv0ritesv3Widget({
    super.key,
    required this.profesionalId,
    bool? isCollaborator,
    bool? isReview,
    bool? isMap,
  })  : isCollaborator = isCollaborator ?? false,
        isReview = isReview ?? false,
        isMap = isMap ?? false;

  final DocumentReference? profesionalId;
  final bool isCollaborator;
  final bool isReview;
  final bool isMap;

  @override
  State<V3fv0ritesv3Widget> createState() => _V3fv0ritesv3WidgetState();
}

class _V3fv0ritesv3WidgetState extends State<V3fv0ritesv3Widget> {
  late V3fv0ritesv3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => V3fv0ritesv3Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userCurrent = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.profesionalId?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.apiResult23d = await GetNamePlaceCall.call(
        lat: functions.latLngToString(_model.userCurrent!.suburb!),
      );

      if ((_model.apiResult23d?.succeeded ?? true)) {
        _model.newSuburb = GetNamePlaceCall.street(
          (_model.apiResult23d?.jsonBody ?? ''),
        )!
            .firstOrNull!
            .toString();
        safeSetState(() {});
      }
    });
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
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.profesionalId!),
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

          final containerUsersRecord = snapshot.data!;

          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (!loggedIn) {
                context.pushNamed('Login');
              } else {
                context.pushNamed(
                  'ProfileInfo',
                  queryParameters: {
                    'professional': serializeParam(
                      widget.profesionalId,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              }
            },
            child: Material(
              color: Colors.transparent,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: 285.0,
                height: 149.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFBB3FBB),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 29.0, 0.0, 0.0),
                            child: Container(
                              width: 63.0,
                              height: 63.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                border: Border.all(
                                  color: const Color(0xFFD9D9D9),
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 1.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl: valueOrDefault<String>(
                                      containerUsersRecord.photoUrl,
                                      'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                    ),
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 5.0, 0.0, 0.0),
                            child: StreamBuilder<List<ReviewsRecord>>(
                              stream: queryReviewsRecord(
                                queryBuilder: (reviewsRecord) =>
                                    reviewsRecord.where(
                                  'professional',
                                  isEqualTo: widget.profesionalId,
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
                                List<ReviewsRecord> containerReviewsRecordList =
                                    snapshot.data!;

                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.estrellasModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: EstrellasWidget(
                                      parameter1: containerReviewsRecordList,
                                      parameter2: widget.profesionalId!,
                                      parameter3: widget.isReview,
                                      parameter4: valueOrDefault<int>(
                                        containerReviewsRecordList.length,
                                        1278,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 130.0,
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  functions.upperCaseFirstLetter(
                                      containerUsersRecord.rol == Roles.business
                                          ? containerUsersRecord.comapny
                                          : containerUsersRecord.firtsName),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.05, -0.19),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                11.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 130.0,
                              height: 18.0,
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  containerUsersRecord.serviceType.firstOrNull!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 160.0,
                          child: Divider(
                            height: 11.0,
                            thickness: 1.0,
                            indent: 5.0,
                            endIndent: 5.0,
                            color: Color(0xFFBB3FBB),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.09, 0.52),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 160.0,
                              height: 69.0,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-0.17, 0.1),
                                    child: Container(
                                      width: 150.0,
                                      height: 16.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 3.0),
                                              child: Icon(
                                                FFIcons.kcheck,
                                                color: Color(0xFF0143A4),
                                                size: 13.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                containerUsersRecord
                                                                .ndis !=
                                                            ''
                                                    ? 'Registered Provider'
                                                    : 'Unregistered Provider',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-0.03, 0.18),
                                    child: Container(
                                      width: 150.0,
                                      height: 16.0,
                                      decoration: const BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            const Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Icon(
                                                Icons.business_center_outlined,
                                                color: Color(0xFF0143A4),
                                                size: 15.0,
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Experience  ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            containerUsersRecord
                                                                .years
                                                                .toString(),
                                                        style: const TextStyle(),
                                                      ),
                                                      const TextSpan(
                                                        text: ' years',
                                                        style: TextStyle(),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-0.17, 0.1),
                                    child: Container(
                                      width: 150.0,
                                      height: 16.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 3.0),
                                              child: Icon(
                                                FFIcons.kubication,
                                                color: Color(0xFF0143A4),
                                                size: 14.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                functions.formatnameStreet(
                                                    _model.newSuburb),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(height: 8.0))
                                    .addToEnd(const SizedBox(height: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'ProfileInfo',
                                  queryParameters: {
                                    'professional': serializeParam(
                                      containerUsersRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );
                              },
                              child: wrapWithModel(
                                model: _model.addFavoritesModel,
                                updateCallback: () => safeSetState(() {}),
                                child: AddFavoritesWidget(
                                  professional: containerUsersRecord,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.isMap)
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderRadius: 118.0,
                                  buttonSize: 35.0,
                                  fillColor: Colors.white,
                                  icon: const Icon(
                                    FFIcons.kubicationplane,
                                    color: Color(0xFFC14BBC),
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    FFAppState().currentProfesionalUbication =
                                        CurrentProfesionalMapStruct();
                                    FFAppState().update(() {});
                                    FFAppState().currentProfesionalUbication =
                                        CurrentProfesionalMapStruct(
                                      sub: containerUsersRecord.suburb,
                                      id: widget.profesionalId,
                                    );
                                    FFAppState().update(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (!widget.isCollaborator)
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.membresiaLogoModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: MembresiaLogoWidget(
                                    professional:
                                        containerUsersRecord.reference,
                                    width: 40,
                                    heigth: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ]
                          .divide(const SizedBox(height: 2.0))
                          .addToEnd(const SizedBox(height: 8.0)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
