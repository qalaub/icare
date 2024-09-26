import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/v2/professional/imganes/imganes_widget.dart';
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
  }) : video = video ??
            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4';

  final String? parameter1;
  final String? parameter2;
  final String video;
  final List<String>? services;
  final List<String>? imgs;

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
                      alignment: const AlignmentDirectional(-0.01, -0.69),
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFFEFE),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
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
            width: 360.0,
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
            width: 360.0,
            child: Divider(
              thickness: 1.0,
              color: Color(0xDEBAB7B7),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
            width: 360.0,
            child: Divider(
              thickness: 1.0,
              color: Color(0xDEBAB7B7),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.09, 0.52),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
              child: Container(
                width: double.infinity,
                height: 330.0,
                decoration: const BoxDecoration(),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.8, 0.0),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Align(
                        alignment: const AlignmentDirectional(-0.8, 0.0),
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
                                    alignment: AlignmentDirectional(-1.0, 0.0),
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
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
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
                      Align(
                        alignment: const AlignmentDirectional(-0.8, 0.0),
                        child: Container(
                          width: 300.0,
                          height: 50.0,
                          decoration: const BoxDecoration(),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 3.0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Color(0xFFE069BF),
                                        size: 22.0,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Text(
                                      'Official ID document, name\n provide your ID correctly',
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
                      Align(
                        alignment: const AlignmentDirectional(-0.8, 0.0),
                        child: Container(
                          width: 300.0,
                          decoration: const BoxDecoration(),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 3.0),
                                  child: Icon(
                                    Icons.work_history_sharp,
                                    color: Color(0xFF0E70DF),
                                    size: 22.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 266.0,
                                decoration: const BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final servicesList =
                                        widget.services!.toList();

                                    return ListView.separated(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        2.0,
                                        0,
                                        0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: servicesList.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 4.0),
                                      itemBuilder:
                                          (context, servicesListIndex) {
                                        final servicesListItem =
                                            servicesList[servicesListIndex];
                                        return Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            servicesListItem,
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
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 16.0))
                        .addToEnd(const SizedBox(height: 32.0)),
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
