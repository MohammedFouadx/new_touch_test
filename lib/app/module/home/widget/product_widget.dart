
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/core/utils/route.dart';
import 'package:new_touch_test/app/data/providers/product_provider.dart';
import 'package:new_touch_test/app/global_widgets/custom_product_card.dart';
import 'package:new_touch_test/app/module/product_details/product_details_screen.dart';
import 'package:new_touch_test/app/services/screen_navigation_service.dart';
import 'package:provider/provider.dart';
import '../../../global_widgets/category_shimmer.dart';

class ProductWidget extends StatelessWidget {
  final String title;
  const ProductWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    return  SizedBox(
      height: 340.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold
              )
          ),


          5.ph,

          Flexible(
            child: productProvider.isLoading || productProvider.loadingFailed
                ? const CategoryShimmer()
                : ListView.separated(
              itemCount: productProvider.items.length,
              shrinkWrap: true,
              primary: false,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context , _) => 8.pw,
              itemBuilder: (context, index) {
                 var product = productProvider.items[index];
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.h),
                  child: CustomProductCard(
                    price: double.parse(product.price.toString()).toString(),
                    name: product.name.toString(),
                    image: product.imageUrl.toString(),
                    categoryName: product.additional.categoryName.toString(),
                    itemFlagName: product.additional.itemFlagName.toString(),
                    onTap: () {
                      pushNamedScreen(
                          context,
                          Routes.productDetails,
                          arguments:  product
                      );

                    },
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}
