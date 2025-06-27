import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/stripe/payment_manager.dart';
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
import 'register_pfofesional5_model.dart';
export 'register_pfofesional5_model.dart';

class RegisterPfofesional5Widget extends StatefulWidget {
  const RegisterPfofesional5Widget({
    super.key,
    bool? isBussines,
  }) : this.isBussines = isBussines ?? false;

  final bool isBussines;

  static String routeName = 'RegisterPfofesional5';
  static String routePath = 'registerPfofesional5';

  @override
  State<RegisterPfofesional5Widget> createState() =>
      _RegisterPfofesional5WidgetState();
}

class _RegisterPfofesional5WidgetState
    extends State<RegisterPfofesional5Widget> {
  late RegisterPfofesional5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterPfofesional5Model());

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
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFBD39BA),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                  context.pop();
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
                                    alignment: Alignment(0.0, 0.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height: MediaQuery.sizeOf(context).height * 0.5,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Add video',
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
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Text(
                                          'Complete your profile! Upload a video that clearly shows your face. Don\'t forget to review it before sending it! This is optional.',
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.01, 0.71),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              allowPhoto: false,
                                              allowVideo: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                      .isDataUploading_uploadData80lA =
                                                  true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                            ))
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading_uploadData80lA =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                      .length ==
                                                  selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_uploadData80lA =
                                                      selectedUploadedFiles
                                                          .first;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }

                                            _model.verifyVideo =
                                                await actions.verifySizeVideo(
                                              _model
                                                  .uploadedLocalFile_uploadData80lA,
                                            );
                                            if (_model.verifyVideo!) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Video uploaded',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'The video was not uploaded correctly',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFFD2395B),
                                                ),
                                              );
                                              safeSetState(() {
                                                _model.isDataUploading_uploadData80lA =
                                                    false;
                                                _model.uploadedLocalFile_uploadData80lA =
                                                    FFUploadedFile(
                                                        bytes:
                                                            Uint8List.fromList(
                                                                []));
                                              });
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Upload video',
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
                                            0.0, 20.0, 0.0, 10.0),
                                        child: FFButtonWidget(
                                          onPressed:
                                              ((_model.uploadedLocalFile_uploadData80lA
                                                              .bytes?.isEmpty ??
                                                          true))
                                                  ? null
                                                  : () async {
                                                      if ((_model
                                                                  .uploadedLocalFile_uploadData80lA
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false)) {
                                                        {
                                                          safeSetState(() =>
                                                              _model.isDataUploading_uploadDataZ712 =
                                                                  true);
                                                          var selectedUploadedFiles =
                                                              <FFUploadedFile>[];
                                                          var selectedMedia =
                                                              <SelectedFile>[];
                                                          var downloadUrls =
                                                              <String>[];
                                                          try {
                                                            selectedUploadedFiles = _model
                                                                    .uploadedLocalFile_uploadData80lA
                                                                    .bytes!
                                                                    .isNotEmpty
                                                                ? [
                                                                    _model
                                                                        .uploadedLocalFile_uploadData80lA
                                                                  ]
                                                                : <FFUploadedFile>[];
                                                            selectedMedia =
                                                                selectedFilesFromUploadedFiles(
                                                              selectedUploadedFiles,
                                                            );
                                                            downloadUrls =
                                                                (await Future
                                                                        .wait(
                                                              selectedMedia.map(
                                                                (m) async =>
                                                                    await uploadData(
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
                                                            _model.isDataUploading_uploadDataZ712 =
                                                                false;
                                                          }
                                                          if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length &&
                                                              downloadUrls
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                            safeSetState(() {
                                                              _model.uploadedLocalFile_uploadDataZ712 =
                                                                  selectedUploadedFiles
                                                                      .first;
                                                              _model.uploadedFileUrl_uploadDataZ712 =
                                                                  downloadUrls
                                                                      .first;
                                                            });
                                                          } else {
                                                            safeSetState(() {});
                                                            return;
                                                          }
                                                        }

                                                        await currentUserReference!
                                                            .update(
                                                                createUsersRecordData(
                                                          video: _model
                                                              .uploadedFileUrl_uploadDataZ712,
                                                        ));
                                                        final paymentResponse =
                                                            await processStripePayment(
                                                          context,
                                                          amount: () {
                                                            if (FFAppState()
                                                                    .registerProviderForm
                                                                    .plan ==
                                                                Plan.basic) {
                                                              return FFAppConstants
                                                                  .basicPrice;
                                                            } else if (FFAppState()
                                                                    .registerProviderForm
                                                                    .plan ==
                                                                Plan.standar) {
                                                              return FFAppConstants
                                                                  .standarPrice;
                                                            } else {
                                                              return FFAppConstants
                                                                  .premiunPrice;
                                                            }
                                                          }(),
                                                          currency: 'AUD',
                                                          customerEmail:
                                                              FFAppState()
                                                                  .registerProviderForm
                                                                  .email,
                                                          customerName: FFAppState()
                                                              .registerProviderForm
                                                              .firstName,
                                                          description: () {
                                                            if (FFAppState()
                                                                    .registerProviderForm
                                                                    .plan ==
                                                                Plan.basic) {
                                                              return 'Plan Basic';
                                                            } else if (FFAppState()
                                                                    .registerProviderForm
                                                                    .plan ==
                                                                Plan.standar) {
                                                              return 'Plan Standar';
                                                            } else {
                                                              return 'Plan Premiun';
                                                            }
                                                          }(),
                                                          allowGooglePay: true,
                                                          allowApplePay: false,
                                                        );
                                                        if (paymentResponse
                                                                    .paymentId ==
                                                                null &&
                                                            paymentResponse
                                                                    .errorMessage !=
                                                                null) {
                                                          showSnackbar(
                                                            context,
                                                            'Error: ${paymentResponse.errorMessage}',
                                                          );
                                                        }
                                                        _model.paymentId =
                                                            paymentResponse
                                                                    .paymentId ??
                                                                '';

                                                        if (_model.paymentId !=
                                                                null &&
                                                            _model.paymentId !=
                                                                '') {
                                                          FFAppState()
                                                                  .authUserFireBase =
                                                              true;
                                                          FFAppState()
                                                                  .isCreatedProfesional =
                                                              true;
                                                          safeSetState(() {});

                                                          context.goNamed(
                                                            HomeSearchWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'authUser':
                                                                  serializeParam(
                                                                true,
                                                                ParamType.bool,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          await authManager
                                                              .deleteUser(
                                                                  context);
                                                        }
                                                      }

                                                      safeSetState(() {});
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
                                            disabledColor: Color(0xFF99A1A8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.video =
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/gv12biya5vta/video_coming_soon!.mp4';
                                          safeSetState(() {});

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            video:
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/gv12biya5vta/video_coming_soon!.mp4',
                                          ));
                                          final paymentResponse =
                                              await processStripePayment(
                                            context,
                                            amount: () {
                                              if (FFAppState()
                                                      .registerProviderForm
                                                      .plan ==
                                                  Plan.basic) {
                                                return FFAppConstants
                                                    .basicPrice;
                                              } else if (FFAppState()
                                                      .registerProviderForm
                                                      .plan ==
                                                  Plan.standar) {
                                                return FFAppConstants
                                                    .standarPrice;
                                              } else {
                                                return FFAppConstants
                                                    .premiunPrice;
                                              }
                                            }(),
                                            currency: 'AUD',
                                            customerEmail: FFAppState()
                                                .registerProviderForm
                                                .email,
                                            customerName: FFAppState()
                                                .registerProviderForm
                                                .firstName,
                                            description: () {
                                              if (FFAppState()
                                                      .registerProviderForm
                                                      .plan ==
                                                  Plan.basic) {
                                                return 'Plan Basic';
                                              } else if (FFAppState()
                                                      .registerProviderForm
                                                      .plan ==
                                                  Plan.standar) {
                                                return 'Plan Standar';
                                              } else {
                                                return 'Plan Premiun';
                                              }
                                            }(),
                                            allowGooglePay: true,
                                            allowApplePay: false,
                                          );
                                          if (paymentResponse.paymentId ==
                                                  null &&
                                              paymentResponse.errorMessage !=
                                                  null) {
                                            showSnackbar(
                                              context,
                                              'Error: ${paymentResponse.errorMessage}',
                                            );
                                          }
                                          _model.paymentId1 =
                                              paymentResponse.paymentId ?? '';

                                          if (_model.paymentId1 != null &&
                                              _model.paymentId1 != '') {
                                            FFAppState().authUserFireBase =
                                                true;
                                            FFAppState().isCreatedProfesional =
                                                true;
                                            safeSetState(() {});

                                            context.goNamed(
                                              HomeSearchWidget.routeName,
                                              queryParameters: {
                                                'authUser': serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            await authManager
                                                .deleteUser(context);
                                          }

                                          safeSetState(() {});
                                        },
                                        text: 'Skip Video',
                                        options: FFButtonOptions(
                                          width: 150.0,
                                          height: 45.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
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
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 5.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .addToStart(SizedBox(height: 10.0))
                                      .addToEnd(SizedBox(height: 16.0)),
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
