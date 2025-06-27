import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v3correciones/user_fav0rites/v3fv0ritesv3/v3fv0ritesv3_widget.dart';
import 'package:lock_orientation_library_opafp4/custom_code/actions/index.dart'
    as lock_orientation_library_opafp4_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fav_v3_copy_model.dart';
export 'fav_v3_copy_model.dart';

class FavV3CopyWidget extends StatefulWidget {
  const FavV3CopyWidget({super.key});

  static String routeName = 'favV3Copy';
  static String routePath = 'favV3Copy';

  @override
  State<FavV3CopyWidget> createState() => _FavV3CopyWidgetState();
}

class _FavV3CopyWidgetState extends State<FavV3CopyWidget> {
  late FavV3CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavV3CopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await lock_orientation_library_opafp4_actions.lockOrientation();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFBD39BA),
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
            context.pop();
          },
        ),
        title: Text(
          'Favorites',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
                color: Color(0xFFEFECF3),
                fontSize: 24.0,
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
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/inicio_1-3-4.png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.802,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).height * 0.76,
                        ),
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StreamBuilder<List<FavoritesRecord>>(
                                stream: queryFavoritesRecord(
                                  queryBuilder: (favoritesRecord) =>
                                      favoritesRecord
                                          .where(
                                            'userID',
                                            isEqualTo: currentUserReference,
                                          )
                                          .orderBy('timestamp',
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
                                  List<FavoritesRecord>
                                      listViewFavoritesRecordList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      16.0,
                                      0,
                                      0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewFavoritesRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 16.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewFavoritesRecord =
                                          listViewFavoritesRecordList[
                                              listViewIndex];
                                      return V3fv0ritesv3Widget(
                                        key: Key(
                                            'Keympk_${listViewIndex}_of_${listViewFavoritesRecordList.length}'),
                                        profesionalId: listViewFavoritesRecord
                                            .professionalRef!,
                                        isCollaborator: false,
                                        isReview: true,
                                        isMap: false,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          height: 73.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFBD39BA),
                          ),
                          child: Builder(
                            builder: (context) {
                              if (currentUserDocument?.rol != Roles.business) {
                                return wrapWithModel(
                                  model: _model.navbarModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NavbarWidget(),
                                );
                              } else {
                                return wrapWithModel(
                                  model: _model.navbarPremiunModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NavbarPremiunWidget(),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
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
