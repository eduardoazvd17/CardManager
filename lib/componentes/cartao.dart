import 'package:flutter/material.dart';

class Cartao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: new BorderRadius.circular(10),
      ),
      width: 400,
      height: 250,
    );
  }
}
