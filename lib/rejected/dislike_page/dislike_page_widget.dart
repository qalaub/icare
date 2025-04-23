import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/rejected/user_skip/user_skip_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dislike_page_model.dart';
export 'dislike_page_model.dart';

class DislikePageWidget extends StatefulWidget {
  const DislikePageWidget({super.key});

  static String routeName = 'DislikePage';
  static String routePath = 'dislikePage';

  @override
  State<DislikePageWidget> createState() => _DislikePageWidgetState();
}

class _DislikePageWidgetState extends State<DislikePageWidget> {
  late DislikePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DislikePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFBD39BA),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Rejected list',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if ((currentUserDocument?.dontShow.toList() ?? []).length > 0)
                AuthUserStreamWidget(
                  builder: (context) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Builder(
                      builder: (context) {
                        final usersSkip = functions
                            .reverseArray(
                                (currentUserDocument?.dontShow.toList() ?? [])
                                    .toList())
                            .toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: usersSkip.length,
                          separatorBuilder: (_, __) => SizedBox(height: 1.0),
                          itemBuilder: (context, usersSkipIndex) {
                            final usersSkipItem = usersSkip[usersSkipIndex];
                            return UserSkipWidget(
                              key: Key(
                                  'Key0io_${usersSkipIndex}_of_${usersSkip.length}'),
                              ref: usersSkipItem,
                            );
                          },
                        );
                      },
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
