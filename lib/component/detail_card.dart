import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key, required this.order});
  final Map order;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
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
    ));
  }
}
