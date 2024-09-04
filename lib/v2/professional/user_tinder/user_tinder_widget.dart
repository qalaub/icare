import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.6,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.96,
          maxHeight: MediaQuery.sizeOf(context).height * 0.6,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: const AlignmentDirectional(0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                child: CachedNetworkImage(
                  fadeInDuration: const Duration(milliseconds: 500),
                  fadeOutDuration: const Duration(milliseconds: 500),
                  imageUrl: valueOrDefault<String>(
                    widget.professional?.photoUrl,
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
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.78,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
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
                                widget.professional?.firtsName,
                                'sandra',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 26,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                          ]
                              .divide(const SizedBox(width: 16))
                              .addToStart(const SizedBox(width: 11)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle_rounded,
                              color: Color(0xFF52FF00),
                              size: 12,
                            ),
                            Text(
                              'recent activity',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ]
                              .divide(const SizedBox(width: 8))
                              .addToStart(const SizedBox(width: 10)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.28,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.045,
                                decoration: BoxDecoration(
                                  color: const Color(0xCCAC16A4),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: AutoSizeText(
                                    valueOrDefault<String>(
                                      widget.professional?.serviceType.first,
                                      'Psychology',
                                    ).maybeHandleOverflow(
                                      maxChars: 15,
                                      replacement: '…',
                                    ),
                                    textAlign: TextAlign.center,
                                    minFontSize: 10,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: const Color(0xFFFBFBFB),
                                          fontSize: 11.5,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.42,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.045,
                                decoration: BoxDecoration(
                                  color: const Color(0xCCAC16A4),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions.concatStrings(
                                          widget.professional?.years
                                              .toString(),
                                          'years of experience',
                                          ' '),
                                      'years of experience',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: const Color(0xFFFBFBFB),
                                          fontSize: 12.5,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ]
                              .divide(const SizedBox(width: 6))
                              .addToStart(const SizedBox(width: 10)),
                        ),
                      ]
                          .divide(const SizedBox(height: 10))
                          .addToStart(const SizedBox(height: 10))
                          .addToEnd(const SizedBox(height: 10)),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
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
