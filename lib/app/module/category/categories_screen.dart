
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/data/providers/category_provider.dart';
import 'package:provider/provider.dart';
import '../../global_widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w , vertical: 10.h),
        child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.vertical,
          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.w,
              mainAxisExtent: 120.h, // when it is in vertical this control the space vertically
              // childAspectRatio: 4 / 6,
              crossAxisSpacing: 15, // the space between them horizontally
              mainAxisSpacing: 15
          ),
          itemCount: categoryProvider.items.length,
          itemBuilder: (context , index){
            return CategoryCard(
              onTap: (){

              },
              name: categoryProvider.items[index].text,
              image: categoryProvider.items[index].imageUrl,
            );

          },
        ),
      )
    );
  }
}
