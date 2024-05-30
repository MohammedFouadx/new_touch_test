import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_touch_test/app/core/utils/app_url.dart';
import '../model/category_model.dart';
import 'app_provider.dart';


class CategoryProvider extends AppProvider {
  CategoryProvider(super.context);

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



