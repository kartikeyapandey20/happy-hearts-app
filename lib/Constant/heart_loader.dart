

import 'package:flutter/material.dart';

import 'loader.dart';

class CustomLoader{

  Future<void> showLoader(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: HeartLoader(),
          ),
        );
      },
    );
  }
}