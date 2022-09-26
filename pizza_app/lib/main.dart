import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './start_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDM-hVa0I6dxmOccjToOK3hngafLrg_YBY",
      appId: "1:135269552783:web:897477adf9cda589dd16fa",
      messagingSenderId: "135269552783",
      projectId: "pizza-project-4dd63",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error');
            }
            if (snapshot.connectionState == ConnectionState.done) {
              print('SUCCESSFULLY CONNECTED TO FIREBASE!');
              return StartScreen();
            }
            return Scaffold(
              body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: const CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Загрузка',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}
