import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'navbar_user_model.dart';
export 'navbar_user_model.dart';

class NavbarUserWidget extends StatefulWidget {
  const NavbarUserWidget({super.key});

  @override
  State<NavbarUserWidget> createState() => _NavbarUserWidgetState();
}

class _NavbarUserWidgetState extends State<NavbarUserWidget> {
  late NavbarUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarUserModel());
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
      child: Container(
        width: double.infinity,
        height: 67.0,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if ((currentUserDocument?.rol == Roles.user) ||
                (currentUserDocument?.rol == null))
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlutterFlowIconButton(
                            key: ValueKey('home'),
                            borderColor: Colors.transparent,
                            buttonSize: 52.0,
                            icon: FaIcon(
                              FontAwesomeIcons.houseUser,
                              color: Colors.white,
                              size: 33.0,
                            ),
                            onPressed: () async {
                              if (loggedIn) {
                                context.pushNamed(Tinderv2C1Widget.routeName);
                              } else {
                                context.pushNamed(LoginWidget.routeName);
                              }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              1.0, 0.0, 1.0, 0.0),
                          child: Text(
                            'Home',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
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
              ),
            if (currentUserDocument?.business == null)
              AuthUserStreamWidget(
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowIconButton(
                          key: ValueKey('favorite'),
                          borderColor: Colors.transparent,
                          buttonSize: 50.0,
                          icon: Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.white,
                            size: 34.0,
                          ),
                          onPressed: () async {
                            if (loggedIn) {
                              if (currentUserDocument?.rol == Roles.user) {
                                context.pushNamed(FavV3CopyWidget.routeName);
                              } else {
                                if (currentUserDocument?.plan == Plan.standar) {
                                  context.pushNamed(
                                      PeoplewhoputyouinfavoritesWidget
                                          .routeName);
                                } else {
                                  if (currentUserDocument?.plan == Plan.basic) {
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.33, 0.64),
                      child: Text(
                        'Favorite',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
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
            if (currentUserDocument?.business == null)
              AuthUserStreamWidget(
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Stack(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                key: ValueKey('message'),
                                borderColor: Colors.transparent,
                                buttonSize: 50.0,
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
                                        isNull: (currentUserReference) == null,
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
                                    alignment: AlignmentDirectional(0.0, -1.0),
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
                                              fontFamily: 'Readex Pro',
                                              color: Color(0xFFF4F4F4),
                                              letterSpacing: 0.0,
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.3, 0.64),
                      child: Text(
                        'Message',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
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
            if (currentUserDocument?.business == null)
              AuthUserStreamWidget(
                builder: (context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowIconButton(
                          key: ValueKey('maps'),
                          borderColor: Colors.transparent,
                          borderRadius: 34.0,
                          buttonSize: 50.0,
                          icon: FaIcon(
                            FontAwesomeIcons.mapMarkedAlt,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            if (loggedIn) {
                              context.pushNamed(HomeSearchWidget.routeName);
                            } else {
                              context.pushNamed(LoginWidget.routeName);
                            }
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.3, 0.64),
                      child: Text(
                        'Maps',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowIconButton(
                      key: ValueKey('profile'),
                      borderColor: Colors.transparent,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 34.0,
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
                Align(
                  alignment: AlignmentDirectional(0.78, 0.59),
                  child: Text(
                    'Profile',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
