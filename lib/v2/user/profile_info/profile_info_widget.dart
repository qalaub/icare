import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/block_list/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import '/v2/user/descripcion_profesional/descripcion_profesional_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'profile_info_model.dart';
export 'profile_info_model.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({
    super.key,
    required this.professional,
  });

  final DocumentReference? professional;

  static String routeName = 'ProfileInfo';
  static String routePath = 'profileInfo';

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
                width: 50.0,
                height: 50.0,
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
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Color(0xFFB928B8),
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Profile',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontStyle,
                        ),
                  ),
                ),
                actions: [
                  Builder(
                    builder: (context) => FlutterFlowIconButton(
                      key: ValueKey('share'),
                      borderRadius: 24.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.share_rounded,
                        color: Colors.white,
                        size: 24.0,
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
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
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
                                      Chat2DetailsWidget.routeName,
                                      queryParameters: {
                                        'chatRef': serializeParam(
                                          _model.chatRef
                                              ?.where((e) =>
                                                  (e.users.contains(widget
                                                          .professional) ==
                                                      true) &&
                                                  e.users.contains(
                                                      currentUserReference))
                                              .toList()
                                              .firstOrNull,
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
                                            .firstOrNull,
                                      },
                                    );

                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    key: ValueKey('message'),
                                    FFIcons.kmessage,
                                    color: Colors.white,
                                    size: 33.0,
                                  ),
                                ),
                              ),
                            if ((currentUserDocument?.rol !=
                                    Roles.profesional) &&
                                (currentUserDocument?.rol != Roles.business))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.addFavoritesModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: AddFavoritesWidget(
                                        key: ValueKey('favorite'),
                                        professional: profileInfoUsersRecord!,
                                      ),
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
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0EAEA),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 250.0,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xDFF428EB),
                                  ),
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            Duration(milliseconds: 500),
                                        imageUrl: valueOrDefault<String>(
                                          profileInfoUsersRecord?.photoUrl,
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
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(22.0),
                                            bottomRight: Radius.circular(22.0),
                                            topLeft: Radius.circular(22.0),
                                            topRight: Radius.circular(22.0),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(32.0),
                                            bottomRight: Radius.circular(32.0),
                                            topLeft: Radius.circular(32.0),
                                            topRight: Radius.circular(32.0),
                                          ),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: valueOrDefault<String>(
                                              profileInfoUsersRecord?.photoUrl,
                                              'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                            ),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.5, 0.0),
                                      child: Container(
                                        width: 200.0,
                                        height: 166.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  functions.upperCaseFirstLetter(
                                                      profileInfoUsersRecord
                                                                  ?.rol ==
                                                              Roles.business
                                                          ? profileInfoUsersRecord!
                                                              .comapny
                                                          : valueOrDefault<
                                                              String>(
                                                              functions.concatStrings(
                                                                  profileInfoUsersRecord
                                                                      ?.firtsName,
                                                                  profileInfoUsersRecord
                                                                      ?.lastName,
                                                                  ' '),
                                                              'last name',
                                                            )),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Container(
                                                width: 161.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  profileInfoUsersRecord!
                                                      .serviceType.firstOrNull!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if ((profileInfoUsersRecord.rol !=
                                                    Roles.profesional) ||
                                                (profileInfoUsersRecord.rol !=
                                                    Roles.business))
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<ReviewsRecord>>(
                                                  stream: queryReviewsRecord(
                                                    queryBuilder:
                                                        (reviewsRecord) =>
                                                            reviewsRecord.where(
                                                      'professional',
                                                      isEqualTo:
                                                          widget.professional,
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<ReviewsRecord>
                                                        containerReviewsRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: 292.3,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  child: RatingBar
                                                                      .builder(
                                                                    onRatingUpdate:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.ratingBarValue =
                                                                              newValue);
                                                                      if (loggedIn) {
                                                                        _model.chatsR =
                                                                            await queryChatsRecordOnce(
                                                                          queryBuilder: (chatsRecord) => chatsRecord
                                                                              .where(
                                                                                'user_a',
                                                                                isEqualTo: currentUserReference,
                                                                              )
                                                                              .where(
                                                                                'user_b',
                                                                                isEqualTo: widget.professional,
                                                                              ),
                                                                          singleRecord:
                                                                              true,
                                                                        ).then((s) =>
                                                                                s.firstOrNull);
                                                                        if (_model.chatsR?.reference !=
                                                                            null) {
                                                                          _model.chatsM =
                                                                              await queryChatMessagesRecordOnce(
                                                                            queryBuilder: (chatMessagesRecord) => chatMessagesRecord
                                                                                .where(
                                                                                  'chat',
                                                                                  isEqualTo: _model.chatsR?.reference,
                                                                                )
                                                                                .where(
                                                                                  'user',
                                                                                  isEqualTo: widget.professional,
                                                                                ),
                                                                            limit:
                                                                                5,
                                                                          );
                                                                          if (((_model.chatsM != null && (_model.chatsM)!.isNotEmpty) == true) &&
                                                                              (_model.chatsM!.length > 0)) {
                                                                            _model.reviewsC =
                                                                                await queryReviewsRecordOnce(
                                                                              queryBuilder: (reviewsRecord) => reviewsRecord
                                                                                  .where(
                                                                                    'participant',
                                                                                    isEqualTo: currentUserReference,
                                                                                  )
                                                                                  .where(
                                                                                    'professional',
                                                                                    isEqualTo: widget.professional,
                                                                                  ),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            if (_model.reviewsC?.reference !=
                                                                                null) {
                                                                              await _model.reviewsC!.reference.update(createReviewsRecordData(
                                                                                num: _model.ratingBarValue?.round(),
                                                                              ));
                                                                            } else {
                                                                              await ReviewsRecord.collection.doc().set(createReviewsRecordData(
                                                                                    num: _model.ratingBarValue?.round(),
                                                                                    professional: widget.professional,
                                                                                    participant: currentUserReference,
                                                                                  ));
                                                                            }
                                                                          } else {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'You should first interact with the professional.',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: Color(0xFFD239B4),
                                                                              ),
                                                                            );
                                                                          }
                                                                        } else {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'You should first interact with the professional.',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: Color(0xFFD239B4),
                                                                            ),
                                                                          );
                                                                        }
                                                                      } else {
                                                                        context.pushNamed(
                                                                            LoginWidget.routeName);
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rate,
                                                                      color: Color(
                                                                          0xFFF9BF11),
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    initialRating: _model
                                                                            .ratingBarValue ??=
                                                                        valueOrDefault<
                                                                            double>(
                                                                      functions
                                                                          .averagueReviews(
                                                                              containerReviewsRecordList.toList())
                                                                          .toDouble(),
                                                                      0.0,
                                                                    ),
                                                                    unratedColor:
                                                                        Color(
                                                                            0x4D040202),
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        30.0,
                                                                    glowColor:
                                                                        Color(
                                                                            0xFFF9BF11),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.concatStrings(
                                                                    '(',
                                                                    ')',
                                                                    containerReviewsRecordList
                                                                        .length
                                                                        .toString()),
                                                                '(1278)',
                                                              ),
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
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14.0,
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
                                                        ].divide(SizedBox(
                                                            width: 2.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                          ].addToStart(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.membresiaLogoModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: MembresiaLogoWidget(
                                            width: 48,
                                            heigth: 70,
                                            professional: widget.professional!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        wrapWithModel(
                          model: _model.descripcionProfesionalModel,
                          updateCallback: () => safeSetState(() {}),
                          child: DescripcionProfesionalWidget(
                            parameter1: profileInfoUsersRecord.description,
                            parameter2: valueOrDefault<String>(
                              formatNumber(
                                profileInfoUsersRecord.years,
                                formatType: FormatType.custom,
                                format: '# years',
                                locale: '',
                              ),
                              '> # years',
                            ),
                            video: valueOrDefault<String>(
                              profileInfoUsersRecord.video,
                              'https://assets.mixkit.co/videos/51585/51585-720.mp4',
                            ),
                            services: profileInfoUsersRecord.serviceType,
                            imgs: profileInfoUsersRecord.images,
                            company:
                                (profileInfoUsersRecord.business != null) ||
                                        (profileInfoUsersRecord.rol ==
                                            Roles.business)
                                    ? profileInfoUsersRecord.comapny
                                    : 'default230',
                            morning: profileInfoUsersRecord.morning,
                            noon: profileInfoUsersRecord.noon,
                            afternoon: profileInfoUsersRecord.afternoon,
                            abn: profileInfoUsersRecord.abn,
                            ndis: profileInfoUsersRecord.ndis,
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 32.0)),
                    ),
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
