import '';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'cuestionario_model.dart';
export 'cuestionario_model.dart';

class CuestionarioWidget extends StatefulWidget {
  const CuestionarioWidget({super.key});

  static String routeName = 'cuestionario';
  static String routePath = 'cuestionario';

  @override
  State<CuestionarioWidget> createState() => _CuestionarioWidgetState();
}

class _CuestionarioWidgetState extends State<CuestionarioWidget> {
  late CuestionarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuestionarioModel());
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/escoger-users.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.91, -1.06),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/logoapp.png',
                            width: 110.0,
                            height: 110.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 120.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.96,
                          height: MediaQuery.sizeOf(context).height * 0.75,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFEFE),
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        'Find Your Membership',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF8E058A),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 340.0,
                                    child: Divider(
                                      height: 20.0,
                                      thickness: 2.0,
                                      color: Color(0xFFF0DFEF),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.86,
                                    height: 184.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 16.0, 8.0, 4.0),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                '* Do you need instant messaging for your team?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.firts = true;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: 'Yes',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.firts
                                                ? Color(0xB8D41ACF)
                                                : Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: _model.firts
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.firts = false;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: 'No',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: !_model.firts
                                                ? Color(0xB8D41ACF)
                                                : Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: !_model.firts
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.86,
                                    height: 184.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 16.0, 8.0, 4.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                '* Do you require detailed map features to locate service providers?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.second = true;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: 'Yes',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.second
                                                ? Color(0xB8D41ACF)
                                                : Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: _model.second
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.second = false;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: 'No',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: !_model.second
                                                ? Color(0xB8D41ACF)
                                                : Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: !_model.second
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.86,
                                    height: 184.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 16.0, 8.0, 4.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                '* Do you need to create detailed team profiles for your organization?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.tree = true;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: 'Yes',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.tree
                                                ? Color(0xD5B928B8)
                                                : Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: _model.tree
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.tree = false;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: 'No',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: !_model.tree
                                                ? Color(0xB8D41ACF)
                                                : Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: !_model.tree
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.86,
                                    height: 184.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 16.0, 8.0, 4.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                '* Do you require enhanced search visibility for your services?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.four = true;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: 'Yes',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.four
                                                ? Color(0xB8D41ACF)
                                                : Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: _model.four
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.four = false;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: 'No',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: !_model.four
                                                ? Color(0xB8D41ACF)
                                                : Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: !_model.four
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Divider(
                                    height: 32.0,
                                    thickness: 1.0,
                                    indent: 12.0,
                                    endIndent: 12.0,
                                    color: Color(0xD8BDB8B8),
                                  ),
                                  if (_model.showSugguestions)
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.suguestion == 'Basic') {
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.86,
                                              height: 230.0,
                                              constraints: BoxConstraints(
                                                minHeight: 230.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0x9ED7AE71),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        'Recommended Plan',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Based on your answers, we recommend the',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: ' Basic',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 15.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '  plan.',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        'The Premium plan includes:',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '• Instant messaging for your team',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n• Detailed map features to locate service providers',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n• Customizable team profiles',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n• Enhanced search visibility for your services',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else if (_model.suguestion ==
                                              'Standar') {
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.86,
                                              height: 230.0,
                                              constraints: BoxConstraints(
                                                minHeight: 230.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xE3E6E6E6),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        'Recommended Plan',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Based on your answers, we recommend the',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: ' Standar',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF767676),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 15.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' plan.',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        'The Premium plan includes:',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '• Instant messaging for your team',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n• Detailed map features to locate service providers',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n• Customizable team profiles',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n• Enhanced search visibility for your services',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.86,
                                              height: 230.0,
                                              constraints: BoxConstraints(
                                                minHeight: 230.0,
                                              ),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xACF9CB4A),
                                                    Color(0xA393782B)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        'Recommended Plan',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'Based on your answers, we recommend the',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: ' Premium',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF93782B),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 15.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' plan.',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        'The Premium plan includes:',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '• Instant messaging for your team',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n• Detailed map features to locate service providers',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n• Customizable team profiles',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  '\n• Enhanced search visibility for your services',
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                                MembresiasV2Widget.routeName);
                                          },
                                          text: 'Choose Membership',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 45.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.white,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.black,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Color(0xFF7A7777),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.suguestion ==
                                                'Premiun') {
                                              FFAppState()
                                                  .updateRegisterProviderFormStruct(
                                                (e) => e..plan = Plan.premiun,
                                              );

                                              context.pushNamed(
                                                  RegisterBusiness1Widget
                                                      .routeName);
                                            } else if (_model.suguestion ==
                                                'Standar') {
                                              FFAppState()
                                                  .updateRegisterProviderFormStruct(
                                                (e) => e..plan = Plan.standar,
                                              );

                                              context.pushNamed(
                                                  RegisterProfessional1Widget
                                                      .routeName);
                                            } else {
                                              FFAppState()
                                                  .updateRegisterProviderFormStruct(
                                                (e) => e..plan = Plan.basic,
                                              );

                                              context.pushNamed(
                                                  RegisterProfessional1Widget
                                                      .routeName);
                                            }
                                          },
                                          text: _model.suguestion != ''
                                              ? functions.concatStrings(
                                                  'Select',
                                                  functions.concatStrings(
                                                      _model.suguestion,
                                                      'Plan',
                                                      ' '),
                                                  ' ')!
                                              : 'Select Premium Plan',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 45.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xB8D41ACF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 32.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ].addToEnd(SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
