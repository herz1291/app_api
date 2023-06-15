import 'package:app_api/Constant/colors.dart';
import 'package:app_api/component/app_bar_custom.dart';
import 'package:app_api/component/custom_textField.dart';
import 'package:app_api/component/page_label.dart';
import 'package:app_api/services/api/Auth/createUser.dart';
import 'package:app_api/views/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var isVisible = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //theme: ThemeData(textTheme: TextTheme()),
        home: Scaffold(
      backgroundColor: bgColor,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 90,
                ),
                const PageLable(title: 'Sing up')
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            TextFieldCustom(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Name cannot be empty';
                }
              },
              hint: "Fahad Alazmi",
              label: "Name",
              icon: Icons.person,
              obscureText: false,
              controller: nameController,
            ),
            TextFieldCustom(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Username cannot be empty';
                }
              },
              hint: "user123",
              label: "Username",
              icon: Icons.person,
              obscureText: false,
              controller: userNameController,
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
              hint: "AAaa1100229933",
              label: "password",
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
                      "username": userNameController.text,
                      "name": nameController.text
                    };
                    final response = await createUser(body: body);
                    print(response.body);
                    if (response.statusCode == 200) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
