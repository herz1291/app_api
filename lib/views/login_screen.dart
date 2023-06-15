import 'dart:convert';

import 'package:app_api/Constant/colors.dart';
import 'package:app_api/component/app_bar_custom.dart';
import 'package:app_api/component/custom_textField.dart';
import 'package:app_api/component/page_label.dart';
import 'package:app_api/services/api/Auth/login.dart';
import 'package:app_api/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: bgColor,
          // appBar: AppBarCustom(title: 'Log In'),
          body: Form(
            key: _formKey,
            child: ListView(children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 100,
                  ),
                  PageLable(title: 'Log In')
                ],
              ),
              TextFieldCustom(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
                  }
                },
                hint: "example@gmail.com",
                label: "Email",
                icon: Icons.email,
                obscureText: false,
                controller: emailController,
              ),
              TextFieldCustom(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty';
                  }
                },
                hint: "******",
                label: "Password",
                icon: Icons.key,
                obscureText: isVisible,
                isPassword: true,
                controller: passwordController,
                maxLines: 1,
                minLines: 1,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();
                      final Map body = {
                        "email": emailController.text,
                        "password": passwordController.text,
                      };
                      final response = await loginUser(body: body);

                      if (response.statusCode == 200) {
                        final box = GetStorage();
                        box.write("token",
                            json.decode(response.body)["data"]["token"]);

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (route) => false);
                      }
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ]),
          )),
    );
  }
}
