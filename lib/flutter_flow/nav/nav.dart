import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: RootPageContext.wrap(
          appStateNotifier.loggedIn ? HomeSearchWidget() : Pantainci1Widget(),
          errorRoute: state.uri.toString(),
        ),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? HomeSearchWidget() : Pantainci1Widget(),
          ),
          routes: [
            FFRoute(
              name: HomeSearchWidget.routeName,
              path: HomeSearchWidget.routePath,
              builder: (context, params) => HomeSearchWidget(
                currentLatLng: params.getParam<LatLng>(
                  'currentLatLng',
                  ParamType.LatLng,
                  isList: true,
                ),
                authUser: params.getParam(
                  'authUser',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: FiltrosWidget.routeName,
              path: FiltrosWidget.routePath,
              builder: (context, params) => FiltrosWidget(),
            ),
            FFRoute(
              name: RegisterUser1Widget.routeName,
              path: RegisterUser1Widget.routePath,
              builder: (context, params) => RegisterUser1Widget(),
            ),
            FFRoute(
              name: RegisterUser2Widget.routeName,
              path: RegisterUser2Widget.routePath,
              builder: (context, params) => RegisterUser2Widget(),
            ),
            FFRoute(
              name: RegisterProfessional1Widget.routeName,
              path: RegisterProfessional1Widget.routePath,
              builder: (context, params) => RegisterProfessional1Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: RegisterProfessional2Widget.routeName,
              path: RegisterProfessional2Widget.routePath,
              builder: (context, params) => RegisterProfessional2Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: LoginWidget.routeName,
              path: LoginWidget.routePath,
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: EscogerUsuarioWidget.routeName,
              path: EscogerUsuarioWidget.routePath,
              builder: (context, params) => EscogerUsuarioWidget(),
            ),
            FFRoute(
              name: UserprofileWidget.routeName,
              path: UserprofileWidget.routePath,
              requireAuth: true,
              builder: (context, params) => UserprofileWidget(),
            ),
            FFRoute(
              name: Chat2DetailsWidget.routeName,
              path: Chat2DetailsWidget.routePath,
              requireAuth: true,
              asyncParams: {
                'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => Chat2DetailsWidget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.Document,
                ),
                chatRefTotal: params.getParam(
                  'chatRefTotal',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chats'],
                ),
                professional: params.getParam(
                  'professional',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: Chat2MainWidget.routeName,
              path: Chat2MainWidget.routePath,
              requireAuth: true,
              builder: (context, params) => Chat2MainWidget(),
            ),
            FFRoute(
              name: ImageDetailsWidget.routeName,
              path: ImageDetailsWidget.routePath,
              asyncParams: {
                'chatMessage':
                    getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
              },
              builder: (context, params) => ImageDetailsWidget(
                chatMessage: params.getParam(
                  'chatMessage',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: SecuritySettingsWidget.routeName,
              path: SecuritySettingsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SecuritySettingsWidget(
                initialSur: params.getParam(
                  'initialSur',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ListofcollaboratorsWidget.routeName,
              path: ListofcollaboratorsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ListofcollaboratorsWidget(),
            ),
            FFRoute(
              name: ProfileInfoWidget.routeName,
              path: ProfileInfoWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfileInfoWidget(
                professional: params.getParam(
                  'professional',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: PeoplewhoputyouinfavoritesWidget.routeName,
              path: PeoplewhoputyouinfavoritesWidget.routePath,
              requireAuth: true,
              builder: (context, params) => PeoplewhoputyouinfavoritesWidget(
                authUser: params.getParam(
                  'authUser',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: PeoplewhoputyouinfavoriteBasicWidget.routeName,
              path: PeoplewhoputyouinfavoriteBasicWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  PeoplewhoputyouinfavoriteBasicWidget(),
            ),
            FFRoute(
              name: FavV2Widget.routeName,
              path: FavV2Widget.routePath,
              requireAuth: true,
              builder: (context, params) => FavV2Widget(),
            ),
            FFRoute(
              name: RegisterProfessional3Widget.routeName,
              path: RegisterProfessional3Widget.routePath,
              builder: (context, params) => RegisterProfessional3Widget(),
            ),
            FFRoute(
              name: MembresiasV2Widget.routeName,
              path: MembresiasV2Widget.routePath,
              builder: (context, params) => MembresiasV2Widget(
                professionalUpdate: params.getParam(
                  'professionalUpdate',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                currentPlan: params.getParam<Plan>(
                  'currentPlan',
                  ParamType.Enum,
                ),
                isUpdate: params.getParam(
                  'isUpdate',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: RegisterBusiness1Widget.routeName,
              path: RegisterBusiness1Widget.routePath,
              builder: (context, params) => RegisterBusiness1Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: RegisterBusiness2Widget.routeName,
              path: RegisterBusiness2Widget.routePath,
              builder: (context, params) => RegisterBusiness2Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: RegisterBusiness3Widget.routeName,
              path: RegisterBusiness3Widget.routePath,
              builder: (context, params) => RegisterBusiness3Widget(),
            ),
            FFRoute(
              name: RegisterBusiness4Widget.routeName,
              path: RegisterBusiness4Widget.routePath,
              builder: (context, params) => RegisterBusiness4Widget(),
            ),
            FFRoute(
              name: Tinderv2C1Widget.routeName,
              path: Tinderv2C1Widget.routePath,
              builder: (context, params) => Tinderv2C1Widget(),
            ),
            FFRoute(
              name: NewsWidget.routeName,
              path: NewsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NewsWidget(),
            ),
            FFRoute(
              name: BlockListWidget.routeName,
              path: BlockListWidget.routePath,
              builder: (context, params) => BlockListWidget(),
            ),
            FFRoute(
              name: StandarWidget.routeName,
              path: StandarWidget.routePath,
              builder: (context, params) => StandarWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                currentPlan: params.getParam<Plan>(
                  'currentPlan',
                  ParamType.Enum,
                ),
              ),
            ),
            FFRoute(
              name: PremiumWidget.routeName,
              path: PremiumWidget.routePath,
              builder: (context, params) => PremiumWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                currentPlan: params.getParam<Plan>(
                  'currentPlan',
                  ParamType.Enum,
                ),
                isUpdatePremiun: params.getParam(
                  'isUpdatePremiun',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: BasicWidget.routeName,
              path: BasicWidget.routePath,
              builder: (context, params) => BasicWidget(
                userRef: params.getParam(
                  'userRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                currentPlan: params.getParam<Plan>(
                  'currentPlan',
                  ParamType.Enum,
                ),
              ),
            ),
            FFRoute(
              name: MySubscriptionStandardWidget.routeName,
              path: MySubscriptionStandardWidget.routePath,
              builder: (context, params) => MySubscriptionStandardWidget(),
            ),
            FFRoute(
              name: MySubscriptionPremiumWidget.routeName,
              path: MySubscriptionPremiumWidget.routePath,
              builder: (context, params) => MySubscriptionPremiumWidget(),
            ),
            FFRoute(
              name: MySubscriptionBasicWidget.routeName,
              path: MySubscriptionBasicWidget.routePath,
              builder: (context, params) => MySubscriptionBasicWidget(),
            ),
            FFRoute(
              name: ReportWidget.routeName,
              path: ReportWidget.routePath,
              builder: (context, params) => ReportWidget(
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: HarassmentWidget.routeName,
              path: HarassmentWidget.routePath,
              builder: (context, params) => HarassmentWidget(
                report: params.getParam(
                  'report',
                  ParamType.String,
                ),
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: FavV3CopyWidget.routeName,
              path: FavV3CopyWidget.routePath,
              requireAuth: true,
              builder: (context, params) => FavV3CopyWidget(),
            ),
            FFRoute(
              name: Pantainci1Widget.routeName,
              path: Pantainci1Widget.routePath,
              builder: (context, params) => Pantainci1Widget(),
            ),
            FFRoute(
              name: RegisterPfofesional4Widget.routeName,
              path: RegisterPfofesional4Widget.routePath,
              builder: (context, params) => RegisterPfofesional4Widget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: CuestionarioWidget.routeName,
              path: CuestionarioWidget.routePath,
              builder: (context, params) => CuestionarioWidget(),
            ),
            FFRoute(
              name: MapAumentWidget.routeName,
              path: MapAumentWidget.routePath,
              builder: (context, params) => MapAumentWidget(
                currentLatLng: params.getParam<LatLng>(
                  'currentLatLng',
                  ParamType.LatLng,
                  isList: true,
                ),
                authUser: params.getParam(
                  'authUser',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: RecuperarcontraseaWidget.routeName,
              path: RecuperarcontraseaWidget.routePath,
              builder: (context, params) => RecuperarcontraseaWidget(),
            ),
            FFRoute(
              name: DeleteaccountWidget.routeName,
              path: DeleteaccountWidget.routePath,
              builder: (context, params) => DeleteaccountWidget(),
            ),
            FFRoute(
              name: Cadari0Widget.routeName,
              path: Cadari0Widget.routePath,
              builder: (context, params) => Cadari0Widget(
                bussinesRef: params.getParam(
                  'bussinesRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                isBussines: params.getParam(
                  'isBussines',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: Chat2DetailsCopyWidget.routeName,
              path: Chat2DetailsCopyWidget.routePath,
              requireAuth: true,
              asyncParams: {
                'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => Chat2DetailsCopyWidget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.Document,
                ),
                chatRefTotal: params.getParam(
                  'chatRefTotal',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['chats'],
                ),
                professional: params.getParam(
                  'professional',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: AvatarsWidget.routeName,
              path: AvatarsWidget.routePath,
              builder: (context, params) => AvatarsWidget(
                isUpdate: params.getParam(
                  'isUpdate',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: DislikePageWidget.routeName,
              path: DislikePageWidget.routePath,
              builder: (context, params) => DislikePageWidget(),
            ),
            FFRoute(
              name: VerperfilWidget.routeName,
              path: VerperfilWidget.routePath,
              requireAuth: true,
              builder: (context, params) => VerperfilWidget(
                initialSurb: params.getParam(
                  'initialSurb',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RegisterPfofesional5Widget.routeName,
              path: RegisterPfofesional5Widget.routePath,
              builder: (context, params) => RegisterPfofesional5Widget(
                isBussines: params.getParam(
                  'isBussines',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: ProfileSettingsWidget.routeName,
              path: ProfileSettingsWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfileSettingsWidget(
                initialSur: params.getParam(
                  'initialSur',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SomeoneelseWidget.routeName,
              path: SomeoneelseWidget.routePath,
              builder: (context, params) => SomeoneelseWidget(
                report: params.getParam(
                  'report',
                  ParamType.String,
                ),
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: InappropriatecontentWidget.routeName,
              path: InappropriatecontentWidget.routePath,
              builder: (context, params) => InappropriatecontentWidget(
                report: params.getParam(
                  'report',
                  ParamType.String,
                ),
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: InciteshatredWidget.routeName,
              path: InciteshatredWidget.routePath,
              builder: (context, params) => InciteshatredWidget(
                report: params.getParam(
                  'report',
                  ParamType.String,
                ),
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: UnauthorizedsalesWidget.routeName,
              path: UnauthorizedsalesWidget.routePath,
              builder: (context, params) => UnauthorizedsalesWidget(
                report: params.getParam(
                  'report',
                  ParamType.String,
                ),
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ScamsWidget.routeName,
              path: ScamsWidget.routePath,
              builder: (context, params) => ScamsWidget(
                report: params.getParam(
                  'report',
                  ParamType.String,
                ),
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: OtherWidget.routeName,
              path: OtherWidget.routePath,
              builder: (context, params) => OtherWidget(
                report: params.getParam(
                  'report',
                  ParamType.String,
                ),
                user1: params.getParam(
                  'user1',
                  ParamType.String,
                ),
                user2: params.getParam(
                  'user2',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: RegisterProfessional1CopyWidget.routeName,
              path: RegisterProfessional1CopyWidget.routePath,
              builder: (context, params) => RegisterProfessional1CopyWidget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: RegisterProfessional2CopyWidget.routeName,
              path: RegisterProfessional2CopyWidget.routePath,
              builder: (context, params) => RegisterProfessional2CopyWidget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
              ),
            ),
            FFRoute(
              name: RegisterPfofesional4CopyWidget.routeName,
              path: RegisterPfofesional4CopyWidget.routePath,
              builder: (context, params) => RegisterPfofesional4CopyWidget(
                businessRef: params.getParam(
                  'businessRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                isBussines: params.getParam(
                  'isBussines',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: Cadari0CopyWidget.routeName,
              path: Cadari0CopyWidget.routePath,
              builder: (context, params) => Cadari0CopyWidget(
                bussinesRef: params.getParam(
                  'bussinesRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['users'],
                ),
                isBussines: params.getParam(
                  'isBussines',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: NewsCopyWidget.routeName,
              path: NewsCopyWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NewsCopyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/pantainci1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/Frame_427320847.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();

    // Handle erroneous links from Firebase Dynamic Links.

    String? location;

    /*
    Handle `links` routes that have dynamic-link entangled with deep-link 
    */
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.queryParameters.containsKey('deep_link_id')) {
      final deepLinkId = widget.state.uri.queryParameters['deep_link_id'];
      if (deepLinkId != null) {
        final deepLinkUri = Uri.parse(deepLinkId);
        final link = deepLinkUri.toString();
        final host = deepLinkUri.host;
        location = link.split(host).last;
      }
    }

    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      location = '/';
    }

    if (location != null) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => context.go(location!));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
