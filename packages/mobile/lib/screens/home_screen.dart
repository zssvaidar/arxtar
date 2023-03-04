import 'package:flutter/material.dart';
import 'package:mobile/api/api_service.dart';
import 'package:mobile/components/session_component.dart';
import 'package:mobile/models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: Pages.homePath,
      key: ValueKey(Pages.homePath),
      child: const HomePage(),
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = ApiService();

  Widget gridView (data) => SessionCard(session: data);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: service.getSessionData(),
      builder: (context, AsyncSnapshot<Session> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            child:
            // Text(
            //   snapshot.data.toString()
            // ),
            GridView.builder(
              itemCount: 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return gridView(snapshot.data);
              },
            ),
          );
          // return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );;
  }
}
