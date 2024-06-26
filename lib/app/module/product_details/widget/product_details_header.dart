
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/core/values/app_icons.dart';
import 'package:new_touch_test/app/global_widgets/text_with_container.dart';
import 'package:provider/provider.dart';
import '../../../core/values/app_string.dart';
import '../../../data/model/product_model.dart';
import '../../../global_widgets/custom_cached_network_image.dart';



class ProductDetailsHeader extends StatelessWidget {
  final Product product;
  const ProductDetailsHeader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double discountToDecimal = product.discountRate! / 100;

    double discountAmount = product.price! * discountToDecimal;

    double newPrice = product.price! - discountAmount;
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.only(top: 5.h),
      child: Stack(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [

              /// product details
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w , vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      height: 250.h,
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).primaryColor,
                      child: Swiper(
                        duration: 700,
                        autoplay: true,
                        itemCount: 1,
                        autoplayDelay: 6000,
                        itemBuilder: (BuildContext context,int index){
                          return CustomCachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: product.imageUrl.toString(),
                            errorImageHeight: 100.h,
                            errorImageWidth: 100.w,
                          );
                        },

                      ),
                    ),

                    20.ph,
                    Divider(
                      color: Theme.of(context).backgroundColor,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            product.name.toString(),
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.bold
                            )
                        ),


                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             TextWithContainer(
                              text: "${product.additional!.categoryName}",
                            ),

                            10.pw,
                            Text(
                                "${product.additional!.itemFlagName}",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                          ],
                        )

                      ],
                    ),

                    // product.description == null
                    //  ? 0.ph
                    //  : Padding(
                    //      padding:  EdgeInsets.only(top : 10.w),
                    //      child: Text(
                    //         product.description.toString(),
                    //         style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    //             fontWeight: FontWeight.bold
                    //         )
                    //   ),
                    //  ),
                    10.ph,

                    /// price & discount
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(
                            "${product.price} ${AppString.currency}",
                            textAlign: TextAlign.center,
                            style: product.discountRate == 0.0
                             ? Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.bold
                            )
                                : Theme.of(context).textTheme.overline!.copyWith(
                                fontWeight: FontWeight.bold
                            )
                        ),

                        20.pw,

                        if(product.discountRate != 0.0)
                          ...[
                            Text(
                              AppString.discount,
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green
                              ),
                            ),
                            5.pw,
                            Text(
                              "% ${product.discountRate}",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green
                              ),
                            ),
                            10.pw,
                            Text(
                                "$newPrice ${AppString.currency}",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.bold
                                )
                            ),
                          ]

                      ],
                    ),

                    10.ph,

                    /// quantity
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if(product.quantity! > 0)
                             TextWithContainer(
                               width: 80.w,
                              text: AppString.available,
                              containerColor: Colors.green,
                              subText: product.quantity.toString(),
                            )

                        else
                         const TextWithContainer(
                           text: AppString.unavailable,
                           containerColor: Colors.red,
                         )
                      ],
                    )



                  ],
                ),
              ),


            ],
          ),
        ],
      ),

    );
  }
}
