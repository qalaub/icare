import '/backend/schema/enums/enums.dart';
import '/components/calendario_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/v2/professional/imganes/imganes_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'descripcion_profesional_model.dart';
export 'descripcion_profesional_model.dart';

class DescripcionProfesionalWidget extends StatefulWidget {
  const DescripcionProfesionalWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.video,
    required this.services,
    required this.imgs,
    this.company,
    this.morning,
    this.noon,
    this.afternoon,
    this.abn,
    this.ndis,
    this.years,
    required this.plan,
  });

  final String? parameter1;
  final String? parameter2;
  final String? video;
  final List<String>? services;
  final List<String>? imgs;
  final String? company;
  final List<bool>? morning;
  final List<bool>? noon;
  final List<bool>? afternoon;
  final String? abn;
  final String? ndis;
  final int? years;
  final Plan? plan;

  @override
  State<DescripcionProfesionalWidget> createState() =>
      _DescripcionProfesionalWidgetState();
}

class _DescripcionProfesionalWidgetState
    extends State<DescripcionProfesionalWidget> {
  late DescripcionProfesionalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescripcionProfesionalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Text(
                        'Description',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFC14BBC),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .fontStyle,
                                ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Builder(
                            builder: (context) {
                              if (!_model.more) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 2.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.parameter1,
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat, lectus nec pretium vestibulum, tortor leo aliquam eros, non elementum urna purus laoreet enim. Etiam a libero porttitor, imperdiet lorem non, ornare velit. Etiam non mattis sem, nec porta metus. Sed imperdiet, nibh eget vestibulum imperdiet, quam diam tincidunt enim, ac lacinia mi purus at ante. Vivamus nec sapien fermentum, varius dolor et, molestie diam. Mauris a lectus at lorem ornare vehicula eget id enim. Nullam aliquet mattis ullamcorper. Donec malesuada, nibh nec imperdiet interdum, quam sem euismod nulla, sit amet vestibulum ipsum tortor vitae urna. Nullam id lectus non diam pulvinar consequat eget eu lorem.',
                                    ).maybeHandleOverflow(
                                      maxChars: 200,
                                      replacement: '…',
                                    ),
                                    textAlign: TextAlign.start,
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
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 2.0, 0.0, 0.0),
                                  child: Text(
                                    widget.parameter1!.maybeHandleOverflow(
                                      maxChars: 2000,
                                      replacement: '…',
                                    ),
                                    textAlign: TextAlign.start,
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
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    if (functions.getLengthString(widget.parameter1!) > 200)
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.more = !_model.more;
                            _model.updatePage(() {});
                          },
                          child: Text(
                            !_model.more ? 'View more' : 'View less',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFC14BBC),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 500.0,
            child: Divider(
              thickness: 1.0,
              color: Color(0xDEBAB7B7),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: MediaQuery.sizeOf(context).height * 0.3,
            decoration: BoxDecoration(),
            child: wrapWithModel(
              model: _model.imganesModel,
              updateCallback: () => safeSetState(() {}),
              child: ImganesWidget(
                professional: widget.imgs!,
              ),
            ),
          ),
          SizedBox(
            width: 500.0,
            child: Divider(
              thickness: 1.0,
              color: Color(0xDEBAB7B7),
            ),
          ),
          Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowVideoPlayer(
                  path: widget.video != null && widget.video != ''
                      ? widget.video!
                      : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/gv12biya5vta/video_coming_soon!.mp4',
                  videoType: VideoType.network,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.785,
                  aspectRatio: 0.56,
                  autoPlay: true,
                  looping: true,
                  showControls: true,
                  allowFullScreen: false,
                  allowPlaybackSpeedMenu: false,
                  lazyLoad: false,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 500.0,
            child: Divider(
              thickness: 1.0,
              color: Color(0xDEBAB7B7),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 0.0, 8.0),
                  child: Text(
                    'Availability',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontStyle,
                          ),
                          color: Color(0xFFC14BBC),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .displaySmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .displaySmall
                              .fontStyle,
                        ),
                  ),
                ),
              ),
            ),
          ),
          wrapWithModel(
            model: _model.calendarioModel,
            updateCallback: () => safeSetState(() {}),
            child: CalendarioWidget(
              morning: widget.morning,
              noon: widget.noon,
              afternoon: widget.afternoon,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 0.0, 8.0),
                    child: Text(
                      'Services Provided',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .fontStyle,
                            ),
                            color: Color(0xFFC14BBC),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                  ),
                  child: Container(
                    width: 320.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      border: Border.all(
                        color: Color(0xFFC55EBE),
                        width: 3.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -0.98),
                          child: Material(
                            color: Colors.transparent,
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                unselectedWidgetColor: Color(0xFF9C9C9C),
                              ),
                              child: CheckboxListTile(
                                key: ValueKey('supportWorkers'),
                                value: _model.supportValue ??= widget.services
                                        ?.contains(FFAppConstants.servicesType
                                            .elementAtOrNull(0)) ==
                                    true,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.supportValue = newValue!);
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
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                                activeColor: Color(0xFFBD39BA),
                                checkColor: Colors.white,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -0.46),
                          child: Material(
                            color: Colors.transparent,
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                unselectedWidgetColor: Color(0xFF9C9C9C),
                              ),
                              child: CheckboxListTile(
                                key: ValueKey('supportCoordinators'),
                                value: _model.coordinatorsValue ??= widget
                                        .services
                                        ?.contains(FFAppConstants.servicesType
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                                activeColor: Color(0xFFBD39BA),
                                checkColor: Colors.white,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -0.98),
                          child: Material(
                            color: Colors.transparent,
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                unselectedWidgetColor: Color(0xFF9C9C9C),
                              ),
                              child: CheckboxListTile(
                                key: ValueKey('recoveryCoaches'),
                                value: _model.recoveryValue ??= widget.services
                                        ?.contains(FFAppConstants.servicesType
                                            .elementAtOrNull(4)) ==
                                    true,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.recoveryValue = newValue!);
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                                activeColor: Color(0xFFBD39BA),
                                checkColor: Colors.white,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.13),
                          child: Material(
                            color: Colors.transparent,
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                unselectedWidgetColor: Color(0xFF9C9C9C),
                              ),
                              child: CheckboxListTile(
                                key: ValueKey('therapeuticSupports'),
                                value: _model.therapeuticValue ??= widget
                                        .services
                                        ?.contains(FFAppConstants.servicesType
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                                activeColor: Color(0xFFBD39BA),
                                checkColor: Colors.white,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.77),
                          child: Material(
                            color: Colors.transparent,
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                unselectedWidgetColor: Color(0xFF9C9C9C),
                              ),
                              child: CheckboxListTile(
                                key: ValueKey('homeMaintenance'),
                                value: _model.homeValue ??= widget.services
                                        ?.contains(FFAppConstants.servicesType
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                                tileColor: Colors.transparent,
                                activeColor: Color(0xFFBD39BA),
                                checkColor: Colors.white,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 0.0, 8.0),
                child: Text(
                  'Provider details',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FlutterFlowTheme.of(context)
                              .displaySmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .displaySmall
                              .fontStyle,
                        ),
                        color: Color(0xFFC14BBC),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .displaySmall
                            .fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).displaySmall.fontStyle,
                      ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  width: 320.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xFFC55EBE),
                      width: 3.0,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 270.0,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -0.75),
                                          child: Icon(
                                            Icons.business_center_outlined,
                                            color: Color(0xFF0E70DF),
                                            size: 22.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'Experience',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  widget.parameter2!,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if ((widget.company != '') &&
                            (widget.plan != Plan.basic) &&
                            (widget.plan != Plan.standar))
                          Divider(
                            height: 16.0,
                            thickness: 3.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        if ((widget.company != '') &&
                            (widget.plan != Plan.basic) &&
                            (widget.plan != Plan.standar))
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 270.0,
                              height: 50.0,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -0.75),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 3.0),
                                          child: Icon(
                                            Icons.add_business,
                                            color: Color(0xFF0E70DF),
                                            size: 22.0,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Business Name',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.black,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                widget.company,
                                                'a',
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Divider(
                          height: 16.0,
                          thickness: 3.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 270.0,
                            height: 50.0,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget.ndis != '')
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if (widget.ndis != '')
                                            Icon(
                                              Icons.check_circle,
                                              color: Color(0xFFE069BF),
                                              size: 22.0,
                                            ),
                                        ].addToStart(SizedBox(height: 5.0)),
                                      ),
                                    if (widget.ndis == null ||
                                        widget.ndis == '')
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if (widget.ndis == null ||
                                              widget.ndis == '')
                                            Icon(
                                              Icons.cancel,
                                              color: Color(0xFFE069BF),
                                              size: 22.0,
                                            ),
                                        ].addToStart(SizedBox(height: 5.0)),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'NDIS Registration',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              widget.ndis != null &&
                                                      widget.ndis != ''
                                                  ? 'YES'
                                                  : 'NO',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (widget.abn != '')
                          Divider(
                            height: 16.0,
                            thickness: 3.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        if (widget.abn != '')
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 10.0),
                              child: Container(
                                width: 270.0,
                                height: 50.0,
                                decoration: BoxDecoration(),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -0.75),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Color(0xFFE069BF),
                                            size: 22.0,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'ABN Registration',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget.abn,
                                                  '53346346',
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ].addToStart(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
