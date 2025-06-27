import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v3correciones/user_fav0rites/v3fv0ritesv3/v3fv0ritesv3_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:lock_orientation_library_opafp4/custom_code/actions/index.dart'
    as lock_orientation_library_opafp4_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'listofcollaborators_model.dart';
export 'listofcollaborators_model.dart';

class ListofcollaboratorsWidget extends StatefulWidget {
  const ListofcollaboratorsWidget({super.key});

  static String routeName = 'listofcollaborators';
  static String routePath = 'listofcollaborators';

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFBD39BA),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/inicio_1-3.png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 55.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFBD39BA),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'List Of Helpers',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
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
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.88, -0.8),
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
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          if ((currentUserDocument?.professionals.toList() ??
                                      [])
                                  .length >
                              0)
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.3),
                              child: AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.86,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.72,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final colaborators = (currentUserDocument
                                                  ?.professionals
                                                  .toList() ??
                                              [])
                                          .toList();

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: colaborators.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 14.0),
                                        itemBuilder:
                                            (context, colaboratorsIndex) {
                                          final colaboratorsItem =
                                              colaborators[colaboratorsIndex];
                                          return V3fv0ritesv3Widget(
                                            key: Key(
                                                'Key81z_${colaboratorsIndex}_of_${colaborators.length}'),
                                            profesionalId: colaboratorsItem,
                                            isCollaborator: true,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
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
                                  if (currentUserDocument?.rol !=
                                      Roles.business) {
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
