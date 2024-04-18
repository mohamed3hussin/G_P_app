import 'package:flutter/material.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: CustomColors.blue,),
                SizedBox(
                  width: 8,
                ),
                Text(message,style: Styles.textStyle14!.copyWith(color: Colors.black),),
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      BuildContext context,
      String message, {
        String title = 'Title',
        String? posActionName,
        VoidCallback? posAction,
        String? negActionName,
        VoidCallback? negAction,
      }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName,style: Styles.textStyle14!.copyWith(color: Colors.black),)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,style: Styles.textStyle14!.copyWith(color: Colors.black),)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Text(message,style: Styles.textStyle14!.copyWith(color: Colors.black),),
            title: Text(title,style: Styles.textStyle14!.copyWith(color: Colors.black),),
            actions: actions,
            titleTextStyle: Styles.textStyle14!.copyWith(color: Colors.black)
          );
        });
  }
}