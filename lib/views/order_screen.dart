import 'package:app_api/Constant/colors.dart';
import 'package:app_api/component/app_bar_custom.dart';
import 'package:app_api/component/page_label.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.order});

  final Map order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(8.0), children: [
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
                width: 75,
              ),
              const PageLable(title: 'Id Detail')
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(order["id"].toString()),
                    Text(order["create_at"]),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        order["content"],
                        maxLines: 10,
                      )),
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
