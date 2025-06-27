import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:lock_orientation_library_opafp4/custom_code/actions/index.dart'
    as lock_orientation_library_opafp4_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_pfofesional4_copy_model.dart';
export 'register_pfofesional4_copy_model.dart';

class RegisterPfofesional4CopyWidget extends StatefulWidget {
  const RegisterPfofesional4CopyWidget({
    super.key,
    this.businessRef,
    bool? isBussines,
  }) : this.isBussines = isBussines ?? false;

  final DocumentReference? businessRef;
  final bool isBussines;

  static String routeName = 'RegisterPfofesional4Copy';
  static String routePath = 'registerPfofesional4Copy';

  @override
  State<RegisterPfofesional4CopyWidget> createState() =>
      _RegisterPfofesional4CopyWidgetState();
}

class _RegisterPfofesional4CopyWidgetState
    extends State<RegisterPfofesional4CopyWidget> {
  late RegisterPfofesional4CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterPfofesional4CopyModel());

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
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
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/escoger-users.png',
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.91, -0.96),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.arrow_back_ios_new,
                                          color: Color(0xFFF8F6F6),
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/logoapp.png',
                                            width: 110.0,
                                            height: 116.0,
                                            fit: BoxFit.fitWidth,
                                            alignment: Alignment(0.0, 0.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (_model.changevideo == false) {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.3),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.96,
                                              height: 565.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFFFEFE),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(24.0),
                                                  bottomRight:
                                                      Radius.circular(24.0),
                                                  topLeft:
                                                      Radius.circular(24.0),
                                                  topRight:
                                                      Radius.circular(24.0),
                                                ),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Add Photos',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF8E058A),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (_model.photosVerify)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Text(
                                                          'Let’s complete your profile! Upload a photo where your face is clear and visible. Don\'t forget to review before submitting!',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF6F6F6F),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (!_model.photosVerify)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Please upload photos to complete your profile. Make sure your face is clear and visible, don’t forget to',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFFE90606),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 380.0,
                                                      height: 1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF0DFEF),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFF0DFEF),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 330.0,
                                                      height: 300.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFFEFE),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  24.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  24.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  24.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  24.0),
                                                        ),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFC45ABE),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 130.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFD9D9D9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFD9D9D9),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .img1Model,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ImageUploadWidget(
                                                                    key: ValueKey(
                                                                        'image1'),
                                                                    background:
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/t1hvbw0itpgb/profile.png',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 130.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFD9D9D9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFD9D9D9),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .img2Model,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ImageUploadWidget(
                                                                    key: ValueKey(
                                                                        'image1'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 130.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFD9D9D9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFD9D9D9),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .img3Model,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ImageUploadWidget(
                                                                    key: ValueKey(
                                                                        'image1'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 130.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFD9D9D9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFD9D9D9),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .img4Model,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ImageUploadWidget(
                                                                    key: ValueKey(
                                                                        'image1'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 130.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFD9D9D9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFD9D9D9),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .img5Model,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ImageUploadWidget(
                                                                    key: ValueKey(
                                                                        'image1'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 130.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFD9D9D9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            12.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            12.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            12.0),
                                                                  ),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFD9D9D9),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .img6Model,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      ImageUploadWidget(
                                                                    key: ValueKey(
                                                                        'image1'),
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
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 380.0,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF0DFEF),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFF0DFEF),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.01, 0.71),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          if (FFAppState()
                                                                  .imagesUserUpload
                                                                  .length >
                                                              0) {
                                                            _model.photosVerify =
                                                                true;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                .updateRegisterProviderFormStruct(
                                                              (e) => e
                                                                ..images = FFAppState()
                                                                    .imagesUserUpload
                                                                    .where((e) =>
                                                                        (e !=
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/xokotouxb9hk/imageText.png') &&
                                                                        (e !=
                                                                            ''))
                                                                    .toList(),
                                                            );
                                                            safeSetState(() {});
                                                            GoRouter.of(context)
                                                                .prepareAuthEvent();

                                                            final user =
                                                                await authManager
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

                                                            await UsersRecord
                                                                .collection
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
                                                                phoneNumber:
                                                                    FFAppState()
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
                                                                description:
                                                                    FFAppState()
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
                                                                  'images':
                                                                      FFAppState()
                                                                          .imagesUserUpload,
                                                                  'serviceType':
                                                                      FFAppState()
                                                                          .registerProviderForm
                                                                          .serviceType,
                                                                  'disabilities':
                                                                      FFAppState()
                                                                          .registerProviderForm
                                                                          .disabilities,
                                                                  'morning': FFAppState()
                                                                      .registerProviderForm
                                                                      .morning,
                                                                  'noon': FFAppState()
                                                                      .registerProviderForm
                                                                      .noon,
                                                                  'afternoon':
                                                                      FFAppState()
                                                                          .registerProviderForm
                                                                          .afternoon,
                                                                },
                                                              ),
                                                            });

                                                            await widget
                                                                .businessRef!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'professionals':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    currentUserReference
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            FFAppState()
                                                                    .isCreatedProfesional =
                                                                true;
                                                            FFAppState()
                                                                    .authUserFireBase =
                                                                true;
                                                            safeSetState(() {});
                                                            _model.changevideo =
                                                                true;
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.photosVerify =
                                                                false;
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        text: 'Create Profile',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 275.0,
                                                          height: 45.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFFB928B8),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 5.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else if (_model.changevideo == true) {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.96,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.45,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFFFEFE),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(24.0),
                                                  bottomRight:
                                                      Radius.circular(24.0),
                                                  topLeft:
                                                      Radius.circular(24.0),
                                                  topRight:
                                                      Radius.circular(24.0),
                                                ),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Add video',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF8E058A),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
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
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Text(
                                                        'Complete your profile! Upload a video that clearly shows your face. Don\'t forget to review it before sending it! This is optional.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF6F6F6F),
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.01, 0.71),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          final selectedMedia =
                                                              await selectMediaWithSourceBottomSheet(
                                                            context: context,
                                                            allowPhoto: false,
                                                            allowVideo: true,
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            safeSetState(() =>
                                                                _model.isDataUploading_uploadData80lB =
                                                                    true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                          ))
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading_uploadData80lB =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                              safeSetState(() {
                                                                _model.uploadedLocalFile_uploadData80lB =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                              });
                                                            } else {
                                                              safeSetState(
                                                                  () {});
                                                              return;
                                                            }
                                                          }

                                                          _model.verifyVideo =
                                                              await actions
                                                                  .verifySizeVideo(
                                                            _model
                                                                .uploadedLocalFile_uploadData80lB,
                                                          );
                                                          if (_model
                                                              .verifyVideo!) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Video uploaded',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'File must be no larger than 100 MB',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFFD2395B),
                                                              ),
                                                            );
                                                            safeSetState(() {
                                                              _model.isDataUploading_uploadData80lB =
                                                                  false;
                                                              _model.uploadedLocalFile_uploadData80lB =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []));
                                                            });
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        text: 'Upload video',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 275.0,
                                                          height: 45.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFFB928B8),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 5.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 380.0,
                                                        height: 1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF0DFEF),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFF0DFEF),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.01, 0.71),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: FFButtonWidget(
                                                        onPressed: ((_model
                                                                        .uploadedLocalFile_uploadData80lB
                                                                        .bytes
                                                                        ?.isEmpty ??
                                                                    true))
                                                            ? null
                                                            : () async {
                                                                if ((_model
                                                                            .uploadedLocalFile_uploadData80lB
                                                                            .bytes
                                                                            ?.isNotEmpty ??
                                                                        false)) {
                                                                  {
                                                                    safeSetState(() =>
                                                                        _model.isDataUploading_uploadDataZ713 =
                                                                            true);
                                                                    var selectedUploadedFiles =
                                                                        <FFUploadedFile>[];
                                                                    var selectedMedia =
                                                                        <SelectedFile>[];
                                                                    var downloadUrls =
                                                                        <String>[];
                                                                    try {
                                                                      selectedUploadedFiles = _model
                                                                              .uploadedLocalFile_uploadData80lB
                                                                              .bytes!
                                                                              .isNotEmpty
                                                                          ? [
                                                                              _model.uploadedLocalFile_uploadData80lB
                                                                            ]
                                                                          : <FFUploadedFile>[];
                                                                      selectedMedia =
                                                                          selectedFilesFromUploadedFiles(
                                                                        selectedUploadedFiles,
                                                                      );
                                                                      downloadUrls = (await Future
                                                                              .wait(
                                                                        selectedMedia
                                                                            .map(
                                                                          (m) async => await uploadData(
                                                                              m.storagePath,
                                                                              m.bytes),
                                                                        ),
                                                                      ))
                                                                          .where((u) =>
                                                                              u !=
                                                                              null)
                                                                          .map((u) =>
                                                                              u!)
                                                                          .toList();
                                                                    } finally {
                                                                      _model.isDataUploading_uploadDataZ713 =
                                                                          false;
                                                                    }
                                                                    if (selectedUploadedFiles.length ==
                                                                            selectedMedia
                                                                                .length &&
                                                                        downloadUrls.length ==
                                                                            selectedMedia.length) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model.uploadedLocalFile_uploadDataZ713 =
                                                                            selectedUploadedFiles.first;
                                                                        _model.uploadedFileUrl_uploadDataZ713 =
                                                                            downloadUrls.first;
                                                                      });
                                                                    } else {
                                                                      safeSetState(
                                                                          () {});
                                                                      return;
                                                                    }
                                                                  }

                                                                  _model.video =
                                                                      _model
                                                                          .uploadedFileUrl_uploadDataZ713;
                                                                  safeSetState(
                                                                      () {});

                                                                  await currentUserReference!
                                                                      .update(
                                                                          createUsersRecordData(
                                                                    video: _model
                                                                        .uploadedFileUrl_uploadDataZ713,
                                                                  ));
                                                                }

                                                                context.goNamed(
                                                                    PeoplewhoputyouinfavoritesWidget
                                                                        .routeName);
                                                              },
                                                        text: 'Create Profile',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 275.0,
                                                          height: 45.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFFB928B8),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .montserrat(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 5.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          disabledColor:
                                                              Color(0xFF99A1A8),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await currentUserReference!
                                                            .update(
                                                                createUsersRecordData(
                                                          video:
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/gv12biya5vta/video_coming_soon!.mp4',
                                                        ));

                                                        context.goNamed(
                                                            PeoplewhoputyouinfavoritesWidget
                                                                .routeName);
                                                      },
                                                      text: 'Skip Video',
                                                      options: FFButtonOptions(
                                                        width: 150.0,
                                                        height: 45.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFB928B8),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 5.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .addToStart(
                                                        SizedBox(height: 10.0))
                                                    .addToEnd(
                                                        SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            '',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          );
                                        }
                                      },
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
