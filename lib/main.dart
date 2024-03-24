import 'package:flutter/material.dart';
import 'package:twitter_flutter/widgets/tweet_master.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFCE68E),
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: 'CustomFont'),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "TwitterLike",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: const Color(0xFFFCE68E),
        ),
        body: const Center(
          child: TweetMaster(),
        ),
      ),
    );
  }
}
