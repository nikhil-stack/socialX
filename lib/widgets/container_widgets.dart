import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {

  final Column column;

  const MainContainer({Key? key, required this.column}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.38,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: column,
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {

  final InkWell inkwell;

  const BottomContainer({Key? key, required this.inkwell}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/14,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        ),
      ),
      child: Center(
        child: inkwell
      ),
    );
  }
}
