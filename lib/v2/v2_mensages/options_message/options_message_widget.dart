import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'options_message_model.dart';
export 'options_message_model.dart';

class OptionsMessageWidget extends StatefulWidget {
  const OptionsMessageWidget({
    super.key,
    required this.userRef,
  });

  final UsersRecord? userRef;

  @override
  State<OptionsMessageWidget> createState() => _OptionsMessageWidgetState();
}

class _OptionsMessageWidgetState extends State<OptionsMessageWidget> {
  late OptionsMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionsMessageModel());
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
        width: MediaQuery.sizeOf(context).width * 0.55,
        height: 137.0,
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
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await currentUserReference!.update({
                  ...mapToFirestore(
                    {
                      'blockList':
                          FieldValue.arrayUnion([widget!.userRef?.reference]),
                      'blockUser':
                          FieldValue.arrayUnion([widget!.userRef?.reference]),
                    },
                  ),
                });

                await widget!.userRef!.reference.update({
                  ...mapToFirestore(
                    {
                      'blockList':
                          FieldValue.arrayUnion([currentUserReference]),
                    },
                  ),
                });

                context.goNamed('chat_2_main');
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Block User',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF0F0E0F),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ].addToStart(SizedBox(width: 16.0)),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFFBDBDBD),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'profile_info',
                  queryParameters: {
                    'professional': serializeParam(
                      widget!.userRef?.reference,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'View Profile',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF0F0E0F),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ].addToStart(SizedBox(width: 16.0)),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFFBDBDBD),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'report',
                  queryParameters: {
                    'user1': serializeParam(
                      currentUserEmail,
                      ParamType.String,
                    ),
                    'user2': serializeParam(
                      widget!.userRef?.email,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Report User',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ].addToStart(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
