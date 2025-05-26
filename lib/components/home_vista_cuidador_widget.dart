import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_vista_cuidador_model.dart';
export 'home_vista_cuidador_model.dart';

class HomeVistaCuidadorWidget extends StatefulWidget {
  const HomeVistaCuidadorWidget({
    super.key,
    String? participants,
  }) : this.participants = participants ?? '35 participants';

  final String participants;

  @override
  State<HomeVistaCuidadorWidget> createState() =>
      _HomeVistaCuidadorWidgetState();
}

class _HomeVistaCuidadorWidgetState extends State<HomeVistaCuidadorWidget> {
  late HomeVistaCuidadorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeVistaCuidadorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 0.75,
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Material(
              color: Colors.transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: Image.asset(
                      'assets/images/Group_97_(3).png',
                    ).image,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -0.3),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 10.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 9.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      'There are  ',
                                      textAlign: TextAlign.center,
                                      minFontSize: 19.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 1.0,
                                          ),
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(0.0, -2.0),
                                            blurRadius: 0.0,
                                          )
                                        ],
                                      ),
                                    ),
                                    AutoSizeText(
                                      widget.participants,
                                      minFontSize: 19.0,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 1.0,
                                          ),
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(0.0, -2.0),
                                            blurRadius: 0.0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    'NDIS Participants \nnear your ',
                                    textAlign: TextAlign.center,
                                    minFontSize: 19.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 19.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black,
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 1.0,
                                        ),
                                        Shadow(
                                          color: Colors.black,
                                          offset: Offset(0.0, -2.0),
                                          blurRadius: 0.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
