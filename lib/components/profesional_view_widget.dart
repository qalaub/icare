import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profesional_view_model.dart';
export 'profesional_view_model.dart';

class ProfesionalViewWidget extends StatefulWidget {
  const ProfesionalViewWidget({super.key});

  @override
  State<ProfesionalViewWidget> createState() => _ProfesionalViewWidgetState();
}

class _ProfesionalViewWidgetState extends State<ProfesionalViewWidget> {
  late ProfesionalViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfesionalViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0),
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
          width: 321,
          height: 210,
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/909/600',
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
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
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Text(
                        'Migues Reyes Smit',
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.06, -0.32),
                  child: Container(
                    width: 139,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFCCF9),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                      child: Text(
                        '32 years',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 11,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0.6),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Container(
                      width: double.infinity,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1, -1),
                              child: Text(
                                'I met Dylan and I understood the meaning of understanding. He is a very protective and kind person who helped me socialize more with the people around me and the conversations are comfortable.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.06, -0.52),
                  child: Container(
                    width: 139,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFCCF9),
                    ),
                    child: Text(
                      'telfer psychologist',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 11,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.88, 0.85),
                  child: Container(
                    width: 139,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFCCF9),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                      child: Text(
                        'MARCH 1, 2024',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 11,
                              letterSpacing: 0.0,
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
    );
  }
}
