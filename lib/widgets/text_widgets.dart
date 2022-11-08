import 'package:flutter/material.dart';

class RedTextTitle extends StatelessWidget {
  final String title;
  const RedTextTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class RedTextnormal extends StatelessWidget {
  final String title;
  const RedTextnormal({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 16,
        fontWeight: FontWeight.w700
      ),
    );
  }
}

class BottomText extends StatelessWidget {

  final String title;

  const BottomText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 1.3,
        fontWeight: FontWeight.w700
      ),
    );
  }
}