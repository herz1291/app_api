
import 'package:app_api/views/get_start_screen.dart';
import 'package:app_api/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LodingPage extends StatefulWidget {
  const LodingPage({super.key});

  @override
  State<LodingPage> createState() => _LodingPageState();
}

class _LodingPageState extends State<LodingPage> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return box.hasData("token") ? const HomeScreen() : GetStartScreen();
  }
}
