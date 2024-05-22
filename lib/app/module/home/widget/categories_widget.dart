
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/core/values/app_string.dart';
import 'package:new_touch_test/app/data/providers/category_provider.dart';
import 'package:new_touch_test/app/global_widgets/category_shimmer.dart';
import 'package:provider/provider.dart';
import '../../../global_widgets/category_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of(context);
    return  SizedBox(
      height: 170.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              AppString.category,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold
              )
          ),


          5.ph,

          Flexible(
            child: categoryProvider.isLoading || categoryProvider.loadingFailed
                ? const CategoryShimmer()
                : ListView.separated(
              itemCount: categoryProvider.items.length,
              shrinkWrap: true,
              primary: false,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context , _) => 8.pw,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.h),
                  child: CategoryCard(
                    onTap: (){

                    },
                    name: categoryProvider.items[index].text,
                    image: categoryProvider.items[index].imageUrl,
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
