import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/Layout/Theme.dart';
import 'package:mobile/api/api_service.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'navigation/app_router.dart';
void main() {
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
    getData();
  }

  Future<void> getData () async {

    var url = Uri.http('localhost:10000', 'data');
    var response = await http.get(url);

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
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
            title: 'Arxtar',
            debugShowCheckedModeBanner: false,
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

