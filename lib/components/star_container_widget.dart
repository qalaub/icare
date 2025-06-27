import '/backend/backend.dart';
import '/components/estrellas_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'star_container_model.dart';
export 'star_container_model.dart';

class StarContainerWidget extends StatefulWidget {
  const StarContainerWidget({
    super.key,
    this.parameter1,
    required this.parameter2,
    bool? parameter3,
    this.parameter4,
  }) : this.parameter3 = parameter3 ?? false;

  final List<ReviewsRecord>? parameter1;
  final DocumentReference? parameter2;
  final bool parameter3;
  final int? parameter4;

  @override
  State<StarContainerWidget> createState() => _StarContainerWidgetState();
}

class _StarContainerWidgetState extends State<StarContainerWidget> {
  late StarContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StarContainerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
        child: StreamBuilder<List<ReviewsRecord>>(
          stream: queryReviewsRecord(
            queryBuilder: (reviewsRecord) => reviewsRecord.where(
              'professional',
              isEqualTo: widget.parameter2,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<ReviewsRecord> containerReviewsRecordList = snapshot.data!;

            return Container(
              decoration: BoxDecoration(),
              child: wrapWithModel(
                model: _model.estrellasModel,
                updateCallback: () => safeSetState(() {}),
                child: EstrellasWidget(
                  parameter1: containerReviewsRecordList,
                  parameter2: widget.parameter2!,
                  parameter3: widget.parameter3,
                  parameter4: valueOrDefault<int>(
                    containerReviewsRecordList.length,
                    1278,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
