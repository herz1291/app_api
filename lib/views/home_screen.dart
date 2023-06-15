import 'dart:convert';

import 'package:app_api/Constant/colors.dart';
import 'package:app_api/component/custom_textField.dart';
import 'package:app_api/component/order_card.dart';
import 'package:app_api/component/page_label.dart';
import 'package:app_api/services/api/User/create_order.dart';
import 'package:app_api/services/api/User/get_orders.dart';
import 'package:app_api/services/extan/navigitor/pushEXT.dart';
import 'package:app_api/views/login_screen.dart';
import 'package:app_api/views/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isLoading = true;

  List listOrders = [];
  @override
  void initState() {
    super.initState();
    _test();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: bgColor,
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          final box = GetStorage();
                          box.remove("token");

                          Navigator.of(context).pushReplacementNamed('/start');
                        },
                        icon: const Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                        )),
                    const SizedBox(
                      width: 60,
                    ),
                    const PageLable(title: 'Homepage')
                  ],
                ),

                TextFieldCustom(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter the Title!';
                    }
                  },
                  hint: "Title",
                  label: "Title",
                  controller: titleController,
                  icon: Icons.read_more,
                ),
                TextFieldCustom(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the content!';
                      }
                    },
                    minLines: 3,
                    maxLines: 10,
                    hint: "content",
                    label: "content",
                    controller: contentController,
                    icon: Icons.content_copy_outlined),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                      ),
                      child: Text("Add Data"),
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        final result = await createOrder(
                            context: context,
                            body: {
                              "title": titleController.text,
                              "content": contentController.text
                            });

                        print(result.statusCode);
                        _test();
                      },
                    )),
                    Center(
                      child: ElevatedButton(
                        child: Text("Get Data by ID"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: btnColor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/getid');
                        },
                      ),
                    ),
                  ],
                ),

                //-------------- display orders ---------------
                if (isLoading == true) ...{
                  Center(
                    child: CircularProgressIndicator(),
                  )
                } else ...{
                  for (var item in listOrders.reversed)
                    InkWell(
                        onTap: () {
                          context.pushPage(OrderScreen(order: item));
                        },
                        child: CardOrders(order: item)),
                }
              ],
            ),
          )),
    );
  }

  _test() async {
    // setState(() {
    //   isLoading = true;
    // });
    if ((await getOrders()).statusCode == 200) {
      listOrders = json.decode((await getOrders()).body)["data"];
      print(listOrders);
      setState(() {
        isLoading = false;
      });
      setState(() {});
    } else {
      final box = GetStorage();
      box.remove("token");

      // Navigator.of(context).pushNamed('/login');
      context.pushAndRemove(view: LoginScreen());
    }
  }
}

lodingPage({required BuildContext context}) {
  return showDialog(
      context: context,
      barrierColor: Colors.white,
      builder: (context) => const Center(child: CircularProgressIndicator()));
}

getData({required String keyUser}) {
  final box = GetStorage();
  if (box.hasData(keyUser)) {
    return box.read(keyUser);
  } else {
    return null;
  }
}

getDataWithLoading({required BuildContext context, required String keyUser}) {
  lodingPage(context: context);
  final data = getData(keyUser: keyUser);

  if (data != null) {
    Navigator.of(context).pop();
  }
}
