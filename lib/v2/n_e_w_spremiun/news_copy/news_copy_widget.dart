import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/new_notifcations_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'news_copy_model.dart';
export 'news_copy_model.dart';

class NewsCopyWidget extends StatefulWidget {
  const NewsCopyWidget({super.key});

  static String routeName = 'newsCopy';
  static String routePath = 'newsCopy';

  @override
  State<NewsCopyWidget> createState() => _NewsCopyWidgetState();
}

class _NewsCopyWidgetState extends State<NewsCopyWidget> {
  late NewsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsCopyModel());
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
        backgroundColor: Color(0xFFE3DEDE),
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
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: Text(
              'Notification',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                    fontSize: 23.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
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
              StreamBuilder<List<NewsbusinessRecord>>(
                stream: queryNewsbusinessRecord(
                  queryBuilder: (newsbusinessRecord) => newsbusinessRecord
                      .where(
                        'business',
                        isEqualTo: currentUserReference,
                      )
                      .where(
                        'isView',
                        isEqualTo: false,
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
                  List<NewsbusinessRecord> containerNewsbusinessRecordList =
                      snapshot.data!;

                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.84,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'New ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 20.0,
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
                          Builder(
                            builder: (context) {
                              final conditionalBuilderVar =
                                  containerNewsbusinessRecordList.toList();

                              return ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  7.0,
                                  0,
                                  0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: conditionalBuilderVar.length,
                                itemBuilder:
                                    (context, conditionalBuilderVarIndex) {
                                  final conditionalBuilderVarItem =
                                      conditionalBuilderVar[
                                          conditionalBuilderVarIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await conditionalBuilderVarItem.reference
                                          .update(createNewsbusinessRecordData(
                                        isView: true,
                                      ));
                                    },
                                    child: NewNotifcationsWidget(
                                      key: Key(
                                          'Key2p7_${conditionalBuilderVarIndex}_of_${conditionalBuilderVar.length}'),
                                      participant:
                                          conditionalBuilderVarItem.user!,
                                      professional: conditionalBuilderVarItem
                                          .professional!,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'Previous',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 20.0,
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
                          StreamBuilder<List<NewsbusinessRecord>>(
                            stream: queryNewsbusinessRecord(
                              queryBuilder: (newsbusinessRecord) =>
                                  newsbusinessRecord
                                      .where(
                                        'business',
                                        isEqualTo: currentUserReference,
                                      )
                                      .where(
                                        'isView',
                                        isEqualTo: true,
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
                              List<NewsbusinessRecord>
                                  listViewNewsbusinessRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  7.0,
                                  0,
                                  0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewNewsbusinessRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewNewsbusinessRecord =
                                      listViewNewsbusinessRecordList[
                                          listViewIndex];
                                  return NewNotifcationsWidget(
                                    key: Key(
                                        'Keyab1_${listViewIndex}_of_${listViewNewsbusinessRecordList.length}'),
                                    participant:
                                        listViewNewsbusinessRecord.user!,
                                    professional: listViewNewsbusinessRecord
                                        .professional!,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.01),
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
      ),
    );
  }
}
