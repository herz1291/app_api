import 'package:flutter/material.dart';

class CardOrders extends StatelessWidget {
  const CardOrders({super.key, required this.order});
  final Map order;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [Text(order["title"]), SizedBox(height: 24,),Text(order["create_at"])],
    ));
  }
}
