import 'package:flutter/material.dart';
import 'screens/questions_screen.dart';
import 'screens/results_screen.dart';
import 'screens/home.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Admob.initialize("com.mteam.animequizzer");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/questions': (context) => QuestionsScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }

}
