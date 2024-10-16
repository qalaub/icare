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
import 'news_model.dart';
export 'news_model.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late NewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsModel());
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
        backgroundColor: const Color(0xFFE3DEDE),
        appBar: AppBar(
          backgroundColor: const Color(0xFFBD39BA),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: Text(
              'Notification',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Montserrat',
                    fontSize: 23.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: const [],
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
                  List<NewsbusinessRecord>
                      conditionalBuilderNewsbusinessRecordList = snapshot.data!;

                  return Builder(
                    builder: (context) {
                      if (conditionalBuilderNewsbusinessRecordList.isNotEmpty) {
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.84,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        'New ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final conditionalBuilderVar =
                                        conditionalBuilderNewsbusinessRecordList
                                            .toList();

                                    return ListView.separated(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        7.0,
                                        0,
                                        0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: conditionalBuilderVar.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 1.0),
                                      itemBuilder: (context,
                                          conditionalBuilderVarIndex) {
                                        final conditionalBuilderVarItem =
                                            conditionalBuilderVar[
                                                conditionalBuilderVarIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await conditionalBuilderVarItem
                                                .reference
                                                .update(
                                                    createNewsbusinessRecordData(
                                              isView: true,
                                            ));
                                          },
                                          child: NewNotifcationsWidget(
                                            key: Key(
                                                'Keybx2_${conditionalBuilderVarIndex}_of_${conditionalBuilderVar.length}'),
                                            participant:
                                                conditionalBuilderVarItem.user!,
                                            professional:
                                                conditionalBuilderVarItem
                                                    .professional!,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        'Previous',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<NewsbusinessRecord>
                                        listViewNewsbusinessRecordList =
                                        snapshot.data!;

                                    return ListView.builder(
                                      padding: const EdgeInsets.fromLTRB(
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
                                              'Keynx3_${listViewIndex}_of_${listViewNewsbusinessRecordList.length}'),
                                          participant:
                                              listViewNewsbusinessRecord.user!,
                                          professional:
                                              listViewNewsbusinessRecord
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
                      } else {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/noNotification.png',
                            width: double.infinity,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.01),
                child: Container(
                  height: 73.0,
                  decoration: const BoxDecoration(
                    color: Color(0xB3B928B8),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (currentUserDocument?.rol != Roles.business) {
                        return wrapWithModel(
                          model: _model.navbarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarWidget(),
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.navbarPremiunModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarPremiunWidget(),
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
