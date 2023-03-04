import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

// 1
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  // 2
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
    print(appStateManager.isInitialized);
    // 6
    return Navigator(
      // 7
      key: navigatorKey,
      onPopPage: _handlePopPage,
      // 8
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        // if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
        //   LoginScreen.page(),
        // if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
        //   OnboardingScreen.page(),
        // if (appStateManager.isOnboardingComplete)
        //   Home.page(appStateManager.getSelectedTab),
        //
        // if (userManager.didSelectUser)
        //   ProfileScreen.page(userManager.getUser),
        // if (userManager.didTapOnRaywenderlich)
        //   WebViewScreen.page()

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
