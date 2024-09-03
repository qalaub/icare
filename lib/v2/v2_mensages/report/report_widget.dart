import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'report_model.dart';
export 'report_model.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({
    super.key,
    required this.user1,
    required this.user2,
  });

  final String? user1;
  final String? user2;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  late ReportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: Text(
                                  'Select an issue to report',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Text(
                                  'We will not notify the person who \nreported it,if you are in imminent\n danger, call the corresponding  \nauthorities.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFFC6C6C6),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport = 'Harassment';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget!.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget!.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Harassment',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.currentReport =
                                    'He pretends to be someone else';

                                context.pushNamed(
                                  'reportSection',
                                  queryParameters: {
                                    'report': serializeParam(
                                      _model.currentReport,
                                      ParamType.String,
                                    ),
                                    'user1': serializeParam(
                                      widget!.user1,
                                      ParamType.String,
                                    ),
                                    'user2': serializeParam(
                                      widget!.user2,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'He pretends to be someone else',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport =
                                  'Share inappropriate content';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget!.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget!.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Share inappropriate content',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport =
                                  'Language that incites hatred';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget!.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget!.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Language that incites hatred',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport = 'Unauthorized sales';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget!.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget!.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Unauthorized sales',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport = 'Scams';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget!.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget!.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Scams',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport = 'Others';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget!.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget!.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Others',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ]
                            .addToStart(SizedBox(height: 8.0))
                            .addToEnd(SizedBox(height: 43.0)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
