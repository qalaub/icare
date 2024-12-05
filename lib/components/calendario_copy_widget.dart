import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calendario_copy_model.dart';
export 'calendario_copy_model.dart';

class CalendarioCopyWidget extends StatefulWidget {
  const CalendarioCopyWidget({super.key});

  @override
  State<CalendarioCopyWidget> createState() => _CalendarioCopyWidgetState();
}

class _CalendarioCopyWidgetState extends State<CalendarioCopyWidget> {
  late CalendarioCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarioCopyModel());
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
      width: 355.0,
      height: 190.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 13.0, 0.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Morning',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 37.0, 0.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Text(
                      'Noon',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Text(
                    'Afternoon',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 18.0)).addToStart(const SizedBox(height: 17.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Text(
                  'Mo',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      value: _model.checkboxValue1 ??=
                          FFAppState().registerProviderForm.morning[0],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue1 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.noonValue1 ??=
                          FFAppState().registerProviderForm.noon[0],
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.afternoonValue1 ??=
                          FFAppState().registerProviderForm.afternoon[0],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.afternoonValue1 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ].divide(const SizedBox(height: 2.0)),
              ),
            ].divide(const SizedBox(height: 20.0)).addToStart(const SizedBox(height: 16.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Text(
                  'Tu',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      value: _model.checkboxValue2 ??=
                          FFAppState().registerProviderForm.morning[1],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue2 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.noonValue2 ??=
                          FFAppState().registerProviderForm.noon[1],
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.afternoonValue2 ??=
                          FFAppState().registerProviderForm.afternoon[1],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.afternoonValue2 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ].divide(const SizedBox(height: 2.0)),
              ),
            ].divide(const SizedBox(height: 20.0)).addToStart(const SizedBox(height: 16.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Text(
                  'We',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      value: _model.checkboxValue3 ??=
                          FFAppState().registerProviderForm.morning[2],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue3 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.noonValue3 ??=
                          FFAppState().registerProviderForm.noon[2],
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.afternoonValue3 ??=
                          FFAppState().registerProviderForm.afternoon[2],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.afternoonValue3 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ].divide(const SizedBox(height: 2.0)),
              ),
            ].divide(const SizedBox(height: 20.0)).addToStart(const SizedBox(height: 16.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Text(
                  'Th',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      value: _model.checkboxValue4 ??=
                          FFAppState().registerProviderForm.morning[3],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue4 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.noonValue4 ??=
                          FFAppState().registerProviderForm.noon[3],
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.afternoonValue4 ??=
                          FFAppState().registerProviderForm.afternoon[3],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.afternoonValue4 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ].divide(const SizedBox(height: 2.0)),
              ),
            ].divide(const SizedBox(height: 20.0)).addToStart(const SizedBox(height: 16.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Text(
                  'Fr',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      value: _model.checkboxValue5 ??=
                          FFAppState().registerProviderForm.morning[4],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue5 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.noonValue5 ??=
                          FFAppState().registerProviderForm.noon[4],
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.afternoonValue5 ??=
                          FFAppState().registerProviderForm.afternoon[4],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.afternoonValue5 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ].divide(const SizedBox(height: 2.0)),
              ),
            ].divide(const SizedBox(height: 20.0)).addToStart(const SizedBox(height: 16.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Text(
                  'Sa',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      value: _model.checkboxValue6 ??=
                          FFAppState().registerProviderForm.morning[5],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue6 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.noonValue6 ??=
                          FFAppState().registerProviderForm.noon[5],
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.afternoonValue6 ??=
                          FFAppState().registerProviderForm.afternoon[5],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.afternoonValue6 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ].divide(const SizedBox(height: 2.0)),
              ),
            ].divide(const SizedBox(height: 20.0)).addToStart(const SizedBox(height: 16.0)),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: Text(
                  'Su',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      value: _model.checkboxValue7 ??=
                          FFAppState().registerProviderForm.morning[6],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.checkboxValue7 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.noonValue7 ??=
                          FFAppState().registerProviderForm.noon[6],
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
                      activeColor: const Color(0xFFC14BBC),
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
                      value: _model.afternoonValue7 ??=
                          FFAppState().registerProviderForm.afternoon[6],
                      onChanged: (newValue) async {
                        safeSetState(() => _model.afternoonValue7 = newValue!);
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
                      activeColor: const Color(0xFFC14BBC),
                      checkColor: FlutterFlowTheme.of(context).info,
                    ),
                  ),
                ].divide(const SizedBox(height: 2.0)),
              ),
            ].divide(const SizedBox(height: 20.0)).addToStart(const SizedBox(height: 16.0)),
          ),
        ]
            .divide(const SizedBox(width: 4.0))
            .addToStart(const SizedBox(width: 8.0))
            .addToEnd(const SizedBox(width: 8.0)),
      ),
    );
  }
}
