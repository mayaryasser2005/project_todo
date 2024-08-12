import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_todo/ui/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD4ArkDA7AquWJPzCXY7ep-ZoY-hQfHJMM",
          appId: "1:780663306422:android:6f8a706aa6940e11d58e17",
          messagingSenderId: "todo-project-58062",
          projectId: "todo-project-58062"),
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeNamed: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeNamed,
    );
  }
}
