import 'package:app_api/Constant/colors.dart';
import 'package:app_api/component/page_label.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  var token = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var box = GetStorage();

    if (box.read('token') != null) {
      token = box.read('token');
      print(token);
    } else {
      print('object');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              title: PageLable(
                title: 'Welcome to App',
              ),
              elevation: 0,
              backgroundColor: bgColor,
            ),
            body: SafeArea(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 64,
                      ),
                      Container(
                        height: 70.0,
                        width: 359,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: btnColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 70.0,
                        width: 359,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: btnColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
