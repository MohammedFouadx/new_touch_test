

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/global_widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';
import 'category_card.dart';
import 'custom_cached_network_image.dart';



class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.25),
      highlightColor: Colors.white.withOpacity(0.6),
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        primary: false,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0.w , vertical: 5.h),
            child: CategoryCard(
              onTap: (){

              },
              name: "",
              image: "",
            ),
          );
        },
      )
    );
  }
}
