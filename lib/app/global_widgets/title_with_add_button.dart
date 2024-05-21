
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';

class TitleWithAddButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final String subTitle;
  const TitleWithAddButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w , vertical: 5.h),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22.sp
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding:  EdgeInsets.only( left: 10.0.w , right: 10.0.w ,bottom: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp
                  ),
                ),

                15.pw,
                Container(
                  height: 25.h,
                  width: 25.w,
                  padding:  EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                      size: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
