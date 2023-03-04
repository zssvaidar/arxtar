import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/Layout/Theme.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'navigation/app_router.dart';
void main() {
  print(123);
  runApp(const StatesLayer());
}

class StatesLayer extends StatefulWidget {
  const StatesLayer({Key? key}) : super(key: key);

  @override
  State<StatesLayer> createState() => _StatesLayerState();
}

class _StatesLayerState extends State<StatesLayer> {
  final _appStateManager = AppStateManager();
  final _userManager = UserManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      userManager: _userManager,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(123);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => _appStateManager,
          ),
          ChangeNotifierProvider(
            create: (context) => _userManager,
          )
        ],
        child: Consumer<UserManager>(
        builder: (context, userManager, child) {
          ThemeData theme;
          if (userManager.darkMode) {
            theme = Themes.dark();
          } else {
            theme = Themes.light();
          }
          return MaterialApp(
            theme: theme,
            title: 'Flutter Demo',
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        }
      )
    );
  }
}

