import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/block_list/user_block/user_block_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'block_list_model.dart';
export 'block_list_model.dart';

class BlockListWidget extends StatefulWidget {
  const BlockListWidget({super.key});

  static String routeName = 'BlockList';
  static String routePath = 'blockList';

  @override
  State<BlockListWidget> createState() => _BlockListWidgetState();
}

class _BlockListWidgetState extends State<BlockListWidget> {
  late BlockListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlockListModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFBD39BA),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed(UserprofileWidget.routeName);
            },
          ),
          title: Text(
            'Blocked list',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      if ((currentUserDocument?.blockUser.toList() ?? [])
                              .length >
                          0)
                        AuthUserStreamWidget(
                          builder: (context) =>
                              StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) =>
                                  usersRecord.whereIn(
                                      'uid',
                                      (currentUserDocument?.blockUser
                                                          .toList() ??
                                                      [])
                                                  .map((e) =>
                                                      valueOrDefault<String>(
                                                        e.id,
                                                        '#########',
                                                      ))
                                                  .toList() !=
                                              ''
                                          ? (currentUserDocument?.blockUser
                                                      .toList() ??
                                                  [])
                                              .map(
                                                  (e) => valueOrDefault<String>(
                                                        e.id,
                                                        '#########',
                                                      ))
                                              .toList()
                                          : null),
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
                                  snapshot.data!
                                      .where((u) => u.uid != currentUserUid)
                                      .toList();

                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final containerVar =
                                        containerUsersRecordList
                                            .where((e) =>
                                                (currentUserDocument?.blockUser
                                                            .toList() ??
                                                        [])
                                                    .contains(e.reference) ==
                                                true)
                                            .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: containerVar.length,
                                      itemBuilder:
                                          (context, containerVarIndex) {
                                        final containerVarItem =
                                            containerVar[containerVarIndex];
                                        return UserBlockWidget(
                                          key: Key(
                                              'Key0sa_${containerVarIndex}_of_${containerVar.length}'),
                                          background: Colors.white,
                                          username: containerVarItem.firtsName,
                                          service:
                                              containerVarItem.rol == Roles.user
                                                  ? ' '
                                                  : containerVarItem
                                                      .serviceType.firstOrNull,
                                          userRef: containerVarItem.reference,
                                          image: containerVarItem.photoUrl,
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                  if ((currentUserDocument?.blockUser.toList() ?? []).length ==
                      0)
                    Align(
                      alignment: AlignmentDirectional(0.0, -0.5),
                      child: AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: 315.0,
                          height: 297.0,
                          decoration: BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/pixelcut-export.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if ((currentUserDocument?.blockUser.toList() ?? []).length ==
                      0)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.15),
                      child: AuthUserStreamWidget(
                        builder: (context) => Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            'No block users',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFDB4B9C),
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
