import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v3correciones/likes_v3/likes_v3/likes_v3_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'peoplewhoputyouinfavorite_basic_model.dart';
export 'peoplewhoputyouinfavorite_basic_model.dart';

class PeoplewhoputyouinfavoriteBasicWidget extends StatefulWidget {
  const PeoplewhoputyouinfavoriteBasicWidget({super.key});

  static String routeName = 'peoplewhoputyouinfavoriteBasic';
  static String routePath = 'peoplewhoputyouinfavoriteBasic';

  @override
  State<PeoplewhoputyouinfavoriteBasicWidget> createState() =>
      _PeoplewhoputyouinfavoriteBasicWidgetState();
}

class _PeoplewhoputyouinfavoriteBasicWidgetState
    extends State<PeoplewhoputyouinfavoriteBasicWidget> {
  late PeoplewhoputyouinfavoriteBasicModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PeoplewhoputyouinfavoriteBasicModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFFBD39BA),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: FaIcon(
                FontAwesomeIcons.angleLeft,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Likes',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: Color(0xFFEFECF3),
                    fontSize: 25.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: ClipRect(
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 3.5,
                                  sigmaY: 3.5,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x7FFFFFFF),
                                    ),
                                    child: StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord
                                                .where(
                                                  'favorites',
                                                  arrayContains:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'rol',
                                                  isEqualTo:
                                                      Roles.user.serialize(),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord>
                                            listViewUsersRecordList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            26.0,
                                            0,
                                            0,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewUsersRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewUsersRecord =
                                                listViewUsersRecordList[
                                                    listViewIndex];
                                            return LikesV3Widget(
                                              key: Key(
                                                  'Keyp49_${listViewIndex}_of_${listViewUsersRecordList.length}'),
                                              profesionalRef:
                                                  listViewUsersRecord.reference,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, -0.5),
                            child: Container(
                              width: 315.0,
                              height: 297.0,
                              decoration: BoxDecoration(),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    MembresiasV2Widget.routeName,
                                    queryParameters: {
                                      'professionalUpdate': serializeParam(
                                        currentUserReference,
                                        ParamType.DocumentReference,
                                      ),
                                      'currentPlan': serializeParam(
                                        Plan.basic,
                                        ParamType.Enum,
                                      ),
                                      'isUpdate': serializeParam(
                                        true,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/pixelcut-export.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.15),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Text(
                                'No new likes',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFDB4B9C),
                                      fontSize: 25.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.4),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Text(
                                'When someone likes your profile,\n a notification will appear here.\nUpgrade to standard',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.7),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  MembresiasV2Widget.routeName,
                                  queryParameters: {
                                    'professionalUpdate': serializeParam(
                                      currentUserReference,
                                      ParamType.DocumentReference,
                                    ),
                                    'currentPlan': serializeParam(
                                      Plan.basic,
                                      ParamType.Enum,
                                    ),
                                    'isUpdate': serializeParam(
                                      true,
                                      ParamType.bool,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              text: 'Upgrade Now',
                              options: FFButtonOptions(
                                width: 150.0,
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFA00BAB),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 5.0,
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    child: Builder(
                      builder: (context) {
                        if (currentUserDocument?.rol != Roles.business) {
                          return wrapWithModel(
                            model: _model.navbarModel,
                            updateCallback: () => safeSetState(() {}),
                            child: NavbarWidget(),
                          );
                        } else {
                          return wrapWithModel(
                            model: _model.navbarPremiunModel,
                            updateCallback: () => safeSetState(() {}),
                            child: NavbarPremiunWidget(),
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
