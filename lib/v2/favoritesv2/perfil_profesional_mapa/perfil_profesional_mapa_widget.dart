import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'perfil_profesional_mapa_model.dart';
export 'perfil_profesional_mapa_model.dart';

class PerfilProfesionalMapaWidget extends StatefulWidget {
  const PerfilProfesionalMapaWidget({
    super.key,
    required this.profesionalId,
  });

  final UsersRecord? profesionalId;

  @override
  State<PerfilProfesionalMapaWidget> createState() =>
      _PerfilProfesionalMapaWidgetState();
}

class _PerfilProfesionalMapaWidgetState
    extends State<PerfilProfesionalMapaWidget> {
  late PerfilProfesionalMapaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilProfesionalMapaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (!FFAppState().authUserFireBase) {
            context.pushNamed('Login');
          } else {
            context.pushNamed(
              'profile_info',
              queryParameters: {
                'professional': serializeParam(
                  widget!.profesionalId?.reference,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          }
        },
        child: Material(
          color: Colors.transparent,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Container(
            width: 285.0,
            height: 139.0,
            decoration: BoxDecoration(
              color: Color(0xFFFFCCF9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 0.0),
                      child: Container(
                        width: 61.0,
                        height: 61.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          border: Border.all(
                            color: Color(0xFFD9D9D9),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 500),
                              fadeOutDuration: Duration(milliseconds: 500),
                              imageUrl: valueOrDefault<String>(
                                widget!.profesionalId?.photoUrl,
                                'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                              ),
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.06, -1.23),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Container(
                        width: 139.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFCCF9),
                        ),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.profesionalId?.firtsName,
                            'e',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Montserrat',
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: wrapWithModel(
                      model: _model.addFavoritesModel,
                      updateCallback: () => setState(() {}),
                      child: AddFavoritesWidget(
                        professional: widget!.profesionalId!,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.74, -0.19),
                    child: wrapWithModel(
                      model: _model.membresiaLogoModel,
                      updateCallback: () => setState(() {}),
                      child: MembresiaLogoWidget(
                        professional: widget!.profesionalId!.reference,
                        width: 40,
                        heigth: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.05, -0.19),
                    child: Container(
                      width: 139.0,
                      height: 18.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(3.0, 2.0, 0.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.profesionalId?.serviceType?.first,
                            'e',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.09, -0.02),
                    child: Container(
                      width: 150.0,
                      height: 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.09, 0.52),
                    child: Container(
                      width: 150.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.03, 0.18),
                            child: Container(
                              width: 150.0,
                              height: 16.0,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Icon(
                                      Icons.business_center_outlined,
                                      color: Color(0xFF0E70DF),
                                      size: 14.0,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Experience',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.17, 0.1),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: 150.0,
                                height: 16.0,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 3.0),
                                        child: Icon(
                                          Icons.edit_document,
                                          color: Color(0xFF0E70DF),
                                          size: 13.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Qualified And Certified \npersonnel',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 0.0))
                            .addToStart(SizedBox(height: 3.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.29, 1.05),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) =>
                            setState(() => _model.ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rate,
                          color: Color(0xFFF9BF11),
                        ),
                        direction: Axis.horizontal,
                        initialRating: _model.ratingBarValue ??= 3.0,
                        unratedColor: Color(0x4D040202),
                        itemCount: 5,
                        itemSize: 15.0,
                        glowColor: Color(0xFFF9BF11),
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
  }
}
