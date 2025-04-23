import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chat_groupwbubbles/chat_thread_component_copy/chat_thread_component_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/v2_mensages/options_message/options_message_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat2_details_copy_model.dart';
export 'chat2_details_copy_model.dart';

class Chat2DetailsCopyWidget extends StatefulWidget {
  const Chat2DetailsCopyWidget({
    super.key,
    required this.chatRef,
    this.chatRefTotal,
    this.professional,
  });

  final ChatsRecord? chatRef;
  final DocumentReference? chatRefTotal;
  final DocumentReference? professional;

  static String routeName = 'chat_2_DetailsCopy';
  static String routePath = 'chat2DetailsCopy';

  @override
  State<Chat2DetailsCopyWidget> createState() => _Chat2DetailsCopyWidgetState();
}

class _Chat2DetailsCopyWidgetState extends State<Chat2DetailsCopyWidget> {
  late Chat2DetailsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2DetailsCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await widget.chatRef!.reference.update({
            ...mapToFirestore(
              {
                'last_message_seen_by':
                    FieldValue.arrayUnion([currentUserReference]),
              },
            ),
          });
        }(),
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.chatRef!.users
          .where((e) => e != currentUserReference)
          .toList()
          .lastOrNull!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFC047BB),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final chat2DetailsCopyUsersRecord = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFC047BB),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 110.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFC047BB), Color(0xFFCB77C1)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(-1.0, 0.0),
                      end: AlignmentDirectional(1.0, 0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.05, 0.2),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 56.0,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 38.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.42),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 62.0,
                                  height: 62.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        Duration(milliseconds: 500),
                                    imageUrl: valueOrDefault<String>(
                                      chat2DetailsCopyUsersRecord.photoUrl,
                                      'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                functions.upperCaseFirstLetter(
                                    valueOrDefault<String>(
                                  chat2DetailsCopyUsersRecord.firtsName,
                                  'math',
                                )),
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
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.02, 0.29),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 64.25,
                          icon: Icon(
                            Icons.more_vert,
                            color: Color(0xFFF9FCFF),
                            size: 40.25,
                          ),
                          onPressed: () async {
                            _model.showMenu = !_model.showMenu;
                            safeSetState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      FFAppState().isMENUvisible = false;
                      safeSetState(() {});
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: wrapWithModel(
                            model: _model.chatThreadComponentCopyModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ChatThreadComponentCopyWidget(
                              chatRef: widget.chatRef,
                              profesiona: chat2DetailsCopyUsersRecord,
                              professional: widget.professional,
                              chatRefTotal: widget.chatRefTotal,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: MediaQuery.sizeOf(context).width * 0.4,
                              height: currentUserDocument?.rol == Roles.user
                                  ? 137.0
                                  : 88.0,
                              constraints: BoxConstraints(
                                minHeight: 100.0,
                                maxHeight: 140.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: _model.showMenu,
                                child: wrapWithModel(
                                  model: _model.optionsMessageModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: OptionsMessageWidget(
                                    userRef: chat2DetailsCopyUsersRecord,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
