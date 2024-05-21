


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/global_widgets/text_with_container.dart';
import 'custom_cached_network_image.dart';


class CustomProductCard extends StatelessWidget {
  final GestureTapCallback onTap;
  final String name;
  final String categoryName;
  final String itemFlagName;
  final String image;
  final String? price;
  const CustomProductCard({
    super.key,
    required this.onTap,
    required this.name,
    required this.price,
    required this.image,
    required this.categoryName,
    required this.itemFlagName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 220.h,
        width: 167.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: Theme.of(context).primaryColor, // white color
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image
            Padding(
              padding:  EdgeInsets.only(top: 25.w),
              child: SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: CustomCachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: image,
                  )

              ),
            ),

            10.ph,

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// name

                  Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontFamily: "cairo"
                      )
                  ),

                  /// price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "$price" ,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: "cairo",
                              fontSize: 14.sp
                          )
                      ),
                      2.pw,

                      Center(
                        child: Text(
                            "ريال يمني" ,
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: "cairo",
                                fontSize: 10.sp
                            )
                        ),
                      ),
                    ],
                  ),

                  10.ph,
                  /// additional
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       TextWithContainer(
                        text: categoryName,
                      ),
                      Text(
                        itemFlagName,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
