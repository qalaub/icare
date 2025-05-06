import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar_empleado_model.dart';
export 'navbar_empleado_model.dart';

class NavbarEmpleadoWidget extends StatefulWidget {
  const NavbarEmpleadoWidget({super.key});

  @override
  State<NavbarEmpleadoWidget> createState() => _NavbarEmpleadoWidgetState();
}

class _NavbarEmpleadoWidgetState extends State<NavbarEmpleadoWidget> {
  late NavbarEmpleadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarEmpleadoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord.where(
            'favorites',
            arrayContains: currentUserReference,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<UsersRecord> containerUsersRecordList =
              snapshot.data!.where((u) => u.uid != currentUserUid).toList();

          return Container(
            width: double.infinity,
            height: 67.0,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                key: ValueKey('likes'),
                                borderColor: Colors.transparent,
                                borderRadius: 34.0,
                                buttonSize: 48.0,
                                icon: Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                  size: 33.0,
                                ),
                                onPressed: () async {
                                  if (loggedIn) {
                                    if (currentUserDocument?.rol ==
                                        Roles.user) {
                                      context
                                          .pushNamed(FavV3CopyWidget.routeName);
                                    } else {
                                      if ((currentUserDocument?.plan ==
                                              Plan.standar) ||
                                          (currentUserDocument?.plan ==
                                              Plan.premiun)) {
                                        context.pushNamed(
                                            PeoplewhoputyouinfavoritesWidget
                                                .routeName);
                                      } else {
                                        if (currentUserDocument?.plan ==
                                            Plan.basic) {
                                          context.pushNamed(
                                              PeoplewhoputyouinfavoriteBasicWidget
                                                  .routeName);
                                        }
                                      }
                                    }
                                  } else {
                                    context.pushNamed(LoginWidget.routeName);
                                  }
                                },
                              ),
                            ),
                            if (containerUsersRecordList.length > 0)
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF0000),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        containerUsersRecordList.length
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFF4F4F4),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.33, 0.64),
                      child: Text(
                        'Likes',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Container(
                      height: 5.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
                if (currentUserDocument?.business == null)
                  AuthUserStreamWidget(
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  key: ValueKey('message'),
                                  borderColor: Colors.transparent,
                                  buttonSize: 48.0,
                                  icon: Icon(
                                    Icons.wechat_rounded,
                                    color: Colors.white,
                                    size: 34.0,
                                  ),
                                  onPressed: () async {
                                    if (loggedIn) {
                                      context
                                          .pushNamed(Chat2MainWidget.routeName);
                                    } else {
                                      context.pushNamed(LoginWidget.routeName);
                                    }
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: StreamBuilder<List<ChatsRecord>>(
                                  stream: queryChatsRecord(
                                    queryBuilder: (chatsRecord) => chatsRecord
                                        .where(
                                          'users',
                                          arrayContains: currentUserReference,
                                          isNull:
                                              (currentUserReference) == null,
                                        )
                                        .orderBy('last_message_time',
                                            descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ChatsRecord> containerChatsRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF0000),
                                        shape: BoxShape.circle,
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            containerChatsRecordList
                                                .where((e) =>
                                                    e.lastMessageSeenBy.contains(
                                                        currentUserReference) ==
                                                    false)
                                                .toList()
                                                .length
                                                .toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFFF4F4F4),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.3, 0.64),
                          child: Text(
                            'Message',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Container(
                          height: 5.0,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: FlutterFlowIconButton(
                            key: ValueKey('profile'),
                            borderColor: Colors.transparent,
                            buttonSize: 48.0,
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 37.0,
                            ),
                            onPressed: () async {
                              if (loggedIn) {
                                context.pushNamed(UserprofileWidget.routeName);
                              } else {
                                context.pushNamed(LoginWidget.routeName);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.78, 0.59),
                      child: Text(
                        'Profile',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Container(
                      height: 5.0,
                      decoration: BoxDecoration(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
