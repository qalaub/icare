import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendario_copy2_model.dart';
export 'calendario_copy2_model.dart';

class CalendarioCopy2Widget extends StatefulWidget {
  const CalendarioCopy2Widget({
    super.key,
    this.morning,
    this.noon,
    this.afternoon,
  });

  final List<bool>? morning;
  final List<bool>? noon;
  final List<bool>? afternoon;

  @override
  State<CalendarioCopy2Widget> createState() => _CalendarioCopy2WidgetState();
}

class _CalendarioCopy2WidgetState extends State<CalendarioCopy2Widget> {
  late CalendarioCopy2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarioCopy2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().updateRegisterProviderFormStruct(
        (e) => e
          ..morning = widget.morning!.toList()
          ..noon = widget.noon!.toList()
          ..afternoon = widget.afternoon!.toList(),
      );
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              width: 320.0,
              height: 190.0,
              constraints: BoxConstraints(
                minHeight: 190.0,
                maxWidth: 392.0,
                maxHeight: 190.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Color(0xFFC55EBE),
                  width: 3.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 14.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: 190.0,
                      constraints: BoxConstraints(
                        minWidth: 90.0,
                        minHeight: 190.0,
                        maxWidth: 90.0,
                        maxHeight: 190.0,
                      ),
                      decoration: BoxDecoration(
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 2.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Text(
                                  'Morning',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
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
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Text(
                                  'Evening',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(height: 10.0))
                              .addToStart(SizedBox(height: 10.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: 190.0,
                    constraints: BoxConstraints(
                      minWidth: 200.0,
                      minHeight: 190.0,
                      maxWidth: 400.0,
                      maxHeight: 190.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(30.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'Mo',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFC14BBC),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue1 ??=
                                              (widget.morning!
                                                  .elementAtOrNull(0))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.noonValue1 ??= (widget
                                              .noon!
                                              .elementAtOrNull(0))!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.noonValue1 = newValue!);
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.afternoonValue1 ??=
                                              (widget.afternoon!
                                                  .elementAtOrNull(0))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ].addToStart(SizedBox(height: 0.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'Tu',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFC14BBC),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue2 ??=
                                              (widget.morning!
                                                  .elementAtOrNull(1))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.noonValue2 ??= (widget
                                              .noon!
                                              .elementAtOrNull(1))!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.noonValue2 = newValue!);
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.afternoonValue2 ??=
                                              (widget.afternoon!
                                                  .elementAtOrNull(1))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ].addToStart(SizedBox(height: 0.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'We',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFC14BBC),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue3 ??=
                                              (widget.morning!
                                                  .elementAtOrNull(2))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.noonValue3 ??= (widget
                                              .noon!
                                              .elementAtOrNull(2))!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.noonValue3 = newValue!);
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.afternoonValue3 ??=
                                              (widget.afternoon!
                                                  .elementAtOrNull(2))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ].addToStart(SizedBox(height: 0.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'Th',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFC14BBC),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue4 ??=
                                              (widget.morning!
                                                  .elementAtOrNull(3))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.noonValue4 ??= (widget
                                              .noon!
                                              .elementAtOrNull(3))!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.noonValue4 = newValue!);
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.afternoonValue4 ??=
                                              (widget.afternoon!
                                                  .elementAtOrNull(3))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'Fr',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFC14BBC),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue5 ??=
                                              (widget.morning!
                                                  .elementAtOrNull(4))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.noonValue5 ??= (widget
                                              .noon!
                                              .elementAtOrNull(4))!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.noonValue5 = newValue!);
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.afternoonValue5 ??=
                                              (widget.afternoon!
                                                  .elementAtOrNull(4))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ].addToStart(SizedBox(height: 0.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'Sa',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFC14BBC),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue6 ??=
                                              (widget.morning!
                                                  .elementAtOrNull(5))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.noonValue6 ??= (widget
                                              .noon!
                                              .elementAtOrNull(5))!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.noonValue6 = newValue!);
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.afternoonValue6 ??=
                                              (widget.afternoon!
                                                  .elementAtOrNull(5))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ].addToStart(SizedBox(height: 0.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'Su',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFC14BBC),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue7 ??=
                                              (widget.morning!
                                                  .elementAtOrNull(6))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.noonValue7 ??= (widget
                                              .noon!
                                              .elementAtOrNull(6))!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.noonValue7 = newValue!);
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(),
                                      child: Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              Color(0xFF9C9C9C),
                                        ),
                                        child: Checkbox(
                                          value: _model.afternoonValue7 ??=
                                              (widget.afternoon!
                                                  .elementAtOrNull(6))!,
                                          onChanged: (newValue) async {
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
                                            color: Color(0xFF9C9C9C),
                                          ),
                                          activeColor: Color(0xFFC14BBC),
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ].addToStart(SizedBox(height: 0.0)),
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
                              .addToStart(SizedBox(width: 1.0))
                              .addToEnd(SizedBox(width: 1.0)),
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
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: 390.0,
            height: 190.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
