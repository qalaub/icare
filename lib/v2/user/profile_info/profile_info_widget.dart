import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import '/v2/user/descripcion_profesional/descripcion_profesional_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'profile_info_model.dart';
export 'profile_info_model.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({
    super.key,
    required this.professional,
  });

  final DocumentReference? professional;

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  late ProfileInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileInfoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.professional?.id,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> profileInfoUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final profileInfoUsersRecord = profileInfoUsersRecordList.isNotEmpty
            ? profileInfoUsersRecordList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: const Color(0xFFFEC0FB),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
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
              title: Text(
                'Profile',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 24,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    borderRadius: 24,
                    borderWidth: 1,
                    buttonSize: 40,
                    icon: Icon(
                      Icons.share_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                    onPressed: () async {
                      _model.currentPageLink = await generateCurrentPageLink(
                        context,
                        title: 'Meet This Professional: A True Standout!',
                        imageUrl: profileInfoUsersRecord?.photoUrl != null &&
                                profileInfoUsersRecord?.photoUrl != ''
                            ? profileInfoUsersRecord?.photoUrl
                            : 'https://i.ibb.co/2qkDLKb/Frame-74.png',
                        description:
                            'Discover a professional who makes a difference.',
                      );

                      await Share.share(
                        _model.currentPageLink,
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if ((currentUserDocument?.favorites.toList() ?? [])
                                  .contains(widget.professional) ==
                              true)
                            AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.chatRef = await queryChatsRecordOnce(
                                    queryBuilder: (chatsRecord) =>
                                        chatsRecord.where(
                                      'users',
                                      arrayContains: currentUserReference,
                                    ),
                                  );

                                  context.pushNamed(
                                    'chat_2_Details',
                                    queryParameters: {
                                      'chatRef': serializeParam(
                                        _model.chatRef
                                            ?.where((e) =>
                                                (e.users.contains(
                                                        widget.professional) ==
                                                    true) &&
                                                e.users.contains(
                                                    currentUserReference))
                                            .toList()
                                            .first,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatRef': _model.chatRef
                                          ?.where((e) =>
                                              (e.users.contains(
                                                      widget.professional) ==
                                                  true) &&
                                              e.users.contains(
                                                  currentUserReference))
                                          .toList()
                                          .first,
                                    },
                                  );

                                  safeSetState(() {});
                                },
                                child: const Icon(
                                  FFIcons.kmessage,
                                  color: Colors.black,
                                  size: 33,
                                ),
                              ),
                            ),
                          Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                              child: wrapWithModel(
                                model: _model.addFavoritesModel,
                                updateCallback: () => safeSetState(() {}),
                                child: AddFavoritesWidget(
                                  professional: profileInfoUsersRecord!,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xDFF428EB),
                                ),
                                child: Opacity(
                                  opacity: 0.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          const Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          const Duration(milliseconds: 500),
                                      imageUrl: valueOrDefault<String>(
                                        profileInfoUsersRecord.photoUrl,
                                        'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                      ),
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(22),
                                          bottomRight: Radius.circular(22),
                                          topLeft: Radius.circular(22),
                                          topRight: Radius.circular(22),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                        ),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              const Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              const Duration(milliseconds: 500),
                                          imageUrl: valueOrDefault<String>(
                                            profileInfoUsersRecord.photoUrl,
                                            'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                          ),
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.5, 0),
                                    child: Container(
                                      width: 170,
                                      height: 120,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1, -1),
                                            child: Container(
                                              width: 161,
                                              height: 36,
                                              decoration: const BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.concatStrings(
                                                      profileInfoUsersRecord
                                                          .firtsName,
                                                      profileInfoUsersRecord
                                                          .lastName,
                                                      ' '),
                                                  'last name',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1, 0),
                                            child: Container(
                                              width: 161,
                                              height: 24,
                                              decoration: const BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  profileInfoUsersRecord
                                                      .serviceType.first,
                                                  'telfer psychologist',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1, 1),
                                            child: Container(
                                              width: 161,
                                              height: 19,
                                              decoration: const BoxDecoration(),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  profileInfoUsersRecord.age,
                                                  '32 years',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(const SizedBox(height: 5))
                                            .addToStart(const SizedBox(height: 16)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0, -0.3),
                                    child: wrapWithModel(
                                      model: _model.membresiaLogoModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: MembresiaLogoWidget(
                                        width: 70,
                                        heigth: 70,
                                        professional: widget.professional!,
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 6)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      wrapWithModel(
                        model: _model.descripcionProfesionalModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DescripcionProfesionalWidget(
                          parameter1: valueOrDefault<String>(
                            profileInfoUsersRecord.description,
                            'I have worked for 5 years as a mental health nurse and care for people with attention deficit and more related disorders, I am kind and protective, I like  to help',
                          ),
                          parameter2: valueOrDefault<String>(
                            formatNumber(
                              profileInfoUsersRecord.years,
                              formatType: FormatType.custom,
                              format: '> # years',
                              locale: '',
                            ),
                            '> # years',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
