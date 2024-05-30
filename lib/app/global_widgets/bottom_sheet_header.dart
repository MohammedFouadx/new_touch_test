
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';

import 'custom_two_text.dart';


class BottomSheetHeader extends StatelessWidget {
  final String title;
  final String? subTitle;
  const BottomSheetHeader({
    super.key,
    required this.title,
     this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 10.0.w),
          child: CustomTowText(
            title: title,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            titleStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22.sp

            ),
            subWidget: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                  size: 30,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
            ),
          ),
        ),
        3.ph,
        subTitle == null
        ? 0.ph
        : Text(
          subTitle.toString(),
          style: Theme.of(context).textTheme.caption!.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
        20.ph,
      ],
    );
  }
}
