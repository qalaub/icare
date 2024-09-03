import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/user/account_option/account_option_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'userprofile_model.dart';
export 'userprofile_model.dart';

class UserprofileWidget extends StatefulWidget {
  const UserprofileWidget({super.key});

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            if (currentUserDocument?.rol == Roles.user) {
                              return Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xB6E7A2D2),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Diseo_sin_ttulo_(6)_4.png',
                                          width: 67.0,
                                          height: 101.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault(
                                              currentUserDocument?.firtsName,
                                              ''),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: const BoxDecoration(
                                  color: Color(0x31FB8CE2),
                                ),
                                child: Stack(
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            currentUserPhoto,
                                            'https://i.ibb.co/2qkDLKb/Frame-74.png',
                                          ),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0x59F428EB),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Diseo_sin_ttulo_(6)_4.png',
                                                width: 67.0,
                                                height: 101.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.firtsName,
                                                      ''),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            const Color(0xFFF9F9F9),
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        if (currentUserPhoto == '')
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 326.0,
                                height: 150.0,
                                decoration: const BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Profilesettings');
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
                        if (currentUserDocument?.rol != Roles.user)
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 326.0,
                              height: 52.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (currentUserDocument?.plan ==
                                        Plan.basic) {
                                      context.pushNamed('MySubscriptionBasic');
                                    } else if (currentUserDocument?.plan ==
                                        Plan.standar) {
                                      context
                                          .pushNamed('MySubscriptionStandard');
                                    } else {
                                      context
                                          .pushNamed('MySubscriptionPremium');
                                    }
                                  },
                                  child: wrapWithModel(
                                    model: _model.accountOptionModel1,
                                    updateCallback: () => setState(() {}),
                                    child: const AccountOptionWidget(
                                      icon: Icon(
                                        Icons.card_membership_outlined,
                                        size: 30.0,
                                      ),
                                      text: 'my subscription',
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 326.0,
                                height: 56.0,
                                decoration: const BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Premium',
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
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Profilesettings');
                            },
                            child: wrapWithModel(
                              model: _model.accountOptionModel2,
                              updateCallback: () => setState(() {}),
                              child: const AccountOptionWidget(
                                icon: Icon(
                                  Icons.location_history,
                                  size: 30.0,
                                ),
                                text: 'My Profile',
                              ),
                            ),
                          ),
                        ),
                        if (currentUserDocument?.rol == Roles.business)
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 326.0,
                              decoration: const BoxDecoration(),
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

                                      setState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.accountOptionModel3,
                                      updateCallback: () => setState(() {}),
                                      child: const AccountOptionWidget(
                                        icon: Icon(
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
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            _model.code!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          )),
                                        ),
                                      ],
                                    ),
                                ].divide(const SizedBox(height: 3.0)),
                              ),
                            ),
                          ),
                        Container(
                          width: 326.0,
                          height: 52.0,
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('BlockList');
                            },
                            child: wrapWithModel(
                              model: _model.accountOptionModel4,
                              updateCallback: () => setState(() {}),
                              child: const AccountOptionWidget(
                                icon: Icon(
                                  Icons.no_accounts,
                                  size: 30.0,
                                ),
                                text: 'Blocked list',
                              ),
                            ),
                          ),
                        ),
                        if ((currentUserDocument?.rol != Roles.user) &&
                            (currentUserDocument?.business == null))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 64.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 326.0,
                                height: 52.0,
                                decoration: const BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'MembresiasV2',
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
                                    model: _model.accountOptionModel5,
                                    updateCallback: () => setState(() {}),
                                    child: const AccountOptionWidget(
                                      icon: Icon(
                                        Icons.contact_emergency,
                                        size: 30.0,
                                      ),
                                      text: 'change subscription',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 326.0,
                            height: 52.0,
                            decoration: const BoxDecoration(),
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
                                model: _model.accountOptionModel6,
                                updateCallback: () => setState(() {}),
                                child: const AccountOptionWidget(
                                  icon: Icon(
                                    Icons.contact_page_outlined,
                                    size: 30.0,
                                  ),
                                  text: 'Terms and Conditions',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 40.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().authUserFireBase = false;
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth('Login', context.mounted);
                              },
                              text: 'Sign out',
                              icon: const Icon(
                                Icons.login_sharp,
                                size: 25.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 12.0))
                          .addToStart(const SizedBox(height: 0.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.01),
                child: Container(
                  height: 73.0,
                  decoration: const BoxDecoration(
                    color: Color(0xBEB928B8),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (currentUserDocument?.rol != Roles.business) {
                        return wrapWithModel(
                          model: _model.navbarModel,
                          updateCallback: () => setState(() {}),
                          child: const NavbarWidget(),
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.navbarPremiunModel,
                          updateCallback: () => setState(() {}),
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
