
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';

class TextWithContainer extends StatelessWidget {
  final String text;
  final String? subText;
  final Color? containerColor;
  final TextStyle? textStyle;
  final double? width;
  const TextWithContainer({
    super.key,
    required this.text,
    this.subText,
    this.containerColor,
    this.textStyle,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor ?? Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: subText == null
          ? Text(
            text,
            style: textStyle ?? Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.bold
            ),
      )
          : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text(
            text,
            style: textStyle ?? Theme.of(context).textTheme.headline1!.copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
           3.pw,

           Text(
             "${subText} حبه ",
             style: Theme.of(context).textTheme.headline1!.copyWith(
                 fontWeight: FontWeight.bold,
             ),
           )
        ],
      ),
    );
  }
}
