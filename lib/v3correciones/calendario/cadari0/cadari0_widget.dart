import '';
import '/components/calendario_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cadari0_model.dart';
export 'cadari0_model.dart';

class Cadari0Widget extends StatefulWidget {
  const Cadari0Widget({
    super.key,
    this.bussinesRef,
    bool? isBussines,
  }) : this.isBussines = isBussines ?? false;

  final DocumentReference? bussinesRef;
  final bool isBussines;

  static String routeName = 'cadari0';
  static String routePath = 'cadari0';

  @override
  State<Cadari0Widget> createState() => _Cadari0WidgetState();
}

class _Cadari0WidgetState extends State<Cadari0Widget> {
  late Cadari0Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cadari0Model());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/escoger-users.png',
                  ).image,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 384.0,
                      height: 384.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                        border: Border.all(
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Select work days',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 19.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 23.0,
                            thickness: 2.0,
                            color: Color(0xFFF0DFEF),
                          ),
                          wrapWithModel(
                            model: _model.calendarioCopyModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CalendarioCopyWidget(),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if ((FFAppState()
                                              .registerProviderForm
                                              .morning
                                              .contains(_model.trueS) ==
                                          true) ||
                                      (FFAppState()
                                              .registerProviderForm
                                              .noon
                                              .contains(_model.trueS) ==
                                          true) ||
                                      (FFAppState()
                                              .registerProviderForm
                                              .afternoon
                                              .contains(_model.trueS) ==
                                          true)) {
                                    if (widget.isBussines) {
                                      context.pushNamed(
                                          RegisterBusiness4Widget.routeName);
                                    } else {
                                      context.pushNamed(
                                        RegisterPfofesional4Widget.routeName,
                                        queryParameters: {
                                          'businessRef': serializeParam(
                                            widget.bussinesRef,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You must select at least one day',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0xFFBE39D2),
                                      ),
                                    );
                                  }
                                },
                                text: 'Continue',
                                options: FFButtonOptions(
                                  width: 279.0,
                                  height: 45.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFB928B8),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/logoapp.png',
                          width: 123.0,
                          height: 113.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.91, -0.96),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
