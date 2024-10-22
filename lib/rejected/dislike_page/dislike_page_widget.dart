import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/rejected/user_skip/user_skip_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dislike_page_model.dart';
export 'dislike_page_model.dart';

class DislikePageWidget extends StatefulWidget {
  const DislikePageWidget({super.key});

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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFFBD39BA),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const FaIcon(
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
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if ((currentUserDocument?.dontShow.toList() ?? []).isNotEmpty)
                AuthUserStreamWidget(
                  builder: (context) => Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Builder(
                      builder: (context) {
                        final usersSkip =
                            (currentUserDocument?.dontShow.toList() ?? [])
                                .toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: usersSkip.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 1.0),
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
