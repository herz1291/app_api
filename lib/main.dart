import 'package:app_api/views/get_id_screen.dart';
import 'package:app_api/views/home_screen.dart';
import 'package:app_api/views/loding_screen.dart';
import 'package:app_api/views/login_screen.dart';
import 'package:app_api/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/start': (context) => const LodingPage(),
          '/signup': (context) => const SignUpScreen(),
          '/getid': (context) => const GetIdScreen(),
          
          '/login': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
        },
        home: LodingPage());
  }
}