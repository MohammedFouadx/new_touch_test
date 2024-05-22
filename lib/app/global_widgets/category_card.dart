
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/global_widgets/custom_cached_network_image.dart';

import '../core/utils/constant.dart';


class CategoryCard extends StatelessWidget {
  final GestureTapCallback onTap;
  final String name;
  final TextStyle? textStyle;
  final String? image;
  final double? imageWidth;
  final double? imageHeight;
  const CategoryCard({
    super.key,
    required this.onTap,
    required this.name,
    this.image,
    this.textStyle,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstant.defaultRadius),
            color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding:  EdgeInsets.all(5.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              CustomCachedNetworkImage(
                imageUrl: image.toString(),
                width: imageWidth ??  70.w,
                height: imageHeight ?? 70.w,
              ),


              10.ph,
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: textStyle ??  Theme.of(context).textTheme.subtitle2,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
