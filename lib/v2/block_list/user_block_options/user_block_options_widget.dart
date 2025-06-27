import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/block_list/user_unlock_confirm/user_unlock_confirm_widget.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'user_block_options_model.dart';
export 'user_block_options_model.dart';

class UserBlockOptionsWidget extends StatefulWidget {
  const UserBlockOptionsWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<UserBlockOptionsWidget> createState() => _UserBlockOptionsWidgetState();
}

class _UserBlockOptionsWidgetState extends State<UserBlockOptionsWidget> {
  late UserBlockOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserBlockOptionsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, -1.0),
      child: Container(
        width: 178.0,
        height: 130.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FFButtonWidget(
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: UserUnlockConfirmWidget(
                        userRef: widget.userRef!,
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              text: 'Unlock user',
              options: FFButtonOptions(
                width: 150.0,
                height: 45.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0x004B39EF),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFFBDBDBD),
            ),
            FFButtonWidget(
              onPressed: () async {
                context.pushNamed(
                  ProfileInfoWidget.routeName,
                  queryParameters: {
                    'professional': serializeParam(
                      widget.userRef,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              },
              text: 'View Profile',
              options: FFButtonOptions(
                width: 150.0,
                height: 45.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0x004B39EF),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
