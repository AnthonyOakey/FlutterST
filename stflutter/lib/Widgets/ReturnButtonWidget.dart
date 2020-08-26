import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: (){Navigator.pop(context);}, child: Text('Return'));
  }
}
