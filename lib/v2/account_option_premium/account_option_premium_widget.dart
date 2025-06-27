import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'account_option_premium_model.dart';
export 'account_option_premium_model.dart';

class AccountOptionPremiumWidget extends StatefulWidget {
  const AccountOptionPremiumWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final Widget? icon;
  final String? text;

  @override
  State<AccountOptionPremiumWidget> createState() =>
      _AccountOptionPremiumWidgetState();
}

class _AccountOptionPremiumWidgetState
    extends State<AccountOptionPremiumWidget> {
  late AccountOptionPremiumModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountOptionPremiumModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 52.0,
      decoration: BoxDecoration(
        color: Color(0xFFFFA4DF),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.icon!,
          Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            decoration: BoxDecoration(),
            child: Text(
              valueOrDefault<String>(
                widget.text,
                'text',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF57636C),
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
