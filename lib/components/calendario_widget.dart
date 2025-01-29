import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calendario_model.dart';
export 'calendario_model.dart';

class CalendarioWidget extends StatefulWidget {
  const CalendarioWidget({
    super.key,
    this.morning,
    this.noon,
    this.afternoon,
  });

  final List<bool>? morning;
  final List<bool>? noon;
  final List<bool>? afternoon;

  @override
  State<CalendarioWidget> createState() => _CalendarioWidgetState();
}

class _CalendarioWidgetState extends State<CalendarioWidget> {
  late CalendarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarioModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          height: 190.0,
          constraints: const BoxConstraints(
            minHeight: 190.0,
            maxWidth: 392.0,
            maxHeight: 200.0,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: const Color(0xFFC55EBE),
              width: 3.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 14.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  height: 190.0,
                  constraints: const BoxConstraints(
                    minWidth: 90.0,
                    minHeight: 190.0,
                    maxWidth: 90.0,
                    maxHeight: 190.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 2.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Text(
                              'Morning',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Text(
                              'Evening',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 14.0)),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: 190.0,
                constraints: const BoxConstraints(
                  minWidth: 200.0,
                  minHeight: 190.0,
                  maxWidth: 400.0,
                  maxHeight: 190.0,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Mo',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue1 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .morning
                                              .elementAtOrNull(0)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .checkboxValue1 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateMorning(
                                                      (e) => e[0] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.noonValue1 ??= FFAppState()
                                          .registerProviderForm
                                          .noon
                                          .elementAtOrNull(0)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .noonValue1 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateNoon(
                                                      (e) => e[0] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.afternoonValue1 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .afternoon
                                              .elementAtOrNull(0)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .afternoonValue1 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateAfternoon(
                                                      (e) => e[0] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 2.0)),
                            ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .addToStart(const SizedBox(height: 0.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Tu',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue2 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .morning
                                              .elementAtOrNull(1)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .checkboxValue2 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateMorning(
                                                      (e) => e[1] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.noonValue2 ??= FFAppState()
                                          .registerProviderForm
                                          .noon
                                          .elementAtOrNull(1)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .noonValue2 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateNoon(
                                                      (e) => e.insert(1, true),
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.afternoonValue2 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .afternoon
                                              .elementAtOrNull(1)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .afternoonValue2 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateAfternoon(
                                                      (e) => e[1] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 2.0)),
                            ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .addToStart(const SizedBox(height: 0.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'We',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue3 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .morning
                                              .elementAtOrNull(2)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .checkboxValue3 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateMorning(
                                                      (e) => e[2] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.noonValue3 ??= FFAppState()
                                          .registerProviderForm
                                          .noon
                                          .elementAtOrNull(2)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .noonValue3 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateNoon(
                                                      (e) => e.insert(2, true),
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.afternoonValue3 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .afternoon
                                              .elementAtOrNull(2)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .afternoonValue3 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateAfternoon(
                                                      (e) => e[2] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 2.0)),
                            ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .addToStart(const SizedBox(height: 0.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Th',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue4 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .morning
                                              .elementAtOrNull(3)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .checkboxValue4 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateMorning(
                                                      (e) => e[3] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.noonValue4 ??= FFAppState()
                                          .registerProviderForm
                                          .noon
                                          .elementAtOrNull(3)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .noonValue4 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateNoon(
                                                      (e) => e[3] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.afternoonValue4 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .afternoon
                                              .elementAtOrNull(3)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .afternoonValue4 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateAfternoon(
                                                      (e) => e[3] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 2.0)),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Fr',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue5 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .morning
                                              .elementAtOrNull(4)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .checkboxValue5 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateMorning(
                                                      (e) => e[4] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.noonValue5 ??= FFAppState()
                                          .registerProviderForm
                                          .noon
                                          .elementAtOrNull(4)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .noonValue5 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateNoon(
                                                      (e) => e[4] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.afternoonValue5 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .afternoon
                                              .elementAtOrNull(4)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .afternoonValue5 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateAfternoon(
                                                      (e) => e[4] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 2.0)),
                            ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .addToStart(const SizedBox(height: 0.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Sa',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue6 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .morning
                                              .elementAtOrNull(5)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .checkboxValue6 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateMorning(
                                                      (e) => e[5] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.noonValue6 ??= FFAppState()
                                          .registerProviderForm
                                          .noon
                                          .elementAtOrNull(5)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .noonValue6 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateNoon(
                                                      (e) => e[5] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.afternoonValue6 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .afternoon
                                              .elementAtOrNull(5)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .afternoonValue6 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateAfternoon(
                                                      (e) => e[5] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 2.0)),
                            ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .addToStart(const SizedBox(height: 0.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Su',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue7 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .morning
                                              .elementAtOrNull(6)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .checkboxValue7 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateMorning(
                                                      (e) => e[6] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.noonValue7 ??= FFAppState()
                                          .registerProviderForm
                                          .noon
                                          .elementAtOrNull(6)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .noonValue7 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateNoon(
                                                      (e) => e[6] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  decoration: const BoxDecoration(),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.afternoonValue7 ??=
                                          FFAppState()
                                              .registerProviderForm
                                              .afternoon
                                              .elementAtOrNull(6)!,
                                      onChanged: _model.trueS
                                          ? null
                                          : (newValue) async {
                                              safeSetState(() => _model
                                                  .afternoonValue7 = newValue!);
                                              if (newValue!) {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..updateAfternoon(
                                                      (e) => e[6] = true,
                                                    ),
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
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
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor: const Color(0xFFC14BBC),
                                      checkColor: _model.trueS
                                          ? const Color(0xFFC14BBC)
                                          : FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 2.0)),
                            ),
                          ]
                              .divide(const SizedBox(height: 10.0))
                              .addToStart(const SizedBox(height: 0.0)),
                        ),
                      ]
                          .divide(SizedBox(width: () {
                            if (MediaQuery.sizeOf(context).width < 300.0) {
                              return 5.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointSmall) {
                              return 7.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointMedium) {
                              return 15.0;
                            } else if (MediaQuery.sizeOf(context).width <
                                kBreakpointLarge) {
                              return 15.0;
                            } else {
                              return 5.0;
                            }
                          }()))
                          .addToStart(const SizedBox(width: 1.0))
                          .addToEnd(const SizedBox(width: 1.0)),
                    ),
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
