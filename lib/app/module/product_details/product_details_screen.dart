

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/global_widgets/custom_buttons.dart';
import 'package:new_touch_test/app/module/home/widget/product_widget.dart';
import 'package:new_touch_test/app/module/product_details/widget/product_details_header.dart';
import '../../core/utils/constant.dart';
import '../../core/values/app_string.dart';
import '../../data/model/product_model.dart';
import '../../global_widgets/custom_app_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: const CustomAppBar(),
          ),
          body: ListView(
            children: [
              /// header with image swiper
              ProductDetailsHeader(
                product: product,
              ),

              3.ph,


              Padding(
                padding:  EdgeInsets.all(10.0.w),
                child: const ProductWidget(title: AppString.relatedProduct,),
              )




            ],
          ),

        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Container(
            height: 70.h,
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppConstant.defaultRadius),
                  topRight: Radius.circular(AppConstant.defaultRadius),

                )
            ),
            child: CustomButtons(
              height: 40.h,
              buttonColor: Theme.of(context).accentColor,
              text: AppString.addToCart,
              onTap: () {},

            ),

          ),
        ),
      ),
    );
  }
}
