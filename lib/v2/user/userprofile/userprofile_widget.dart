import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/account_option/account_option_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'userprofile_model.dart';
export 'userprofile_model.dart';

class UserprofileWidget extends StatefulWidget {
  const UserprofileWidget({super.key});

  static String routeName = 'userprofile';
  static String routePath = 'userprofile';

  @override
  State<UserprofileWidget> createState() => _UserprofileWidgetState();
}

class _UserprofileWidgetState extends State<UserprofileWidget> {
  late UserprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserprofileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().imagesUserUpload = [];
      FFAppState().updateRegisterProviderFormStruct(
        (e) => e
          ..morning = (currentUserDocument?.morning.toList() ?? []).toList()
          ..noon = (currentUserDocument?.noon.toList() ?? []).toList()
          ..afternoon =
              (currentUserDocument?.afternoon.toList() ?? []).toList(),
      );
      FFAppState().update(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Color(0x31FB8CE2),
                          ),
                          child: Stack(
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://i.ibb.co/2qkDLKb/Frame-74.png',
                                    ),
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: Color(0x59F428EB),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                functions.upperCaseFirstLetter(
                                    currentUserDocument?.rol == Roles.business
                                        ? valueOrDefault(
                                            currentUserDocument?.comapny, '')
                                        : valueOrDefault(
                                            currentUserDocument?.firtsName,
                                            '')),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 28.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        if (currentUserPhoto == '')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 326.0,
                                height: 150.0,
                                decoration: BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                        SecuritySettingsWidget.routeName);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Group_41.png',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if ((currentUserDocument?.rol != Roles.user) &&
                            (currentUserDocument?.rol == Roles.profesional
                                ? (currentUserDocument?.business == null)
                                : true))
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 326.0,
                              height: 52.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (currentUserDocument?.plan ==
                                        Plan.basic) {
                                      context.pushNamed(
                                          MySubscriptionBasicWidget.routeName);
                                    } else if (currentUserDocument?.plan ==
                                        Plan.standar) {
                                      context.pushNamed(
                                          MySubscriptionStandardWidget
                                              .routeName);
                                    } else {
                                      context.pushNamed(
                                          MySubscriptionPremiumWidget
                                              .routeName);
                                    }
                                  },
                                  child: wrapWithModel(
                                    model: _model.accountOptionModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: AccountOptionWidget(
                                      key: ValueKey('subscription'),
                                      icon: Icon(
                                        key: ValueKey('subscription'),
                                        Icons.card_membership_outlined,
                                        size: 30.0,
                                      ),
                                      text: 'My subscription',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if ((currentUserDocument?.rol == Roles.profesional) &&
                            (currentUserDocument?.business == null) &&
                            (currentUserDocument?.plan != Plan.premiun))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 326.0,
                                height: 56.0,
                                decoration: BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      PremiumWidget.routeName,
                                      queryParameters: {
                                        'userRef': serializeParam(
                                          currentUserReference,
                                          ParamType.DocumentReference,
                                        ),
                                        'currentPlan': serializeParam(
                                          currentUserDocument?.plan,
                                          ParamType.Enum,
                                        ),
                                        'isUpdatePremiun': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Group_42.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Container(
                          width: 326.0,
                          height: 52.0,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.apiResult23d = await GetNamePlaceCall.call(
                                lat: functions.latLngToString(
                                    currentUserDocument!.suburb!),
                              );

                              if ((_model.apiResult23d?.succeeded ?? true)) {
                                context.pushNamed(
                                  VerperfilWidget.routeName,
                                  queryParameters: {
                                    'initialSurb': serializeParam(
                                      GetNamePlaceCall.street(
                                        (_model.apiResult23d?.jsonBody ?? ''),
                                      )?.firstOrNull?.toString(),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                context.pushNamed(VerperfilWidget.routeName);
                              }

                              safeSetState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.accountOptionModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: AccountOptionWidget(
                                key: ValueKey('profile'),
                                icon: Icon(
                                  key: ValueKey('profile'),
                                  Icons.location_history,
                                  size: 30.0,
                                ),
                                text: 'My profile',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 326.0,
                          height: 52.0,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.apiResult23d1 =
                                  await GetNamePlaceCall.call(
                                lat: functions.latLngToString(
                                    currentUserDocument!.suburb!),
                              );

                              if ((_model.apiResult23d1?.succeeded ?? true)) {
                                context.pushNamed(
                                  ProfileSettingsWidget.routeName,
                                  queryParameters: {
                                    'initialSur': serializeParam(
                                      GetNamePlaceCall.street(
                                        (_model.apiResult23d1?.jsonBody ?? ''),
                                      )?.firstOrNull?.toString(),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                context
                                    .pushNamed(ProfileSettingsWidget.routeName);
                              }

                              safeSetState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.accountOptionModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: AccountOptionWidget(
                                key: ValueKey('profile'),
                                icon: FaIcon(
                                  key: ValueKey('profile'),
                                  FontAwesomeIcons.userEdit,
                                  size: 21.0,
                                ),
                                text: 'Edit profile',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 326.0,
                          height: 52.0,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.apiResult23d2 =
                                  await GetNamePlaceCall.call(
                                lat: functions.latLngToString(
                                    currentUserDocument!.suburb!),
                              );

                              if ((_model.apiResult23d2?.succeeded ?? true)) {
                                context.pushNamed(
                                    SecuritySettingsWidget.routeName);
                              } else {
                                context.pushNamed(
                                    SecuritySettingsWidget.routeName);
                              }

                              safeSetState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.accountOptionModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: AccountOptionWidget(
                                key: ValueKey('profile'),
                                icon: Icon(
                                  key: ValueKey('profile'),
                                  Icons.security,
                                  size: 21.0,
                                ),
                                text: 'Edit security settings',
                              ),
                            ),
                          ),
                        ),
                        if ((currentUserDocument?.rol == Roles.business) &&
                            (currentUserDocument?.rol == Roles.profesional
                                ? (currentUserDocument?.business == null)
                                : true))
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 326.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.code =
                                          functions.generateRandomCode();
                                      _model.codes = await queryCodesRecordOnce(
                                        queryBuilder: (codesRecord) =>
                                            codesRecord.where(
                                          'business',
                                          isEqualTo: currentUserReference,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if ((_model.codes != null) == true) {
                                        _model.code = _model.codes?.code;
                                      } else {
                                        var codesRecordReference =
                                            CodesRecord.collection.doc();
                                        await codesRecordReference
                                            .set(createCodesRecordData(
                                          business: currentUserReference,
                                          code: _model.code,
                                          name: valueOrDefault(
                                              currentUserDocument?.comapny, ''),
                                        ));
                                        _model.newCode =
                                            CodesRecord.getDocumentFromData(
                                                createCodesRecordData(
                                                  business:
                                                      currentUserReference,
                                                  code: _model.code,
                                                  name: valueOrDefault(
                                                      currentUserDocument
                                                          ?.comapny,
                                                      ''),
                                                ),
                                                codesRecordReference);
                                      }

                                      safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.accountOptionModel5,
                                      updateCallback: () => safeSetState(() {}),
                                      child: AccountOptionWidget(
                                        key: ValueKey('seeCode'),
                                        icon: Icon(
                                          key: ValueKey('seeCode'),
                                          Icons.password,
                                          size: 30.0,
                                        ),
                                        text: 'See my code',
                                      ),
                                    ),
                                  ),
                                  if (_model.code != null && _model.code != '')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FlutterFlowIconButton(
                                          key: ValueKey('copyCode'),
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.content_copy,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 23.0,
                                          ),
                                          onPressed: () async {
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: _model.code!));
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            key: ValueKey('code'),
                                            _model.code!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          )),
                                        ),
                                      ],
                                    ),
                                ].divide(SizedBox(height: 3.0)),
                              ),
                            ),
                          ),
                        if (currentUserDocument?.rol == Roles.profesional
                            ? (currentUserDocument?.business == null)
                            : true)
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 326.0,
                              height: 52.0,
                              decoration: BoxDecoration(),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(BlockListWidget.routeName);
                                },
                                child: wrapWithModel(
                                  model: _model.accountOptionModel6,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AccountOptionWidget(
                                    key: ValueKey('block'),
                                    icon: Icon(
                                      key: ValueKey('block'),
                                      Icons.no_accounts,
                                      size: 30.0,
                                    ),
                                    text: 'Blocked list',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if ((currentUserDocument?.rol != Roles.user) &&
                            (currentUserDocument?.business == null))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 64.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 326.0,
                                height: 52.0,
                                decoration: BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      MembresiasV2Widget.routeName,
                                      queryParameters: {
                                        'professionalUpdate': serializeParam(
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
                                  child: wrapWithModel(
                                    model: _model.accountOptionModel7,
                                    updateCallback: () => safeSetState(() {}),
                                    child: AccountOptionWidget(
                                      key: ValueKey('change'),
                                      icon: Icon(
                                        key: ValueKey('change'),
                                        Icons.contact_emergency,
                                        size: 30.0,
                                      ),
                                      text: 'Change subscription',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 326.0,
                            height: 52.0,
                            decoration: BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await launchURL(
                                    'https://icareapp.com.au/privacy-policy');
                              },
                              child: wrapWithModel(
                                model: _model.accountOptionModel8,
                                updateCallback: () => safeSetState(() {}),
                                child: AccountOptionWidget(
                                  key: ValueKey('terms'),
                                  icon: Icon(
                                    key: ValueKey('terms'),
                                    Icons.contact_page_outlined,
                                    size: 30.0,
                                  ),
                                  text: 'Terms and conditions',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 326.0,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(DeleteaccountWidget.routeName);
                            },
                            child: wrapWithModel(
                              model: _model.accountOptionModel9,
                              updateCallback: () => safeSetState(() {}),
                              child: AccountOptionWidget(
                                key: ValueKey('delete'),
                                icon: Icon(
                                  key: ValueKey('delete'),
                                  Icons.delete_sweep,
                                ),
                                text: 'Delete account',
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 40.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().authUserFireBase = false;

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  isActive: false,
                                ));
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    LoginWidget.routeName, context.mounted);
                              },
                              text: 'Sign out',
                              icon: Icon(
                                Icons.login_sharp,
                                color: Color(0xFFB928B8),
                                size: 25.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 8.0))
                          .addToStart(SizedBox(height: 0.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.01),
                child: Container(
                  height: 73.0,
                  decoration: BoxDecoration(
                    color: Color(0xBEB928B8),
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
