import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'user_unlock_confirm_model.dart';
export 'user_unlock_confirm_model.dart';

class UserUnlockConfirmWidget extends StatefulWidget {
  const UserUnlockConfirmWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<UserUnlockConfirmWidget> createState() =>
      _UserUnlockConfirmWidgetState();
}

class _UserUnlockConfirmWidgetState extends State<UserUnlockConfirmWidget> {
  late UserUnlockConfirmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserUnlockConfirmModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Container(
        width: 320,
        height: 269,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(
                0,
                2,
              ),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(38),
            bottomRight: Radius.circular(38),
            topLeft: Radius.circular(38),
            topRight: Radius.circular(38),
          ),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Unlock user',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            color: const Color(0xFF0F0E0F),
                            fontSize: 20,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 0,
              color: Color(0x6FBDBDBD),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.7,
                decoration: const BoxDecoration(),
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                    child: Text(
                      'Surely you want to unblock USER, he will be able to send messages again and interact with you',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color(0x46BDBDBD),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await currentUserReference!.update({
                    ...mapToFirestore(
                      {
                        'blockUser': FieldValue.arrayRemove([widget.userRef]),
                        'blockList': FieldValue.arrayRemove([widget.userRef]),
                      },
                    ),
                  });

                  await widget.userRef!.update({
                    ...mapToFirestore(
                      {
                        'blockList':
                            FieldValue.arrayRemove([currentUserReference]),
                      },
                    ),
                  });
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: Text(
                          'Unlock',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    color: const Color(0xFFC14BBC),
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color(0x46BDBDBD),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cancel',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: const Color(0xFF0F0E0F),
                              fontSize: 16,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ].addToStart(const SizedBox(height: 16)),
        ),
      ),
    );
  }
}
