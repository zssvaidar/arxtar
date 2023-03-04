import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate
  with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  final UserManager userManager;

  AppRouter({
    required this.appStateManager,
    required this.userManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    userManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    userManager.removeListener(notifyListeners);
    super.dispose();
  }

  // 5
  @override
  Widget build(BuildContext context) {

    return Navigator(

      key: navigatorKey,
      onPopPage: _handlePopPage,

      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized) HomePage.page(),
      ],
    );
  }

  bool _handlePopPage(
      Route<dynamic> route,
      result) {
    if (!route.didPop(result)) {
      return false;
    }

    // if (route.settings.name == FooderlichPages.onboardingPath) {
    //   appStateManager.logout();
    // }
    //
    // if (route.settings.name == FooderlichPages.profilePath) {
    //   userManager.tapOnProfile(false);
    // }
    //
    // if (route.settings.name == FooderlichPages.raywenderlich) {
    //   userManager.tapOnRaywenderlich(false);
    // }
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
