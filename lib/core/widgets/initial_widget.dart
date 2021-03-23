import 'package:flutter/material.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
                'This is Initial state',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
    ),
      ),
    );
  }
}