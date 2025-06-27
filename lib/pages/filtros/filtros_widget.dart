import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:lock_orientation_library_opafp4/custom_code/actions/index.dart'
    as lock_orientation_library_opafp4_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filtros_model.dart';
export 'filtros_model.dart';

class FiltrosWidget extends StatefulWidget {
  const FiltrosWidget({super.key});

  static String routeName = 'Filtros';
  static String routePath = 'filtros';

  @override
  State<FiltrosWidget> createState() => _FiltrosWidgetState();
}

class _FiltrosWidgetState extends State<FiltrosWidget> {
  late FiltrosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltrosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await lock_orientation_library_opafp4_actions.lockOrientation();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFEEEAEA),
          appBar: AppBar(
            backgroundColor: Color(0xFFC047BB),
            automaticallyImplyLeading: true,
            title: Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                'Filters',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Color(0xFFF7F9F9),
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 4.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_model.dontShow)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 346.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEAEA),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                border: Border.all(
                                  color: Color(0xFFEEEAEA),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Search Distance: ',
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
                                            color: Color(0xFF545454),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions.concatStrings(
                                            _model.distanceValue?.toString(),
                                            'KM',
                                            ' '),
                                        '10 Km',
                                      ),
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
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 346.0,
                              height: 61.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Slider(
                                  key: ValueKey('distance'),
                                  activeColor: Color(0xFFBD39BA),
                                  inactiveColor: Color(0xFFE4E4E4),
                                  min: 10.0,
                                  max: 1300.0,
                                  value: _model.distanceValue ??= (FFAppState()
                                                  .filtersPage
                                                  .distance >=
                                              10.0) &&
                                          (FFAppState().filtersPage.distance <=
                                              1300.0)
                                      ? valueOrDefault<double>(
                                          FFAppState().filtersPage.distance,
                                          50.0,
                                        )
                                      : 50.0,
                                  divisions: 13,
                                  onChanged: (newValue) {
                                    safeSetState(
                                        () => _model.distanceValue = newValue);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 346.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEAEA),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: Color(0xFFEEEAEA),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Show Ages:',
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
                                          color: Color(0xFF545454),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.03, -0.86),
                          child: Container(
                            width: 347.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.77),
                                  child: CheckboxListTile(
                                    key: ValueKey('young'),
                                    value: _model.age1Value ??= FFAppState()
                                            .filtersPage
                                            .age
                                            .contains(FFAppConstants.agesType
                                                .elementAtOrNull(2)) ==
                                        true,
                                    onChanged: (newValue) async {
                                      safeSetState(
                                          () => _model.age1Value = newValue!);
                                    },
                                    title: Text(
                                      'Young (18-25) years',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    activeColor: Color(0xFFBD39BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.13),
                                  child: CheckboxListTile(
                                    key: ValueKey('adult'),
                                    value: _model.age2Value ??= FFAppState()
                                            .filtersPage
                                            .age
                                            .contains(FFAppConstants.agesType
                                                .elementAtOrNull(1)) ==
                                        true,
                                    onChanged: (newValue) async {
                                      safeSetState(
                                          () => _model.age2Value = newValue!);
                                    },
                                    title: Text(
                                      'Adult (25-40) years',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    activeColor: Color(0xFFBD39BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.46),
                                  child: CheckboxListTile(
                                    key: ValueKey('senior'),
                                    value: _model.age3Value ??= FFAppState()
                                            .filtersPage
                                            .age
                                            .contains(FFAppConstants.agesType
                                                .elementAtOrNull(0)) ==
                                        true,
                                    onChanged: (newValue) async {
                                      safeSetState(
                                          () => _model.age3Value = newValue!);
                                    },
                                    title: Text(
                                      'Senior (40-65+) years',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    activeColor: Color(0xFFBD39BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(height: 8.0))
                                  .addToEnd(SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 346.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEAEA),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: Color(0xFFEEEAEA),
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Type of service:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF545454),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.03, -0.86),
                          child: Container(
                            width: 347.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.98),
                                  child: CheckboxListTile(
                                    key: ValueKey('supportWorkers'),
                                    value: _model.supportValue ??= FFAppState()
                                            .filtersPage
                                            .services
                                            .contains(FFAppConstants
                                                .servicesType
                                                .elementAtOrNull(0)) ==
                                        true,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.supportValue = newValue!);
                                    },
                                    title: Text(
                                      'Support Worker',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    activeColor: Color(0xFFBD39BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.46),
                                  child: CheckboxListTile(
                                    key: ValueKey('supportCoordinators'),
                                    value: _model.coordinatorsValue ??=
                                        FFAppState()
                                                .filtersPage
                                                .services
                                                .contains(FFAppConstants
                                                    .servicesType
                                                    .elementAtOrNull(1)) ==
                                            true,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.coordinatorsValue = newValue!);
                                    },
                                    title: Text(
                                      'Support Coordinator',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    activeColor: Color(0xFFBD39BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -0.98),
                                  child: CheckboxListTile(
                                    key: ValueKey('recoveryCoaches'),
                                    value: _model.recoveryValue ??= FFAppState()
                                            .filtersPage
                                            .services
                                            .contains(FFAppConstants
                                                .servicesType
                                                .elementAtOrNull(4)) ==
                                        true,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.recoveryValue = newValue!);
                                    },
                                    title: Text(
                                      'Recovery Coach',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    activeColor: Color(0xFFBD39BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.13),
                                  child: CheckboxListTile(
                                    key: ValueKey('therapeuticSupports'),
                                    value: _model.therapeuticValue ??=
                                        FFAppState()
                                                .filtersPage
                                                .services
                                                .contains(FFAppConstants
                                                    .servicesType
                                                    .elementAtOrNull(2)) ==
                                            true,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.therapeuticValue = newValue!);
                                    },
                                    title: Text(
                                      'Therapeutic Support',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    activeColor: Color(0xFFBD39BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.77),
                                  child: CheckboxListTile(
                                    key: ValueKey('homeMaintenance'),
                                    value: _model.homeValue ??= FFAppState()
                                            .filtersPage
                                            .services
                                            .contains(FFAppConstants
                                                .servicesType
                                                .elementAtOrNull(3)) ==
                                        true,
                                    onChanged: (newValue) async {
                                      safeSetState(
                                          () => _model.homeValue = newValue!);
                                    },
                                    title: Text(
                                      'Home Maintenance ',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                    activeColor: Color(0xFFBD39BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                  if (_model.dontShow)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 346.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEAEA),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                border: Border.all(
                                  color: Color(0xFFEEEAEA),
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Select the days you wish to be served:',
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
                                        color: Color(0xFF545454),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.03, -0.86),
                            child: Container(
                              width: 347.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.98),
                                    child: CheckboxListTile(
                                      key: ValueKey('supportWorkers'),
                                      value: _model.mondayValue ??= FFAppState()
                                              .filtersPage
                                              .schedule
                                              .contains(FFAppConstants.days
                                                  .elementAtOrNull(0)) ==
                                          true,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.mondayValue = newValue!);
                                      },
                                      title: Text(
                                        'Monday ',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      activeColor: Color(0xFFBD39BA),
                                      checkColor: Colors.white,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.46),
                                    child: CheckboxListTile(
                                      key: ValueKey('supportCoordinators'),
                                      value: _model.tuesdayValue ??=
                                          FFAppState()
                                                  .filtersPage
                                                  .schedule
                                                  .contains(FFAppConstants.days
                                                      .elementAtOrNull(1)) ==
                                              true,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.tuesdayValue = newValue!);
                                      },
                                      title: Text(
                                        'Tuesday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      activeColor: Color(0xFFBD39BA),
                                      checkColor: Colors.white,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.98),
                                    child: CheckboxListTile(
                                      key: ValueKey('recoveryCoaches'),
                                      value: _model.wednesdayValue ??=
                                          FFAppState()
                                                  .filtersPage
                                                  .schedule
                                                  .contains(FFAppConstants.days
                                                      .elementAtOrNull(2)) ==
                                              true,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.wednesdayValue = newValue!);
                                      },
                                      title: Text(
                                        'Wednesday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      activeColor: Color(0xFFBD39BA),
                                      checkColor: Colors.white,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.13),
                                    child: CheckboxListTile(
                                      key: ValueKey('therapeuticSupports'),
                                      value: _model.thursdayValue ??=
                                          FFAppState()
                                                  .filtersPage
                                                  .schedule
                                                  .contains(FFAppConstants.days
                                                      .elementAtOrNull(3)) ==
                                              true,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.thursdayValue = newValue!);
                                      },
                                      title: Text(
                                        'Thursday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      activeColor: Color(0xFFBD39BA),
                                      checkColor: Colors.white,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.77),
                                    child: CheckboxListTile(
                                      key: ValueKey('homeMaintenance'),
                                      value: _model.fridayValue ??= FFAppState()
                                              .filtersPage
                                              .schedule
                                              .contains(FFAppConstants.days
                                                  .elementAtOrNull(4)) ==
                                          true,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.fridayValue = newValue!);
                                      },
                                      title: Text(
                                        'Friday ',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      activeColor: Color(0xFFBD39BA),
                                      checkColor: Colors.white,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.77),
                                    child: CheckboxListTile(
                                      key: ValueKey('homeMaintenance'),
                                      value: _model.saturdayValue ??=
                                          FFAppState()
                                                  .filtersPage
                                                  .schedule
                                                  .contains(FFAppConstants.days
                                                      .elementAtOrNull(5)) ==
                                              true,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.saturdayValue = newValue!);
                                      },
                                      title: Text(
                                        'Saturday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      activeColor: Color(0xFFBD39BA),
                                      checkColor: Colors.white,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.77),
                                    child: CheckboxListTile(
                                      key: ValueKey('homeMaintenance'),
                                      value: _model.sundayValue ??= FFAppState()
                                              .filtersPage
                                              .schedule
                                              .contains(FFAppConstants.days
                                                  .elementAtOrNull(6)) ==
                                          true,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.sundayValue = newValue!);
                                      },
                                      title: Text(
                                        'Sunday',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      activeColor: Color(0xFFBD39BA),
                                      checkColor: Colors.white,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.43,
                          height: 54.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: FFButtonWidget(
                            key: ValueKey('clean'),
                            onPressed: () async {
                              FFAppState().updateFiltersPageStruct(
                                (e) => e
                                  ..age = FFAppConstants.clearService.toList()
                                  ..services =
                                      FFAppConstants.clearService.toList(),
                              );
                              FFAppState().update(() {});

                              context.pushNamed(HomeSearchWidget.routeName);
                            },
                            text: 'Clear filters',
                            options: FFButtonOptions(
                              height: 37.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFE3E2E2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF0F0E0F),
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.43,
                            height: 54.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFC56AB1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24.0),
                                bottomRight: Radius.circular(24.0),
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                            child: FFButtonWidget(
                              key: ValueKey('search'),
                              onPressed: () async {
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..age = []
                                    ..services = [],
                                );
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..updateAge(
                                      (e) => e.add(_model.age1Value == true
                                          ? '18-25 years'
                                          : ' '),
                                    )
                                    ..updateServices(
                                      (e) => e.add(_model.supportValue == true
                                          ? 'Support Worker'
                                          : ' '),
                                    ),
                                );
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..updateAge(
                                      (e) => e.add(_model.age2Value == true
                                          ? '25-40 years'
                                          : ' '),
                                    )
                                    ..updateServices(
                                      (e) => e.add(
                                          _model.coordinatorsValue == true
                                              ? 'Support  Coordinator'
                                              : ' '),
                                    ),
                                );
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..updateAge(
                                      (e) => e.add(_model.age3Value == true
                                          ? '40-65+ years'
                                          : ' '),
                                    )
                                    ..updateServices(
                                      (e) => e.add(
                                          _model.therapeuticValue == true
                                              ? 'Therapeutic Support'
                                              : ' '),
                                    ),
                                );
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..updateServices(
                                      (e) => e.add(_model.homeValue == true
                                          ? 'Home Maintenance'
                                          : ' '),
                                    ),
                                );
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..updateServices(
                                      (e) => e.add(_model.recoveryValue == true
                                          ? 'Recovery Coach'
                                          : ' '),
                                    ),
                                );

                                context.pushNamed(
                                  HomeSearchWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.topToBottom,
                                    ),
                                  },
                                );
                              },
                              text: 'Search',
                              options: FFButtonOptions(
                                height: 37.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 12.0, 24.0, 12.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFBD39BA),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 13.0))
                    .addToStart(SizedBox(height: 20.0))
                    .addToEnd(SizedBox(height: 20.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
