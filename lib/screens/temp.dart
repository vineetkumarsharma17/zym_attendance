import 'package:flutter/material.dart';

class Temp extends StatelessWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(25),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          )
        ],
      ),
    );
  }
}
