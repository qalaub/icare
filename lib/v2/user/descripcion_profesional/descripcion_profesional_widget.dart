import '/components/calendario_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/v2/professional/imganes/imganes_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'descripcion_profesional_model.dart';
export 'descripcion_profesional_model.dart';

class DescripcionProfesionalWidget extends StatefulWidget {
  const DescripcionProfesionalWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    String? video,
    required this.services,
    required this.imgs,
    String? company,
    this.morning,
    this.noon,
    this.afternoon,
    this.abn,
  })  : video = video ??
            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
        company = company ?? 'default230';

  final String? parameter1;
  final String? parameter2;
  final String video;
  final List<String>? services;
  final List<String>? imgs;
  final String company;
  final List<bool>? morning;
  final List<bool>? noon;
  final List<bool>? afternoon;
  final String? abn;

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
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Text(
                        'Description',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Montserrat',
                                  color: const Color(0xFFC14BBC),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Builder(
                            builder: (context) {
                              if (!_model.more) {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
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
                        alignment: const AlignmentDirectional(1.0, 0.0),
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
                                  fontFamily: 'Montserrat',
                                  color: const Color(0xFFC14BBC),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 500.0,
            child: Divider(
              thickness: 1.0,
              color: Color(0xDEBAB7B7),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 235.0,
              constraints: const BoxConstraints(
                maxWidth: 355.0,
              ),
              decoration: const BoxDecoration(),
              child: wrapWithModel(
                model: _model.imganesModel,
                updateCallback: () => safeSetState(() {}),
                child: ImganesWidget(
                  professional: widget.imgs!,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 500.0,
            child: Divider(
              thickness: 1.0,
              color: Color(0xDEBAB7B7),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: FlutterFlowVideoPlayer(
              path: widget.video != ''
                  ? widget.video
                  : 'https://assets.mixkit.co/videos/51585/51585-720.mp4',
              videoType: VideoType.network,
              width: 400.0,
              height: 250.0,
              aspectRatio: 1.7,
              autoPlay: false,
              looping: false,
              showControls: true,
              allowFullScreen: true,
              allowPlaybackSpeedMenu: false,
              lazyLoad: false,
            ),
          ),
          const SizedBox(
            width: 500.0,
            child: Divider(
              thickness: 1.0,
              color: Color(0xDEBAB7B7),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, -1.0),
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(40.0, 8.0, 0.0, 8.0),
                child: Text(
                  'Availability',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
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
            alignment: const AlignmentDirectional(-1.0, -1.0),
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(40.0, 8.0, 0.0, 8.0),
                child: Text(
                  'Services Provided',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-0.03, -0.86),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: const RoundedRectangleBorder(
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
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    border: Border.all(
                      color: const Color(0xFFC55EBE),
                      width: 3.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -0.98),
                        child: CheckboxListTile(
                          key: const ValueKey('supportWorkers'),
                          value: _model.supportValue ??= widget.services
                                  ?.contains(FFAppConstants.servicesType
                                      .elementAtOrNull(0)) ==
                              true,
                          onChanged: _model.services
                              ? null
                              : (newValue) async {
                                  safeSetState(
                                      () => _model.supportValue = newValue!);
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
                          activeColor: const Color(0xFFBD39BA),
                          checkColor: _model.services
                              ? const Color(0xFFBD39BA)
                              : Colors.white,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -0.46),
                        child: CheckboxListTile(
                          key: const ValueKey('supportCoordinators'),
                          value: _model.coordinatorsValue ??= widget.services
                                  ?.contains(FFAppConstants.servicesType
                                      .elementAtOrNull(1)) ==
                              true,
                          onChanged: _model.services
                              ? null
                              : (newValue) async {
                                  safeSetState(() =>
                                      _model.coordinatorsValue = newValue!);
                                },
                          title: Text(
                            'Support Coordinators',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          activeColor: const Color(0xFFBD39BA),
                          checkColor: _model.services
                              ? const Color(0xFFBD39BA)
                              : Colors.white,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -0.98),
                        child: CheckboxListTile(
                          key: const ValueKey('recoveryCoaches'),
                          value: _model.recoveryValue ??= widget.services
                                  ?.contains(FFAppConstants.servicesType
                                      .elementAtOrNull(4)) ==
                              true,
                          onChanged: _model.services
                              ? null
                              : (newValue) async {
                                  safeSetState(
                                      () => _model.recoveryValue = newValue!);
                                },
                          title: Text(
                            'Recovery Coaches',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          activeColor: const Color(0xFFBD39BA),
                          checkColor: _model.services
                              ? const Color(0xFFBD39BA)
                              : Colors.white,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.13),
                        child: CheckboxListTile(
                          key: const ValueKey('therapeuticSupports'),
                          value: _model.therapeuticValue ??= widget.services
                                  ?.contains(FFAppConstants.servicesType
                                      .elementAtOrNull(2)) ==
                              true,
                          onChanged: _model.services
                              ? null
                              : (newValue) async {
                                  safeSetState(() =>
                                      _model.therapeuticValue = newValue!);
                                },
                          title: Text(
                            'Therapeutic Supports',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          activeColor: const Color(0xFFBD39BA),
                          checkColor: _model.services
                              ? const Color(0xFFBD39BA)
                              : Colors.white,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.77),
                        child: CheckboxListTile(
                          key: const ValueKey('homeMaintenance'),
                          value: _model.homeValue ??= widget.services
                                  ?.contains(FFAppConstants.servicesType
                                      .elementAtOrNull(3)) ==
                              true,
                          onChanged: _model.services
                              ? null
                              : (newValue) async {
                                  safeSetState(
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
                          activeColor: const Color(0xFFBD39BA),
                          checkColor: _model.services
                              ? const Color(0xFFBD39BA)
                              : Colors.white,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-1.0, -1.0),
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(40.0, 8.0, 0.0, 8.0),
                child: Text(
                  'Provider details',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Montserrat',
                        color: const Color(0xFFC14BBC),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
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
                      color: const Color(0xFFC55EBE),
                      width: 3.0,
                    ),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 270.0,
                            height: 50.0,
                            decoration: const BoxDecoration(),
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
                                        const Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Icon(
                                            Icons.business_center_outlined,
                                            color: Color(0xFF0E70DF),
                                            size: 22.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'Experience',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            widget.parameter2!,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(const SizedBox(width: 4.0)),
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
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 270.0,
                            height: 50.0,
                            decoration: const BoxDecoration(),
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 3.0),
                                        child: Icon(
                                          Icons.edit_document,
                                          color: Color(0xFF0E70DF),
                                          size: 22.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Qualified And Certified \nPersonnel',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 12.0)),
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
                        if (widget.company != 'default230')
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 270.0,
                              height: 50.0,
                              decoration: const BoxDecoration(),
                              child: Stack(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
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
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          widget.company,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 12.0)),
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
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 300.0,
                              height: 50.0,
                              decoration: const BoxDecoration(),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        const Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 3.0),
                                            child: Icon(
                                              Icons.check_circle,
                                              color: Color(0xFFE069BF),
                                              size: 22.0,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'NDIS Registration',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ],
                              ),
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
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  25.0, 8.0, 0.0, 10.0),
                              child: Container(
                                width: 300.0,
                                height: 50.0,
                                decoration: const BoxDecoration(),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 3.0),
                                              child: Icon(
                                                Icons.check_circle,
                                                color: Color(0xFFE069BF),
                                                size: 22.0,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  'ABN Registration',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    widget.abn,
                                                    '53346346',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ].addToStart(const SizedBox(height: 8.0)),
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
