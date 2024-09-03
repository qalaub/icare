import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/favoritesv2/v2_favoritos_componente/v2_favoritos_componente_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'peoplewhoputyouinfavorite_basic_model.dart';
export 'peoplewhoputyouinfavorite_basic_model.dart';

class PeoplewhoputyouinfavoriteBasicWidget extends StatefulWidget {
  const PeoplewhoputyouinfavoriteBasicWidget({super.key});

  @override
  State<PeoplewhoputyouinfavoriteBasicWidget> createState() =>
      _PeoplewhoputyouinfavoriteBasicWidgetState();
}

class _PeoplewhoputyouinfavoriteBasicWidgetState
    extends State<PeoplewhoputyouinfavoriteBasicWidget> {
  late PeoplewhoputyouinfavoriteBasicModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PeoplewhoputyouinfavoriteBasicModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
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
            'Likes',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Montserrat',
                  color: Color(0xFFEFECF3),
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRect(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 4.0,
                                sigmaY: 4.0,
                              ),
                              child: Container(
                                width: 390.0,
                                height: 580.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where(
                                      'favorites',
                                      arrayContains: currentUserReference,
                                      isNull: (currentUserReference) == null,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRecord> listViewUsersRecordList =
                                        snapshot.data!
                                            .where(
                                                (u) => u.uid != currentUserUid)
                                            .toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        26.0,
                                        0,
                                        0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewUsersRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewUsersRecord =
                                            listViewUsersRecordList[
                                                listViewIndex];
                                        return V2FavoritosComponenteWidget(
                                          key: Key(
                                              'Keyj0b_${listViewIndex}_of_${listViewUsersRecordList.length}'),
                                          professionalRef:
                                              listViewUsersRecord.reference,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0x7FFFFFFF),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 250.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'STANDAR',
                                  queryParameters: {
                                    'userRef': serializeParam(
                                      currentUserReference,
                                      ParamType.DocumentReference,
                                    ),
                                    'currentPlan': serializeParam(
                                      currentUserDocument?.plan,
                                      ParamType.Enum,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Group_42_(1).png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.01),
                child: Container(
                  height: 73.0,
                  decoration: BoxDecoration(
                    color: Color(0xB3B928B8),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (currentUserDocument?.rol != Roles.business) {
                        return wrapWithModel(
                          model: _model.navbarModel,
                          updateCallback: () => setState(() {}),
                          child: NavbarWidget(),
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.navbarPremiunModel,
                          updateCallback: () => setState(() {}),
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
      ),
    );
  }
}
