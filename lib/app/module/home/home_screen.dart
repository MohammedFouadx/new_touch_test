
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/module/home/widget/categories_widget.dart';
import 'package:new_touch_test/app/module/home/widget/product_widget.dart';

import '../../core/values/app_string.dart';


class HomeScreen extends StatelessWidget {
  const  HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding:  EdgeInsets.all(10.0.w),
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children:  [
            const CategoriesWidget(),
            15.ph,
            const ProductWidget(title: AppString.product,)
          ],
        ),
      ),
    );
  }
}
