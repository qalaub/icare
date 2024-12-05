import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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
    return Container(
      width: 355.0,
      height: 190.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.8, -0.8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
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
                  ]
                      .divide(const SizedBox(width: 15.0))
                      .addToEnd(const SizedBox(width: 8.0)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 13.0, 0.0),
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
                        ),
                        Expanded(
                          child: GridView(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                  unselectedWidgetColor: const Color(0xFFE0E3E7),
                                ),
                                child: Checkbox(
                                  value: _model.checkboxValue1 ??=
                                      widget.morning![0],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue1 = newValue!);
                                        },
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFE0E3E7),
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue2 ??=
                                      widget.morning![1],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue2 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue3 ??=
                                      widget.morning![2],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue3 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue4 ??=
                                      widget.morning![3],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue4 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue5 ??=
                                      widget.morning![4],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue5 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue6 ??=
                                      widget.morning![5],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue6 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue7 ??=
                                      widget.morning![6],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue7 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 8.0))
                          .addToStart(const SizedBox(width: 8.0))
                          .addToEnd(const SizedBox(width: 8.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 37.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Noon',
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
                        ),
                        Expanded(
                          child: GridView(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
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
                                  value: _model.checkboxValue8 ??=
                                      widget.noon![0],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue8 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue9 ??=
                                      widget.noon![1],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue9 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue10 ??=
                                      widget.noon![2],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue10 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue11 ??=
                                      widget.noon![3],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue11 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue12 ??=
                                      widget.noon![4],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue12 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue13 ??=
                                      widget.noon![5],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue13 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue14 ??=
                                      widget.noon![6],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue14 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 8.0))
                          .addToStart(const SizedBox(width: 8.0))
                          .addToEnd(const SizedBox(width: 8.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                        Expanded(
                          child: GridView(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
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
                                  value: _model.checkboxValue15 ??=
                                      widget.afternoon![0],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue15 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue16 ??=
                                      widget.afternoon![1],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue16 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue17 ??=
                                      widget.afternoon![2],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue17 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue18 ??=
                                      widget.afternoon![3],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue18 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue19 ??=
                                      widget.afternoon![4],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue19 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue20 ??=
                                      widget.afternoon![5],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue20 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
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
                                  value: _model.checkboxValue21 ??=
                                      widget.afternoon![6],
                                  onChanged: _model.trueS
                                      ? null
                                      : (newValue) async {
                                          safeSetState(() => _model
                                              .checkboxValue21 = newValue!);
                                        },
                                  side: BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  activeColor: const Color(0xFFC14BBC),
                                  checkColor: _model.trueS
                                      ? const Color(0xFFC14BBC)
                                      : FlutterFlowTheme.of(context).info,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 8.0))
                          .addToStart(const SizedBox(width: 8.0))
                          .addToEnd(const SizedBox(width: 8.0)),
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ),
            ]
                .divide(const SizedBox(height: 0.0))
                .addToStart(const SizedBox(height: 8.0))
                .addToEnd(const SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}
