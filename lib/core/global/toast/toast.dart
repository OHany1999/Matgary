import 'package:fluttertoast/fluttertoast.dart';

class ToastMessages{
 static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,


    );
  }
  }