import 'package:flutter/material.dart';
import 'page/home_page.dart';
import 'page/detail_page.dart';

void main() {
  runApp(const RickMortyApp());
}

class RickMortyApp extends StatelessWidget {
  const RickMortyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty App',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeId:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case DetailPage.routeId:
            final id = settings.arguments as int;
            return MaterialPageRoute(
              builder: (_) => DetailPage(characterId: id),
            );
          default:
            return null;
        }
      },
      initialRoute: HomePage.routeId,
    );
  }
}
