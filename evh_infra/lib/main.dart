

import 'dart:math';

import 'package:flutter/material.dart';

import 'domain/file_view.dart';
import 'dracula_theme.dart';

void main(){runApp(const App());}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        backgroundColor: DraculaTheme.ansiBlack,
        scaffoldBackgroundColor: DraculaTheme.ansiBlack,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: DraculaTheme.ansiBlack,
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: DraculaTheme.background,
        ),
        textTheme: const TextTheme().copyWith(
          bodyText1: const TextStyle(
            backgroundColor: DraculaTheme.foreground
          )
        ),
      ),
      home: const Scaffold(
        body: FileView(
        ),
      ),
    );
  }
}