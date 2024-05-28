import 'package:flutter/material.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/core/values/app_string.dart';
import '../global_widgets/custom_buttons.dart';

class CustomDialog {
  static void showCustomDialog({
    required BuildContext context,
    required String title,
    bool? withActions,
    bool? withYesButton,
    bool? withNoButton,
    required bool barrierDismissible,
    VoidCallback? onPressed,
    VoidCallback? onNoPressed,
    Widget? content,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return CustomDialog._buildDialog(
            context, title , withActions , withYesButton ,withNoButton, onPressed , onNoPressed , content);
      },
    );
  }

  static void hideCustomDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static Widget _buildDialog(
  BuildContext context,
  String title,
   bool? withActions,
    bool? withYesButton,
   bool? withNoButton,
   VoidCallback? onPressed,
   VoidCallback? onNoPressed,
   Widget? content) {
    return AlertDialog(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.5,
        title:  Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 5,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'cairo'
              ),
            ),
        ),
        content: content,
        actions: withActions == true
            ? <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              withYesButton == true
                  ? Expanded(
                child: CustomButtons(
                  text: AppString.save,
                  buttonColor: Theme.of(context).secondaryHeaderColor,
                  onTap: onPressed,

                ),
              )

                  : 0.ph,

              10.pw,
             withNoButton == true
                  ? Expanded(
                child: CustomButtons(
                  text: AppString.cancel,
                  buttonColor: Theme.of(context).secondaryHeaderColor,
                  onTap: onNoPressed ??  (){
                    Navigator.pop(context);
                  },
                ),
              )
                  : 0.ph,
            ],
          ),




        ]
            : <Widget> [],

    );
  }
}



