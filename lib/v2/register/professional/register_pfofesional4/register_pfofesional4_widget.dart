import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'register_pfofesional4_model.dart';
export 'register_pfofesional4_model.dart';

class RegisterPfofesional4Widget extends StatefulWidget {
  const RegisterPfofesional4Widget({
    super.key,
    this.businessRef,
  });

  final DocumentReference? businessRef;

  @override
  State<RegisterPfofesional4Widget> createState() =>
      _RegisterPfofesional4WidgetState();
}

class _RegisterPfofesional4WidgetState
    extends State<RegisterPfofesional4Widget> {
  late RegisterPfofesional4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterPfofesional4Model());
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFFFFFEFE),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/escoger-users.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.91, -0.96),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 40, 0, 0),
                                  child: Container(
                                    width: 380,
                                    height: 526,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFEFE),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(24),
                                        bottomRight: Radius.circular(24),
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                      ),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0, -1),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Add Photos',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: const Color(0xFF8E058A),
                                                      fontSize: 20,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          if (_model.photosVerify)
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(0, -1),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 10),
                                                child: Text(
                                                  'Let’s complete your profile! Upload a photo where your face is clear and visible. Don\'t forget to review before submitting!',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            const Color(0xFF6F6F6F),
                                                        fontSize: 13,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          if (!_model.photosVerify)
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(0, -1),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 0),
                                                child: Text(
                                                  'Please upload photos to complete your profile. Make sure your face is clear and visible, don’t forget to',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            const Color(0xFFE90606),
                                                        fontSize: 13,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0, 0),
                                            child: Container(
                                              width: 380,
                                              height: 1,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF0DFEF),
                                                border: Border.all(
                                                  color: const Color(0xFFF0DFEF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 30, 0, 0),
                                            child: Container(
                                              width: 350,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFEFE),
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(24),
                                                  bottomRight:
                                                      Radius.circular(24),
                                                  topLeft: Radius.circular(24),
                                                  topRight: Radius.circular(24),
                                                ),
                                                border: Border.all(
                                                  color: const Color(0xFFC45ABE),
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1, -1),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 10, 0, 0),
                                                      child: Container(
                                                        width: 100,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFD9D9D9),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12),
                                                            topRight:
                                                                Radius.circular(
                                                                    12),
                                                          ),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFD9D9D9),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: wrapWithModel(
                                                          model:
                                                              _model.img1Model,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const ImageUploadWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, -1),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Container(
                                                        width: 100,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFD9D9D9),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12),
                                                            topRight:
                                                                Radius.circular(
                                                                    12),
                                                          ),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFD9D9D9),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: wrapWithModel(
                                                          model:
                                                              _model.img2Model,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const ImageUploadWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, -1),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 10, 0),
                                                      child: Container(
                                                        width: 100,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFD9D9D9),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12),
                                                            topRight:
                                                                Radius.circular(
                                                                    12),
                                                          ),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFD9D9D9),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: wrapWithModel(
                                                          model:
                                                              _model.img3Model,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const ImageUploadWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1, 1),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(10, 10,
                                                                  0, 10),
                                                      child: Container(
                                                        width: 100,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFD9D9D9),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12),
                                                            topRight:
                                                                Radius.circular(
                                                                    12),
                                                          ),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFD9D9D9),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: wrapWithModel(
                                                          model:
                                                              _model.img4Model,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const ImageUploadWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0, 1),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 10),
                                                      child: Container(
                                                        width: 100,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFD9D9D9),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12),
                                                            topRight:
                                                                Radius.circular(
                                                                    12),
                                                          ),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFD9D9D9),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: wrapWithModel(
                                                          model:
                                                              _model.img5Model,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const ImageUploadWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 1),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0, 10,
                                                                  10, 10),
                                                      child: Container(
                                                        width: 100,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFD9D9D9),
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12),
                                                            topRight:
                                                                Radius.circular(
                                                                    12),
                                                          ),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFD9D9D9),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: wrapWithModel(
                                                          model:
                                                              _model.img6Model,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              const ImageUploadWidget(),
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
                                                const AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Container(
                                                width: 380,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFF0DFEF),
                                                  border: Border.all(
                                                    color: const Color(0xFFF0DFEF),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.01, 0.7),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (FFAppState()
                                                          .imagesUserUpload.isNotEmpty) {
                                                    _model.photosVerify = true;
                                                    safeSetState(() {});
                                                    FFAppState()
                                                        .updateRegisterProviderFormStruct(
                                                      (e) => e
                                                        ..images = FFAppState()
                                                            .imagesUserUpload
                                                            .where((e) =>
                                                                (e !=
                                                                    'https://i.ibb.co/b7TBHQJ/imagen-defecto.png') &&
                                                                (e != ''))
                                                            .toList(),
                                                    );
                                                    safeSetState(() {});
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
                                                                    .images.isNotEmpty
                                                            ? FFAppState()
                                                                .registerProviderForm
                                                                .images
                                                                .first
                                                            : ' ',
                                                        business: FFAppState()
                                                            .registerProviderForm
                                                            .business,
                                                        paymentDate:
                                                            getCurrentTimestamp,
                                                        freeTrial: true,
                                                        displayName: '',
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'images': FFAppState()
                                                              .imagesUserUpload,
                                                          'serviceType':
                                                              FFAppState()
                                                                  .registerProviderForm
                                                                  .serviceType,
                                                          'disabilities':
                                                              FFAppState()
                                                                  .registerProviderForm
                                                                  .disabilities,
                                                        },
                                                      ),
                                                    });

                                                    if (widget.businessRef !=
                                                        null) {
                                                      await widget.businessRef!
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

                                                      context.goNamedAuth(
                                                        'HomeSearch',
                                                        context.mounted,
                                                        queryParameters: {
                                                          'authUser':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
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
                                                        safeSetState(() {});

                                                        context.goNamedAuth(
                                                          'HomeSearch',
                                                          context.mounted,
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
                                                  } else {
                                                    _model.photosVerify = false;
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text: 'Create Profile',
                                                options: FFButtonOptions(
                                                  width: 275,
                                                  height: 45,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(24, 0, 24, 0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  color: const Color(0xFFB928B8),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 5,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, -1),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/logo-1.png',
                                      width: 110,
                                      height: 116,
                                      fit: BoxFit.fitWidth,
                                      alignment: const Alignment(0, 0),
                                    ),
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
      ),
    );
  }
}
