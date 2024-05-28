
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/values/app_string.dart';
import '../core/utils/constant.dart';


class CustomSlidingPanel extends StatelessWidget {
  final GestureTapCallback? onTapGallery;
  final GestureTapCallback? onTapCamera;
  const CustomSlidingPanel({
    Key? key,
    required this.onTapGallery,
    required this.onTapCamera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).backgroundColor),
              borderRadius: BorderRadius.circular(AppConstant.defaultRadius)),
          child: Container(
            width: 100.0.w,
            padding: EdgeInsets.all(5.w),
            child: InkWell(
              onTap: onTapGallery,
              child: Padding(
                padding:  EdgeInsets.all(6.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const Icon(
                      Icons.browse_gallery,
                      size: 20,
                    ),
                    Text(
                      AppString.gallery,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).backgroundColor),
              borderRadius: BorderRadius.circular(AppConstant.defaultRadius)),
          child: Container(
            width: 100.0.w,
            padding: EdgeInsets.all(5.w),
            child: InkWell(
              onTap: onTapCamera,
              child: Padding(
                padding:  EdgeInsets.all(6.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera,
                      size: 20,
                    ),

                    Text(
                      AppString.camera,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
