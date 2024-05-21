import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_touch_test/app/core/utils/app_url.dart';
import 'package:new_touch_test/app/data/controller/app_controller.dart';
import 'package:new_touch_test/app/data/model/category_model.dart';


class CategoryController extends QueryModel {
  CategoryController(super.context);

  @override
  Future loadData([BuildContext? context]) async{
      var data;
      try{
        data = await fetchDataFromServer(AppUrl.category);

      }catch (error) {
        if (kDebugMode) {
          print("MainCategoriesController catch error$error");
        }
      }

      if(data != null){
        CategoryData categoryData = CategoryData.fromJson(data);
        List mainCateList = categoryData.categories!;
        items.addAll(mainCateList);
        finishLoading();
        // if (kDebugMode) {
        //   print ("===== category controller=====$data");
        // }
      }

    }
  Categories get categories => items[0];
  }



