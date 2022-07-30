import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen{
  show(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
          });
          return Container(
            height: 50,
            width: 50,
            child: SpinKitFadingCircle(
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary, size: 150.0),
          );
        });
  }
}