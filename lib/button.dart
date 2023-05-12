import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final function;
  button({this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: Center(
          child: Text('+',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
