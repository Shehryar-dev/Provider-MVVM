import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static double averageRating(List<int> rating){
    var average = 0;
    for(int i = 0; i<rating.length; i++){
      average = average = rating[i];
    }
    return double.parse((average/rating.length).toStringAsFixed(1));
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }

  static void showFlushbarMessage(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          titleColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeOut,
          backgroundColor: Colors.red.shade900,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          messageColor: Colors.black,
          title: "Sad",
          icon: Icon(Icons.error),
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      dismissDirection: DismissDirection.down,
      content: AwesomeSnackbarContent(
        titleTextStyle: const TextStyle(
          fontSize: 22, // Increased for better emphasis on the title
          fontWeight: FontWeight.bold, // Added to make the title stand out
          color: Color(
              0xffFCFAEE), // A slight color change for a more noticeable title
          letterSpacing: 1.2, // Added for a professional touch
        ),
        messageTextStyle: const TextStyle(
          fontSize: 16, // Slightly larger for better readability
          fontWeight: FontWeight.w500, // Semi-bold for clarity
          color: Color(0xffFCFAEE), // Subtle opacity for a cleaner look
          letterSpacing: 1.0, // Consistent with the title spacing
        ),
        color: const Color(0xffB8001F),
        title: 'Error',
        message: message,
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
