import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/listofcollaborators_p_e_r_f_i_l_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'listofcollaborators_model.dart';
export 'listofcollaborators_model.dart';

class ListofcollaboratorsWidget extends StatefulWidget {
  const ListofcollaboratorsWidget({super.key});

  @override
  State<ListofcollaboratorsWidget> createState() =>
      _ListofcollaboratorsWidgetState();
}

class _ListofcollaboratorsWidgetState extends State<ListofcollaboratorsWidget> {
  late ListofcollaboratorsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListofcollaboratorsModel());
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, -1),
                          child: Container(
                            width: 399,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/Rectangle_7.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Text(
                                    'list of collaborators',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 20,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.88, -0.69),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault<String>(
                                functions.concatStrings(
                                    (currentUserDocument?.professionals
                                                .toList() ??
                                            [])
                                        .length
                                        .toString(),
                                    '10',
                                    '/'),
                                '3/10',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFFDB1FB5),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0.2),
                          child: Container(
                            width: 300,
                            height: 480,
                            decoration: const BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => Builder(
                                builder: (context) {
                                  final colaborators = (currentUserDocument
                                              ?.professionals
                                              .toList() ??
                                          [])
                                      .toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: colaborators.length,
                                    itemBuilder: (context, colaboratorsIndex) {
                                      final colaboratorsItem =
                                          colaborators[colaboratorsIndex];
                                      return Align(
                                        alignment: const AlignmentDirectional(0, 0),
                                        child: ListofcollaboratorsPERFILWidget(
                                          key: Key(
                                              'Keymd2_${colaboratorsIndex}_of_${colaborators.length}'),
                                          professional: colaboratorsItem,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 1.01),
                          child: Container(
                            height: 73,
                            decoration: const BoxDecoration(
                              color: Color(0xD5B928B8),
                            ),
                            child: Builder(
                              builder: (context) {
                                if (currentUserDocument?.rol !=
                                    Roles.business) {
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
