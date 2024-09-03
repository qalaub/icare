import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_tinder_model.dart';
export 'user_tinder_model.dart';

class UserTinderWidget extends StatefulWidget {
  const UserTinderWidget({
    super.key,
    required this.professional,
  });

  final UsersRecord? professional;

  @override
  State<UserTinderWidget> createState() => _UserTinderWidgetState();
}

class _UserTinderWidgetState extends State<UserTinderWidget> {
  late UserTinderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserTinderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 0.6,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.96,
          maxHeight: MediaQuery.sizeOf(context).height * 0.6,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0),
                ),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 500),
                  fadeOutDuration: Duration(milliseconds: 500),
                  imageUrl: valueOrDefault<String>(
                    widget!.professional?.photoUrl,
                    'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                  ),
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.78,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget!.professional?.firtsName,
                                'sandra',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ]
                              .divide(SizedBox(width: 16.0))
                              .addToStart(SizedBox(width: 11.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle_rounded,
                              color: Color(0xFF52FF00),
                              size: 12.0,
                            ),
                            Text(
                              'recent activity',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ]
                              .divide(SizedBox(width: 8.0))
                              .addToStart(SizedBox(width: 10.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.28,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.045,
                                decoration: BoxDecoration(
                                  color: Color(0xCCAC16A4),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AutoSizeText(
                                    valueOrDefault<String>(
                                      widget!.professional?.serviceType?.first,
                                      'Psychology',
                                    ).maybeHandleOverflow(
                                      maxChars: 15,
                                      replacement: '…',
                                    ),
                                    textAlign: TextAlign.center,
                                    minFontSize: 10.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFBFBFB),
                                          fontSize: 11.5,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.42,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.045,
                                decoration: BoxDecoration(
                                  color: Color(0xCCAC16A4),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions.concatStrings(
                                          widget!.professional?.years
                                              ?.toString(),
                                          'years of experience',
                                          ' '),
                                      'years of experience',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFBFBFB),
                                          fontSize: 12.5,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(width: 6.0))
                              .addToStart(SizedBox(width: 10.0)),
                        ),
                      ]
                          .divide(SizedBox(height: 10.0))
                          .addToStart(SizedBox(height: 10.0))
                          .addToEnd(SizedBox(height: 10.0)),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/basicV2.png',
                    width: MediaQuery.sizeOf(context).width * 0.11,
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
