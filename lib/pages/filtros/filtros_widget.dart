import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filtros_model.dart';
export 'filtros_model.dart';

class FiltrosWidget extends StatefulWidget {
  const FiltrosWidget({super.key});

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFEEEAEA),
        appBar: AppBar(
          backgroundColor: const Color(0xFFC047BB),
          automaticallyImplyLeading: true,
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Filters',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: const Color(0xFFF7F9F9),
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 346.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEEAEA),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: const Color(0xFFEEEAEA),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Search Distance:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: const Color(0xFF545454),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions.concatStrings(
                                          _model.distanceValue?.toString(),
                                          'Mi',
                                          ' '),
                                      '10 Km',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 346.0,
                            height: 61.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
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
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Slider(
                                activeColor: const Color(0xFFFF09BA),
                                inactiveColor: const Color(0xFFE4E4E4),
                                min: 10.0,
                                max: 1000.0,
                                value: _model.distanceValue ??= (FFAppState()
                                                .filtersPage
                                                .distance >=
                                            10.0) &&
                                        (FFAppState().filtersPage.distance <=
                                            1000.0)
                                    ? valueOrDefault<double>(
                                        FFAppState().filtersPage.distance,
                                        10.0,
                                      )
                                    : 10.0,
                                divisions: 10,
                                onChanged: (newValue) {
                                  setState(
                                      () => _model.distanceValue = newValue);
                                },
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 346.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEEAEA),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: const Color(0xFFEEEAEA),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Text(
                                      'Show Ages:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: const Color(0xFF545454),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          () {
                                            if (FFAppState()
                                                    .filtersPage
                                                    .age
                                                    .contains(FFAppConstants
                                                        .agesType[2]) ==
                                                true) {
                                              return 'Young ';
                                            } else if (FFAppState()
                                                    .filtersPage
                                                    .age
                                                    .contains(FFAppConstants
                                                        .agesType[1]) ==
                                                true) {
                                              return 'Adult ';
                                            } else if (FFAppState()
                                                    .filtersPage
                                                    .age
                                                    .contains(FFAppConstants
                                                        .agesType[0]) ==
                                                true) {
                                              return 'Senior ';
                                            } else {
                                              return 'Young ';
                                            }
                                          }(),
                                          'Young',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          () {
                                            if (FFAppState()
                                                    .filtersPage
                                                    .age
                                                    .contains(FFAppConstants
                                                        .agesType[2]) ==
                                                true) {
                                              return '18-25';
                                            } else if (FFAppState()
                                                    .filtersPage
                                                    .age
                                                    .contains(FFAppConstants
                                                        .agesType[1]) ==
                                                true) {
                                              return '25-40';
                                            } else if (FFAppState()
                                                    .filtersPage
                                                    .age
                                                    .contains(FFAppConstants
                                                        .agesType[0]) ==
                                                true) {
                                              return '40-60+';
                                            } else {
                                              return '40-60+ ';
                                            }
                                          }(),
                                          '18-25',
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Montserrat',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: 346.0,
                              height: 61.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
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
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Slider(
                                  activeColor: const Color(0xFFFF09BA),
                                  inactiveColor: const Color(0xFFE4E4E4),
                                  min: 1.0,
                                  max: 3.0,
                                  value: _model.ageValue ??=
                                      valueOrDefault<double>(
                                    () {
                                      if (FFAppState().filtersPage.age.contains(
                                              FFAppConstants.agesType[2]) ==
                                          true) {
                                        return 1.0;
                                      } else if (FFAppState()
                                              .filtersPage
                                              .age
                                              .contains(
                                                  FFAppConstants.agesType[1]) ==
                                          true) {
                                        return 2.0;
                                      } else if (FFAppState()
                                              .filtersPage
                                              .age
                                              .contains(
                                                  FFAppConstants.agesType[0]) ==
                                          true) {
                                        return 3.0;
                                      } else {
                                        return 1.0;
                                      }
                                    }(),
                                    1.0,
                                  ),
                                  divisions: 2,
                                  onChanged: (newValue) async {
                                    setState(() => _model.ageValue = newValue);
                                    FFAppState().updateFiltersPageStruct(
                                      (e) => e..age = [],
                                    );
                                    FFAppState().updateFiltersPageStruct(
                                      (e) => e
                                        ..updateAge(
                                          (e) => e.add(_model.ageValue == 1.0
                                              ? '18-25 years'
                                              : ' '),
                                        ),
                                    );
                                    FFAppState().updateFiltersPageStruct(
                                      (e) => e
                                        ..updateAge(
                                          (e) => e.add(_model.ageValue == 2.0
                                              ? '25-40 years'
                                              : ' '),
                                        ),
                                    );
                                    FFAppState().updateFiltersPageStruct(
                                      (e) => e
                                        ..updateAge(
                                          (e) => e.add(_model.ageValue == 3.0
                                              ? '40-65+ years'
                                              : ' '),
                                        ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 346.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEEAEA),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: const Color(0xFFEEEAEA),
                              ),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Type of service:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: const Color(0xFF545454),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.03, -0.86),
                          child: Container(
                            width: 347.0,
                            height: 204.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
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
                                  alignment: const AlignmentDirectional(0.0, 0.77),
                                  child: CheckboxListTile(
                                    value: _model.homeValue ??= FFAppState()
                                            .filtersPage
                                            .services
                                            .contains(FFAppConstants
                                                .servicesType[3]) ==
                                        true,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => _model.homeValue = newValue!);
                                    },
                                    title: Text(
                                      'Home Maintenance ',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    activeColor: const Color(0xFFFF09BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.13),
                                  child: CheckboxListTile(
                                    value: _model.therapeuticValue ??=
                                        FFAppState()
                                                .filtersPage
                                                .services
                                                .contains(FFAppConstants
                                                    .servicesType[2]) ==
                                            true,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.therapeuticValue = newValue!);
                                    },
                                    title: Text(
                                      '\tTherapeutic Supports',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    activeColor: const Color(0xFFFF09BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -0.46),
                                  child: CheckboxListTile(
                                    value: _model.coordinatorsValue ??=
                                        FFAppState()
                                                .filtersPage
                                                .services
                                                .contains(FFAppConstants
                                                    .servicesType[1]) ==
                                            true,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.coordinatorsValue = newValue!);
                                    },
                                    title: Text(
                                      '\tCoordinators',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    activeColor: const Color(0xFFFF09BA),
                                    checkColor: Colors.white,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -0.98),
                                  child: CheckboxListTile(
                                    value: _model.supportValue ??= FFAppState()
                                            .filtersPage
                                            .services
                                            .contains(FFAppConstants
                                                .servicesType[0]) ==
                                        true,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.supportValue = newValue!);
                                    },
                                    title: Text(
                                      'Support Workers',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    activeColor: const Color(0xFFFF09BA),
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
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 346.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEEAEA),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              border: Border.all(
                                color: const Color(0xFFEEEAEA),
                              ),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'caregiver language',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: const Color(0xFF545454),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 10.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF6F5F5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  height: 48.0,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.languageValueController ??=
                                            FormFieldController<String>(
                                      _model.languageValue ??=
                                          FFAppState().filtersPage.language,
                                    ),
                                    options: List<String>.from(
                                        ['Spanish', 'English']),
                                    optionLabels: const ['Spanish', 'English'],
                                    onChanged: (val) => setState(
                                        () => _model.languageValue = val),
                                    width: 300.0,
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Please select...',
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black,
                                      size: 24.0,
                                    ),
                                    fillColor: const Color(0xFEFDA0FD),
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().filtersPage =
                                  FiltersStruct.fromSerializableMap(
                                      jsonDecode('{\"distance\":\"100000\"}'));

                              context.pushNamed(
                                'HomeSearch',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.topToBottom,
                                  ),
                                },
                              );
                            },
                            text: 'Clean filters',
                            options: FFButtonOptions(
                              height: 37.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFFE3E2E2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xFF0F0E0F),
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.43,
                            height: 54.0,
                            decoration: const BoxDecoration(
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
                              onPressed: () async {
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..distance = _model.distanceValue
                                    ..language = _model.languageValue
                                    ..age = []
                                    ..services = [],
                                );
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..updateAge(
                                      (e) => e.add(_model.ageValue == 1.0
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
                                      (e) => e.add(_model.ageValue == 2.0
                                          ? '25-40 years'
                                          : ' '),
                                    )
                                    ..updateServices(
                                      (e) => e.add(
                                          _model.coordinatorsValue == true
                                              ? ' Coordinator'
                                              : ' '),
                                    ),
                                );
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..updateAge(
                                      (e) => e.add(_model.ageValue == 3.0
                                          ? '40-65+ years'
                                          : ' '),
                                    )
                                    ..updateServices(
                                      (e) => e.add(
                                          _model.therapeuticValue == true
                                              ? 'Therapeutic Supports'
                                              : ' '),
                                    ),
                                );
                                FFAppState().updateFiltersPageStruct(
                                  (e) => e
                                    ..updateServices(
                                      (e) => e.add(_model.homeValue == true
                                          ? 'Home Maintence'
                                          : ' '),
                                    ),
                                );

                                context.pushNamed(
                                  'HomeSearch',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 12.0, 24.0, 12.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xB3FF09BA),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 16.0)),
                    ),
                  ),
                ]
                    .divide(const SizedBox(height: 13.0))
                    .addToStart(const SizedBox(height: 20.0))
                    .addToEnd(const SizedBox(height: 20.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
