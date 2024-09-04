import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      alignment: const AlignmentDirectional(0, 0),
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
                  widget.profesionalId?.reference,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          }
        },
        child: Material(
          color: Colors.transparent,
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Container(
            width: 285,
            height: 139,
            decoration: const BoxDecoration(
              color: Color(0xFFFFCCF9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Align(
              alignment: const AlignmentDirectional(-1, -1),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1, -1),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                      child: Container(
                        width: 61,
                        height: 61,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          border: Border.all(
                            color: const Color(0xFFD9D9D9),
                          ),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(-1, 1),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeOutDuration: const Duration(milliseconds: 500),
                              imageUrl: valueOrDefault<String>(
                                widget.profesionalId?.photoUrl,
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
                    alignment: const AlignmentDirectional(0.06, -1.23),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Container(
                        width: 139,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFCCF9),
                        ),
                        child: Text(
                          valueOrDefault<String>(
                            widget.profesionalId?.firtsName,
                            'e',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1, -1),
                    child: wrapWithModel(
                      model: _model.addFavoritesModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AddFavoritesWidget(
                        professional: widget.profesionalId!,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.74, -0.19),
                    child: wrapWithModel(
                      model: _model.membresiaLogoModel,
                      updateCallback: () => safeSetState(() {}),
                      child: MembresiaLogoWidget(
                        professional: widget.profesionalId!.reference,
                        width: 40,
                        heigth: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.05, -0.19),
                    child: Container(
                      width: 139,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(3, 2, 0, 0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.profesionalId?.serviceType.first,
                            'e',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 11,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.09, -0.02),
                    child: Container(
                      width: 150,
                      height: 1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.09, 0.52),
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-0.03, 0.18),
                            child: Container(
                              width: 150,
                              height: 16,
                              decoration: const BoxDecoration(),
                              child: Stack(
                                children: [
                                  const Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Icon(
                                      Icons.business_center_outlined,
                                      color: Color(0xFF0E70DF),
                                      size: 14,
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Text(
                                        'Experience',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              fontSize: 11,
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
                            alignment: const AlignmentDirectional(-0.17, 0.1),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: 150,
                                height: 16,
                                decoration: const BoxDecoration(),
                                child: Stack(
                                  children: [
                                    const Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 3),
                                        child: Icon(
                                          Icons.edit_document,
                                          color: Color(0xFF0E70DF),
                                          size: 13,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Text(
                                          'Qualified And Certified \npersonnel',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 10,
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
                            .divide(const SizedBox(height: 0))
                            .addToStart(const SizedBox(height: 3)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.29, 1.05),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) => safeSetState(
                            () => _model.ratingBarValue = newValue),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star_rate,
                          color: Color(0xFFF9BF11),
                        ),
                        direction: Axis.horizontal,
                        initialRating: _model.ratingBarValue ??= 3,
                        unratedColor: const Color(0x4D040202),
                        itemCount: 5,
                        itemSize: 15,
                        glowColor: const Color(0xFFF9BF11),
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
