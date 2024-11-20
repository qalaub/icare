import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'estrellas_model.dart';
export 'estrellas_model.dart';

class EstrellasWidget extends StatefulWidget {
  const EstrellasWidget({
    super.key,
    this.parameter1,
    required this.parameter2,
    bool? parameter3,
    this.parameter4,
  }) : parameter3 = parameter3 ?? false;

  final List<ReviewsRecord>? parameter1;
  final DocumentReference? parameter2;
  final bool parameter3;
  final int? parameter4;

  @override
  State<EstrellasWidget> createState() => _EstrellasWidgetState();
}

class _EstrellasWidgetState extends State<EstrellasWidget> {
  late EstrellasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstrellasModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(-1.0, 0.0),
          child: Builder(
            builder: (context) {
              if (widget.parameter3) {
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: RatingBar.builder(
                    onRatingUpdate: (newValue) async {
                      safeSetState(() => _model.ratingBarValue1 = newValue);
                      if (loggedIn) {
                        _model.chatsR = await queryChatsRecordOnce(
                          queryBuilder: (chatsRecord) => chatsRecord
                              .where(
                                'user_a',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'user_b',
                                isEqualTo: widget.parameter2,
                              ),
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        if (_model.chatsR?.reference != null) {
                          _model.chatsM = await queryChatMessagesRecordOnce(
                            queryBuilder: (chatMessagesRecord) =>
                                chatMessagesRecord
                                    .where(
                                      'chat',
                                      isEqualTo: _model.chatsR?.reference,
                                    )
                                    .where(
                                      'user',
                                      isEqualTo: widget.parameter2,
                                    ),
                            limit: 5,
                          );
                          if (((_model.chatsM != null &&
                                      (_model.chatsM)!.isNotEmpty) ==
                                  true) &&
                              (_model.chatsM!.isNotEmpty)) {
                            _model.reviewsC = await queryReviewsRecordOnce(
                              queryBuilder: (reviewsRecord) => reviewsRecord
                                  .where(
                                    'participant',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'professional',
                                    isEqualTo: widget.parameter2,
                                  ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (_model.reviewsC?.reference != null) {
                              await _model.reviewsC!.reference
                                  .update(createReviewsRecordData(
                                num: _model.ratingBarValue1?.round(),
                              ));
                            } else {
                              await ReviewsRecord.collection
                                  .doc()
                                  .set(createReviewsRecordData(
                                    num: _model.ratingBarValue1?.round(),
                                    professional: widget.parameter2,
                                    participant: currentUserReference,
                                  ));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'You should first interact with the professional.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor: const Color(0xFFD239B4),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You should first interact with the professional.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor: const Color(0xFFD239B4),
                            ),
                          );
                        }
                      } else {
                        context.pushNamed('Login');
                      }

                      safeSetState(() {});
                    },
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_rate,
                      color: Color(0xFFF9BF11),
                    ),
                    direction: Axis.horizontal,
                    initialRating: _model.ratingBarValue1 ??=
                        valueOrDefault<double>(
                      functions
                          .averagueReviews(widget.parameter1!.toList())
                          .toDouble(),
                      0.0,
                    ),
                    unratedColor: const Color(0x4D040202),
                    itemCount: 5,
                    itemSize: 12.0,
                    glowColor: const Color(0xFFF9BF11),
                  ),
                );
              } else {
                return RatingBarIndicator(
                  itemBuilder: (context, index) => const Icon(
                    Icons.star_rate,
                    color: Color(0xFFF9BF11),
                  ),
                  direction: Axis.horizontal,
                  rating: valueOrDefault<double>(
                    functions
                        .averagueReviews(widget.parameter1!.toList())
                        .toDouble(),
                    0.0,
                  ),
                  unratedColor: const Color(0x4D040202),
                  itemCount: 5,
                  itemSize: 12.0,
                );
              }
            },
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, -0.7),
          child: Text(
            valueOrDefault<String>(
              functions.concatStrings('(', ')', widget.parameter4?.toString()),
              '(1278)',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 11.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
