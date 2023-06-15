import 'dart:convert';

import 'package:app_api/Constant/colors.dart';
import 'package:app_api/component/app_bar_custom.dart';
import 'package:app_api/component/custom_textField.dart';
import 'package:app_api/component/page_label.dart';
import 'package:app_api/services/api/User/getByID.dart';
import 'package:flutter/material.dart';

class GetIdScreen extends StatefulWidget {
  const GetIdScreen({super.key});

  @override
  State<GetIdScreen> createState() => _GetIdScreenState();
}

class _GetIdScreenState extends State<GetIdScreen> {
  Map order = {};
  final TextEditingController idController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Form(
        key: _formKey,
        child: ListView(padding: EdgeInsets.all(8.0), children: [
          SizedBox(
            height: 50,
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
                width: 75,
              ),
              PageLable(title: 'Id Detail')
            ],
          ),
          TextFieldCustom(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Id cannot be empty';
                }
              },
              controller: idController,
              hint: "enter id",
              label: "ID",
              icon: Icons.insert_drive_file),
          Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                      ),
                      onPressed: () async {
                        try {
                          if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();
                          if (int.parse(idController.text) is int) {
                            order = json.decode(
                                (await getByID(id: idController.text)).body);
                            print(order);
                            if ((order["data"] as List).isEmpty) {
                              order = {};
                            } else {
                              order = order["data"][0];
                            }

                            setState(() {});
                          }
                        } catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("plase enter correct number")));
                        }
                      },
                      child: const Text("Get id",
                          style: TextStyle(color: Colors.white))),
                ]),
          ),
          Visibility(
              visible: order.isNotEmpty,
              child: Card(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(order["id"].toString()),
                          Text(order["title"].toString()),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(order["content"].toString()),
                          Text(order["create_at"].toString()),
                        ],
                      )),
                ],
              ))),
        ]),
      ),
    );
  }
}
