import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_user2_model.dart';
export 'register_user2_model.dart';

class RegisterUser2Widget extends StatefulWidget {
  const RegisterUser2Widget({super.key});

  @override
  State<RegisterUser2Widget> createState() => _RegisterUser2WidgetState();
}

class _RegisterUser2WidgetState extends State<RegisterUser2Widget>
    with TickerProviderStateMixin {
  late RegisterUser2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterUser2Model());

    _model.ndisTextController ??= TextEditingController();
    _model.ndisFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confirmPasswordTextController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -11.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -11.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -11.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -11.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  height: 100.0,
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
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/escoger-users.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/logo-1.png',
                                  width: 110.0,
                                  height: 106.0,
                                  fit: BoxFit.fitWidth,
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
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 74.0, 0.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.96,
                                  height: 604.0,
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
                                  child: Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Text(
                                                'Create Account',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFF8E058A),
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 327.0,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF0DFEF),
                                                border: Border.all(
                                                  color: Color(0xFFF0DFEF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.84, -0.73),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                'NDIS Participant Number',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.01, -0.69),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFFFEFE),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.ndisTextController,
                                                  focusNode:
                                                      _model.ndisFocusNode,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        'Enter your NDIS  (XXXXXXXXX)',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    errorStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFBB33B9),
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFF762075),
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 0.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  maxLines: null,
                                                  maxLength: 15,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  validator: _model
                                                      .ndisTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.84, -0.73),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                '* Email Address',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.01, -0.69),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: 70.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFFFEFE),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12.0),
                                                  bottomRight:
                                                      Radius.circular(12.0),
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .emailTextController,
                                                      focusNode:
                                                          _model.emailFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.emailTextController',
                                                        Duration(
                                                            milliseconds: 10),
                                                        () async {
                                                          _model.emailExists =
                                                              await queryUsersRecordCount(
                                                            queryBuilder:
                                                                (usersRecord) =>
                                                                    usersRecord
                                                                        .where(
                                                              'email',
                                                              isEqualTo: _model
                                                                  .emailTextController
                                                                  .text,
                                                            ),
                                                          );

                                                          setState(() {});
                                                        },
                                                      ),
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFFBB33B9),
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF762075),
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                          ),
                                                      maxLines: null,
                                                      validator: _model
                                                          .emailTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  if ((_model.emailExists !=
                                                          null) &&
                                                      (_model.emailExists! > 0))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.2),
                                                      child: Text(
                                                        'This email already has an account, use another email',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFFFF5963),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textOnPageLoadAnimation1']!),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.84, -0.73),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                '* Type Of Disability',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              height: 90.0,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.8,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                          border: Border.all(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              FFAppState()
                                                                          .verifyForm
                                                                          .dropdown ==
                                                                      true
                                                                  ? Color(
                                                                      0xFFBB33B9)
                                                                  : Color(
                                                                      0xFFFF5963),
                                                              Color(0xFFBB33B9),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            multiSelectController: _model
                                                                    .dropDownValueController ??=
                                                                FormListFieldController<
                                                                        String>(
                                                                    null),
                                                            options: [
                                                              'Autism',
                                                              'Behavioural\nEarly Intervention',
                                                              'Chronic Medical Conditions',
                                                              'Hearing Loss',
                                                              'Intellectual/Development',
                                                              'Neurological ',
                                                              'Physical ',
                                                              'Psychosocial/Mental Health',
                                                              'Vision Impairment '
                                                            ],
                                                            width: 261.0,
                                                            height: 56.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Type Of Disability',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color:
                                                                  Colors.black,
                                                              size: 24.0,
                                                            ),
                                                            fillColor:
                                                                Colors.white,
                                                            elevation: 2.0,
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderWidth: 0.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    0.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: true,
                                                            isSearchable: false,
                                                            isMultiSelect: true,
                                                            onMultiSelectChanged:
                                                                (val) => setState(
                                                                    () => _model
                                                                            .dropDownValue =
                                                                        val),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (!FFAppState()
                                                                  .verifyForm
                                                                  .dropdown &&
                                                              (FFAppState()
                                                                      .counter >
                                                                  2)) {
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.62,
                                                                      1.0),
                                                              child: Text(
                                                                'Field is required',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFFFF5963),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'textOnPageLoadAnimation2']!),
                                                            );
                                                          } else {
                                                            return Text(
                                                              ' ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.84, -0.73),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                '* Password',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: 90.0,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .passwordTextController,
                                                        focusNode: _model
                                                            .passwordFocusNode,
                                                        autofocus: true,
                                                        obscureText: !_model
                                                            .passwordVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText:
                                                              'Example:  Carlos123@',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          errorStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFBB33B9),
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFF762075),
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () => _model
                                                                      .passwordVisibility =
                                                                  !_model
                                                                      .passwordVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.passwordVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: Color(
                                                                  0xFF6D6D6D),
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color:
                                                                  Colors.black,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .passwordTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (!valueOrDefault<
                                                                  bool>(
                                                                FFAppState()
                                                                    .verifyForm
                                                                    .same,
                                                                true,
                                                              ) &&
                                                              (FFAppState()
                                                                      .counter >
                                                                  2)) {
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.82,
                                                                      1.0),
                                                              child: Text(
                                                                !FFAppState()
                                                                            .verifyForm
                                                                            .same &&
                                                                        (functions.verifyCorrectPassword(_model.passwordTextController.text) ==
                                                                            true)
                                                                    ? 'Password has to be the same'
                                                                    : ' ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFFFF5963),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'textOnPageLoadAnimation3']!),
                                                            );
                                                          } else {
                                                            return Text(
                                                              ' ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.84, -0.73),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                '* Confirm Password',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: 90.0,
                                              decoration: BoxDecoration(),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .confirmPasswordTextController,
                                                        focusNode: _model
                                                            .confirmPasswordFocusNode,
                                                        autofocus: true,
                                                        obscureText: !_model
                                                            .confirmPasswordVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText:
                                                              'Example:  Carlos123@',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          errorStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFBB33B9),
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFF762075),
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 0.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () => _model
                                                                      .confirmPasswordVisibility =
                                                                  !_model
                                                                      .confirmPasswordVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.confirmPasswordVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: Color(
                                                                  0xFF6D6D6D),
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color:
                                                                  Colors.black,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        validator: _model
                                                            .confirmPasswordTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (!valueOrDefault<
                                                                  bool>(
                                                                FFAppState()
                                                                    .verifyForm
                                                                    .same,
                                                                true,
                                                              ) &&
                                                              (FFAppState()
                                                                      .counter >
                                                                  2)) {
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.82,
                                                                      1.0),
                                                              child: Text(
                                                                !FFAppState()
                                                                            .verifyForm
                                                                            .same &&
                                                                        (functions.verifyCorrectPassword(_model.confirmPasswordTextController.text) ==
                                                                            true)
                                                                    ? 'Password has to be the same'
                                                                    : ' ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFFFF5963),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'textOnPageLoadAnimation4']!),
                                                            );
                                                          } else {
                                                            return Text(
                                                              ' ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: Container(
                                                width: 327.0,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState()
                                                    .updateVerifyFormStruct(
                                                  (e) => e
                                                    ..dropdown = _model
                                                            .dropDownValue!
                                                            .length >
                                                        0
                                                    ..confirm1 = _model
                                                                .passwordTextController
                                                                .text !=
                                                            null &&
                                                        _model.passwordTextController
                                                                .text !=
                                                            ''
                                                    ..confirm2 = _model
                                                                .confirmPasswordTextController
                                                                .text !=
                                                            null &&
                                                        _model.confirmPasswordTextController
                                                                .text !=
                                                            ''
                                                    ..same = _model
                                                            .passwordTextController
                                                            .text ==
                                                        _model
                                                            .confirmPasswordTextController
                                                            .text,
                                                );
                                                FFAppState().counter = 4;
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                if (_model.dropDownValue ==
                                                    null) {
                                                  return;
                                                }
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e
                                                    ..password = _model
                                                        .passwordTextController
                                                        .text
                                                    ..ndis = valueOrDefault(
                                                        currentUserDocument
                                                            ?.ndis,
                                                        '')
                                                    ..email = _model
                                                        .emailTextController
                                                        .text
                                                    ..disabilities = _model
                                                        .dropDownValue!
                                                        .toList(),
                                                );
                                                if (FFAppState()
                                                        .verifyForm
                                                        .same ==
                                                    true) {
                                                  FFAppState().verifyForm =
                                                      FormVerifyStruct();
                                                  FFAppState().counter = 0;
                                                  FFAppState()
                                                      .updateRegisterProviderFormStruct(
                                                    (e) => e
                                                      ..rol = Roles.user
                                                      ..plan = Plan.basic,
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
                                                        'serviceType': FFAppState()
                                                            .registerProviderForm
                                                            .serviceType,
                                                        'disabilities': FFAppState()
                                                            .registerProviderForm
                                                            .disabilities,
                                                      },
                                                    ),
                                                  });

                                                  FFAppState()
                                                      .authUserFireBase = true;

                                                  context.pushNamedAuth(
                                                    'HomeSearch',
                                                    context.mounted,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 200),
                                                      ),
                                                    },
                                                  );
                                                }
                                              },
                                              text: 'Create',
                                              options: FFButtonOptions(
                                                width: 275.0,
                                                height: 45.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFB928B8),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
