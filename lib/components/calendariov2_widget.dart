import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendariov2_model.dart';
export 'calendariov2_model.dart';

class Calendariov2Widget extends StatefulWidget {
  const Calendariov2Widget({super.key});

  @override
  State<Calendariov2Widget> createState() => _Calendariov2WidgetState();
}

class _Calendariov2WidgetState extends State<Calendariov2Widget> {
  late Calendariov2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Calendariov2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 326.0,
      height: 261.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    'Morning',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Colors.black,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    'Afternoon',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: Colors.black,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: Text(
                      'Evening',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Colors.black,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ),
            ]
                .divide(SizedBox(width: 16.0))
                .addToStart(SizedBox(width: 64.0))
                .addToEnd(SizedBox(width: 64.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      'Mo',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFC14BBC),
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue1 ??= FFAppState()
                              .registerProviderForm
                              .morning
                              .elementAtOrNull(0)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue1 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[0] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[0] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.noonValue1 ??= FFAppState()
                              .registerProviderForm
                              .noon
                              .elementAtOrNull(0)!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.noonValue1 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[0] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[0] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.afternoonValue1 ??= FFAppState()
                              .registerProviderForm
                              .afternoon
                              .elementAtOrNull(0)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.afternoonValue1 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[0] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[0] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ].divide(SizedBox(width: 62.0)),
                  ),
                ]
                    .divide(SizedBox(width: 34.0))
                    .addToStart(SizedBox(width: 16.0))
                    .addToEnd(SizedBox(width: 16.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      'Tu',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFC14BBC),
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue2 ??= FFAppState()
                              .registerProviderForm
                              .morning
                              .elementAtOrNull(1)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue2 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[1] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[1] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.noonValue2 ??= FFAppState()
                              .registerProviderForm
                              .noon
                              .elementAtOrNull(1)!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.noonValue2 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e.insert(1, true),
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e.insert(1, false),
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.afternoonValue2 ??= FFAppState()
                              .registerProviderForm
                              .afternoon
                              .elementAtOrNull(1)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.afternoonValue2 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[1] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[1] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ].divide(SizedBox(width: 62.0)),
                  ),
                ]
                    .divide(SizedBox(width: 39.0))
                    .addToStart(SizedBox(width: 16.0))
                    .addToEnd(SizedBox(width: 16.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      'We',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFC14BBC),
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue3 ??= FFAppState()
                              .registerProviderForm
                              .morning
                              .elementAtOrNull(2)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue3 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[2] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[2] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.noonValue3 ??= FFAppState()
                              .registerProviderForm
                              .noon
                              .elementAtOrNull(2)!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.noonValue3 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e.insert(2, true),
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e.insert(2, false),
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.afternoonValue3 ??= FFAppState()
                              .registerProviderForm
                              .afternoon
                              .elementAtOrNull(2)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.afternoonValue3 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[2] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[2] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ].divide(SizedBox(width: 62.0)),
                  ),
                ]
                    .divide(SizedBox(width: 33.0))
                    .addToStart(SizedBox(width: 16.0))
                    .addToEnd(SizedBox(width: 16.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      'Th',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFC14BBC),
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue4 ??= FFAppState()
                              .registerProviderForm
                              .morning
                              .elementAtOrNull(3)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue4 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[3] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[3] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.noonValue4 ??= FFAppState()
                              .registerProviderForm
                              .noon
                              .elementAtOrNull(3)!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.noonValue4 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[3] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[3] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.afternoonValue4 ??= FFAppState()
                              .registerProviderForm
                              .afternoon
                              .elementAtOrNull(3)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.afternoonValue4 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[3] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[3] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ].divide(SizedBox(width: 62.0)),
                  ),
                ]
                    .divide(SizedBox(width: 40.0))
                    .addToStart(SizedBox(width: 16.0))
                    .addToEnd(SizedBox(width: 16.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      'Fr',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFC14BBC),
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue5 ??= FFAppState()
                              .registerProviderForm
                              .morning
                              .elementAtOrNull(4)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue5 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[4] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[4] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.noonValue5 ??= FFAppState()
                              .registerProviderForm
                              .noon
                              .elementAtOrNull(4)!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.noonValue5 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[4] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[4] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.afternoonValue5 ??= FFAppState()
                              .registerProviderForm
                              .afternoon
                              .elementAtOrNull(4)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.afternoonValue5 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[4] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[4] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ].divide(SizedBox(width: 62.0)),
                  ),
                ]
                    .divide(SizedBox(width: 44.0))
                    .addToStart(SizedBox(width: 16.0))
                    .addToEnd(SizedBox(width: 16.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      'Sa',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFC14BBC),
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue6 ??= FFAppState()
                              .registerProviderForm
                              .morning
                              .elementAtOrNull(5)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue6 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[5] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[5] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.noonValue6 ??= FFAppState()
                              .registerProviderForm
                              .noon
                              .elementAtOrNull(5)!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.noonValue6 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[5] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[5] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.afternoonValue6 ??= FFAppState()
                              .registerProviderForm
                              .afternoon
                              .elementAtOrNull(5)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.afternoonValue6 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[5] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[5] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ].divide(SizedBox(width: 62.0)),
                  ),
                ]
                    .divide(SizedBox(width: 42.0))
                    .addToStart(SizedBox(width: 16.0))
                    .addToEnd(SizedBox(width: 16.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      'Su',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFFC14BBC),
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue7 ??= FFAppState()
                              .registerProviderForm
                              .morning
                              .elementAtOrNull(6)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue7 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[6] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateMorning(
                                    (e) => e[6] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.noonValue7 ??= FFAppState()
                              .registerProviderForm
                              .noon
                              .elementAtOrNull(6)!,
                          onChanged: (newValue) async {
                            safeSetState(() => _model.noonValue7 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[6] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateNoon(
                                    (e) => e[6] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.afternoonValue7 ??= FFAppState()
                              .registerProviderForm
                              .afternoon
                              .elementAtOrNull(6)!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.afternoonValue7 = newValue!);
                            if (newValue!) {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[6] = true,
                                  ),
                              );
                              safeSetState(() {});
                            } else {
                              FFAppState().updateRegisterProviderFormStruct(
                                (e) => e
                                  ..updateAfternoon(
                                    (e) => e[6] = false,
                                  ),
                              );
                              safeSetState(() {});
                            }
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: Color(0xFFC14BBC),
                          checkColor: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                    ].divide(SizedBox(width: 62.0)),
                  ),
                ]
                    .divide(SizedBox(width: 41.0))
                    .addToStart(SizedBox(width: 16.0))
                    .addToEnd(SizedBox(width: 16.0)),
              ),
            ].addToStart(SizedBox(height: 8.0)),
          ),
        ],
      ),
    );
  }
}
