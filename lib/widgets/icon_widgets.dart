import 'package:flutter/material.dart';

class FormIcon extends StatelessWidget {
  final IconData icon;
  const FormIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.red,
      size: 24.0,
    );
  }
}