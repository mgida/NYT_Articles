
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:nyt_articles/rest_api/article_service.dart';
import 'package:nyt_articles/ui/screens/home_screen.dart';
import 'package:nyt_articles/utils/constants.dart';
import 'package:provider/provider.dart';

void main() {
  _setUpLogging();
  runApp( MyApp());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ArticleService.create(),
      dispose: (context, ArticleService service) => service.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryTextTheme: TextTheme(
              headline6: kNewsCycleFont,
            ),
            textTheme: kTextTheme),
        home: HomeScreen(),
      ),
    );
  }
}
