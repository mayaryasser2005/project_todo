import 'package:flutter/material.dart';
import 'package:project_todo/ui/screens/home/home.dart';
import 'package:project_todo/ui/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.Dark,
      routes: {
        HomeScreen.routeNamed: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeNamed,
    );
  }
}
