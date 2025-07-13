import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


/// Displays a toast message with consistent style and cancellation of previous toasts.
Future<void> showToast({required String message}) async {
  await Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
