
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

toastInfo(String msg,
    {Color backgroundColor = Colors.blue, Color textColor = Colors.white}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 18,
  );
}
