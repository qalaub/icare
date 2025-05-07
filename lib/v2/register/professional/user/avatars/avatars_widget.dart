import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/avatar_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'avatars_model.dart';
export 'avatars_model.dart';

class AvatarsWidget extends StatefulWidget {
  const AvatarsWidget({
    super.key,
    bool? isUpdate,
  }) : this.isUpdate = isUpdate ?? false;

  final bool isUpdate;

  static String routeName = 'avatars';
  static String routePath = 'avatars';

  @override
  State<AvatarsWidget> createState() => _AvatarsWidgetState();
}

class _AvatarsWidgetState extends State<AvatarsWidget> {
  late AvatarsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isUpdate) {
        _model.selectImage = currentUserPhoto;
        safeSetState(() {});
      }
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
            'Choose your AVATAR',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Builder(
                      builder: (context) {
                        final avatar = FFAppConstants.avatars.toList();

                        return GridView.builder(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            20.0,
                            0,
                            0,
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: avatar.length,
                          itemBuilder: (context, avatarIndex) {
                            final avatarItem = avatar[avatarIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.selectImage = avatarItem;
                                safeSetState(() {});
                              },
                              child: AvatarComponentWidget(
                                key: Key(
                                    'Key6tv_${avatarIndex}_of_${avatar.length}'),
                                img: avatarItem,
                                isActive: _model.selectImage == avatarItem
                                    ? true
                                    : false,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            key: ValueKey('continue'),
                            onPressed: () async {
                              if (widget.isUpdate) {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  photoUrl: _model.selectImage,
                                ));

                                context.pushNamedAuth(
                                    ProfileSettingsWidget.routeName,
                                    context.mounted);
                              } else {
                                FFAppState().updateRegisterProviderFormStruct(
                                  (e) => e
                                    ..updateImages(
                                      (e) => e.add(_model.selectImage),
                                    ),
                                );
                                safeSetState(() {});
                                GoRouter.of(context).prepareAuthEvent();

                                final user =
                                    await authManager.createAccountWithEmail(
                                  context,
                                  FFAppState().registerProviderForm.email,
                                  FFAppState().registerProviderForm.password,
                                );
                                if (user == null) {
                                  return;
                                }

                                await UsersRecord.collection
                                    .doc(user.uid)
                                    .update({
                                  ...createUsersRecordData(
                                    firtsName: FFAppState()
                                        .registerProviderForm
                                        .firstName,
                                    lastName: FFAppState()
                                        .registerProviderForm
                                        .lastName,
                                    birthdate: FFAppState()
                                        .registerProviderForm
                                        .birthdate,
                                    suburb: FFAppState()
                                        .registerProviderForm
                                        .suburb,
                                    ndis:
                                        FFAppState().registerProviderForm.ndis,
                                    phoneNumber:
                                        FFAppState().registerProviderForm.phone,
                                    email:
                                        FFAppState().registerProviderForm.email,
                                    age: FFAppState().registerProviderForm.age,
                                    years:
                                        FFAppState().registerProviderForm.years,
                                    gender: FFAppState()
                                        .registerProviderForm
                                        .gender,
                                    description: FFAppState()
                                        .registerProviderForm
                                        .description,
                                    comapny: FFAppState()
                                        .registerProviderForm
                                        .company,
                                    languagues: '',
                                    rol: FFAppState().registerProviderForm.rol,
                                    plan:
                                        FFAppState().registerProviderForm.plan,
                                    photoUrl: FFAppState()
                                                .registerProviderForm
                                                .images
                                                .length >
                                            0
                                        ? FFAppState()
                                            .registerProviderForm
                                            .images
                                            .firstOrNull
                                        : ' ',
                                    business: FFAppState()
                                        .registerProviderForm
                                        .business,
                                    paymentDate: getCurrentTimestamp,
                                    freeTrial: true,
                                    displayName: '',
                                    abn: FFAppState().registerProviderForm.abn,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'images': FFAppState().imagesUserUpload,
                                      'serviceType': FFAppState()
                                          .registerProviderForm
                                          .serviceType,
                                      'disabilities': FFAppState()
                                          .registerProviderForm
                                          .disabilities,
                                      'morning': FFAppState()
                                          .registerProviderForm
                                          .morning,
                                      'noon': FFAppState()
                                          .registerProviderForm
                                          .noon,
                                      'afternoon': FFAppState()
                                          .registerProviderForm
                                          .afternoon,
                                    },
                                  ),
                                });

                                FFAppState().authUserFireBase = true;

                                context.pushNamedAuth(
                                  HomeSearchWidget.routeName,
                                  context.mounted,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 200),
                                    ),
                                  },
                                );
                              }
                            },
                            text: widget.isUpdate ? 'Update' : 'Create',
                            options: FFButtonOptions(
                              width: 275.0,
                              height: 45.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFB928B8),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 5.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ].addToEnd(SizedBox(height: 38.0)),
            ),
          ),
        ),
      ),
    );
  }
}
