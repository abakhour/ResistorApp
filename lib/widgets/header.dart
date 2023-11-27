import 'package:flutter/material.dart';
class Header extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  const Header({Key? key, required this.titleText}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
      backgroundColor: Colors.blue,
      centerTitle: true,
    );
  }
}