
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/global_widgets/category_shimmer.dart';
import 'package:provider/provider.dart';

import '../../../data/controller/category_controller.dart';
import '../../../global_widgets/category_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cateController = Provider.of<CategoryController>(context);
    return  SizedBox(
      height: 170.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'الفئات',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold
              )
          ),


          5.ph,

          Flexible(
            child: cateController.isLoading || cateController.loadingFailed
                ? const CategoryShimmer()
                : ListView.separated(
              itemCount: cateController.items.length,
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
                    name: cateController.items[index].text,
                    image: cateController.items[index].imageUrl,
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
