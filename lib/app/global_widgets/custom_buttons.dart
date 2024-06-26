

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';

import '../core/utils/constant.dart';



class CustomButtons extends StatelessWidget {
  final double? width;
  final double? height;
  final Color buttonColor;
  final TextStyle? textStyle;
  final String text;
  final Widget? textWidget;
  final GestureTapCallback? onTap;
  final Widget? customWidget;
  final bool? isLoading;
  const CustomButtons({
    Key? key,
    required this.text,
    required this.buttonColor,
    this.textStyle,
    this.width,
    this.height,
    this.onTap,
    this.textWidget,
    this.customWidget,
    this.isLoading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading== true ? null : onTap,
      child:  isLoading == true
          ? Container(
        width: width,
        height: height ?? 40.h ,
        alignment: Alignment.center,
        padding:  EdgeInsets.all(5.w),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(AppConstant.defaultRadius)
        ),

        child: const Center(
            child:  CircularProgressIndicator()
        ),
      )
          : Container(
        width: width,
        height: height ?? 40.h ,
        alignment: Alignment.center,
        padding:  EdgeInsets.all(5.w),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(80.w)
        ),

        child: Row(
          mainAxisAlignment: customWidget != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            Center(
              child: textWidget ?? Text(
                text,
                style: textStyle ?? Theme.of(context).textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp
                ),
              ),
            ),

            customWidget != null
                ? customWidget!
                : 0.ph

          ],
        ),
      ),
    );
  }
}
