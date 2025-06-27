import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:lock_orientation_library_opafp4/custom_code/actions/index.dart'
    as lock_orientation_library_opafp4_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_business4_model.dart';
export 'register_business4_model.dart';

class RegisterBusiness4Widget extends StatefulWidget {
  const RegisterBusiness4Widget({super.key});

  static String routeName = 'RegisterBusiness4';
  static String routePath = 'registerBusiness4';

  @override
  State<RegisterBusiness4Widget> createState() =>
      _RegisterBusiness4WidgetState();
}

class _RegisterBusiness4WidgetState extends State<RegisterBusiness4Widget> {
  late RegisterBusiness4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterBusiness4Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await lock_orientation_library_opafp4_actions.lockOrientation();
      FFAppState().updateRegisterProviderFormStruct(
        (e) => e..images = [],
      );
      FFAppState().imagesUserUpload = [];
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: Color(0xFFFFFEFE),
            automaticallyImplyLeading: false,
            actions: [],
            centerTitle: false,
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFBD39BA),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/escoger-users.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.91, -0.96),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Color(0xFFF9F9F9),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/logoapp.png',
                                    width: 110.0,
                                    height: 116.0,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.4),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height: 565.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFEFE),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24.0),
                                    bottomRight: Radius.circular(24.0),
                                    topLeft: Radius.circular(24.0),
                                    topRight: Radius.circular(24.0),
                                  ),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Add Photos',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF8E058A),
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    if (_model.photoVerify)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            'Let’s complete your profile! Upload a photo where your face is clear and visible. Don\'t forget to review before submitting!',
                                            textAlign: TextAlign.center,
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
                                                  color: Color(0xFF6F6F6F),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    if (!_model.photoVerify)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            'Please upload photos to complete your profile. Make sure your face is clear and visible, don’t forget to',
                                            textAlign: TextAlign.center,
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
                                                  color: Color(0xFFE90606),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 380.0,
                                        height: 1.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF0DFEF),
                                          border: Border.all(
                                            color: Color(0xFFF0DFEF),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width: 330.0,
                                        height: 300.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFFEFE),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(24.0),
                                            bottomRight: Radius.circular(24.0),
                                            topLeft: Radius.circular(24.0),
                                            topRight: Radius.circular(24.0),
                                          ),
                                          border: Border.all(
                                            color: Color(0xFFC45ABE),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                    border: Border.all(
                                                      color: Color(0xFFD9D9D9),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model.img1Model,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ImageUploadWidget(
                                                      key: ValueKey('image1'),
                                                      img: '',
                                                      background:
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/m1l8ejmnm0zy/company1.png',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                    border: Border.all(
                                                      color: Color(0xFFD9D9D9),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model.img2Model,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ImageUploadWidget(
                                                      key: ValueKey('image1'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                    border: Border.all(
                                                      color: Color(0xFFD9D9D9),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model.img3Model,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ImageUploadWidget(
                                                      key: ValueKey('image1'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 0.0, 10.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                    border: Border.all(
                                                      color: Color(0xFFD9D9D9),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model.img4Model,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ImageUploadWidget(
                                                      key: ValueKey('image1'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                    border: Border.all(
                                                      color: Color(0xFFD9D9D9),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model.img5Model,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ImageUploadWidget(
                                                      key: ValueKey('image1'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 10.0, 10.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12.0),
                                                      bottomRight:
                                                          Radius.circular(12.0),
                                                      topLeft:
                                                          Radius.circular(12.0),
                                                      topRight:
                                                          Radius.circular(12.0),
                                                    ),
                                                    border: Border.all(
                                                      color: Color(0xFFD9D9D9),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model.img6Model,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ImageUploadWidget(
                                                      key: ValueKey('image1'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width: 380.0,
                                          height: 1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0DFEF),
                                            border: Border.all(
                                              color: Color(0xFFF0DFEF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.01, 0.71),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: FFButtonWidget(
                                          key: ValueKey('create'),
                                          onPressed: () async {
                                            if (FFAppState()
                                                    .imagesUserUpload
                                                    .length >
                                                0) {
                                              _model.photoVerify = true;
                                              safeSetState(() {});
                                              FFAppState()
                                                  .updateRegisterProviderFormStruct(
                                                (e) => e
                                                  ..images = FFAppState()
                                                      .imagesUserUpload
                                                      .where((e) =>
                                                          (e !=
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/xokotouxb9hk/imageText.png') &&
                                                          (e != ''))
                                                      .toList(),
                                              );
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();

                                              final user = await authManager
                                                  .createAccountWithEmail(
                                                context,
                                                FFAppState()
                                                    .registerProviderForm
                                                    .email,
                                                FFAppState()
                                                    .registerProviderForm
                                                    .password,
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
                                                  ndis: FFAppState()
                                                      .registerProviderForm
                                                      .ndis,
                                                  phoneNumber: FFAppState()
                                                      .registerProviderForm
                                                      .phone,
                                                  email: FFAppState()
                                                      .registerProviderForm
                                                      .email,
                                                  age: FFAppState()
                                                      .registerProviderForm
                                                      .age,
                                                  years: FFAppState()
                                                      .registerProviderForm
                                                      .years,
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
                                                  rol: FFAppState()
                                                      .registerProviderForm
                                                      .rol,
                                                  plan: FFAppState()
                                                      .registerProviderForm
                                                      .plan,
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
                                                  paymentDate:
                                                      getCurrentTimestamp,
                                                  freeTrial: true,
                                                  displayName: '',
                                                  abn: FFAppState()
                                                      .registerProviderForm
                                                      .abn,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'images': FFAppState()
                                                        .imagesUserUpload,
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

                                              context.goNamedAuth(
                                                  RegisterPfofesional5Widget
                                                      .routeName,
                                                  context.mounted);
                                            } else {
                                              _model.photoVerify = false;
                                              safeSetState(() {});
                                            }
                                          },
                                          text: 'Create Profile',
                                          options: FFButtonOptions(
                                            width: 275.0,
                                            height: 45.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFB928B8),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 5.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
