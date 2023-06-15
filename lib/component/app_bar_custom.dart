import 'package:app_api/Constant/colors.dart';
import 'package:app_api/component/page_label.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key, this.title = ''});
  final String? title;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(75);
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      title: Text(
        widget.title!,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 0, 97, 87)),
      ),
      // leading: WillPopScope(
      //   onWillPop: () async => false,
      //   child: IconButton(
      //       onPressed: () {},
      //       icon: Container(
      //           padding: const EdgeInsets.all(8),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(100),
      //           ),
      //           child: const Icon(
      //             Icons.arrow_back,
      //             color: Colors.white,
      //           ))),
      // ),
    );
  }
}
