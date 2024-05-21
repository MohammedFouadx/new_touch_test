import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_touch_test/app/core/utils/app_url.dart';
import 'package:new_touch_test/app/data/controller/app_controller.dart';

import '../model/product_model.dart';

class ProductController extends QueryModel {
  ProductController(super.context);

  @override
  Future loadData([BuildContext? context]) async {
    var data;
    try {
      data = await fetchDataFromServer(AppUrl.product);
    } catch (error) {
      if (kDebugMode) {
        print("product catch error$error");
      }
    }

    if (data != null) {
      ProductData productData = ProductData.fromJson(data);
      List productList = productData.data!;
      items.addAll(productList);
      finishLoading();
      // if (kDebugMode) {
      //   print("===== product controller=====$data");
      // }
    }
  }

  Product get product => items[0];

  Future addProduct() async {
    // Map<String, dynamic> postData = product.toJson();
    try {
      if (items.isNotEmpty) items.clear();
      Map<String, dynamic> formData = {
        "name": "ddddd",
        "itemFlagId": "333",
        "taxTemplateId": "558888684864684sdfsdf8646845555",
        "unitTemplateId": "65fb986b0000024ba94088c2",
        "categoryId": "string",
        "storeId": "string",
        "price": 0,
        "description": "string",
        "isExpired": true,
        "sellUnitId": "string",
        "sellCode": "string",
        "purchaseUnitId": "string",
        "purchaseCode": "string",
        "profitRate": 0,
        "discountRate": 0,
        "imageUrl": "string",
        "thumbUrl": "string",
        "linkUrl": "string",
        "status": 0,
        "position": 0,
        "quantity": 0,
        "warehouseId": "string",
        "itemGroupId": "string",
        "costAmount": 0,
        "itemImages": ["string"],
        "properties": {
          "additionalProp1": "string",
          "additionalProp2": "string",
          "additionalProp3": "string"
        },
        "shortId": 0,
        "id": "string",
        "compoundAttribute": 0,
        "compoundStoreType": 0,
        "itemCompoundLines": [
          {
            "itemId": "string",
            "unitTemplateLineId": "string",
            "quantity": 0,
            "costAmount": 0,
            "taxAmount": 0,
            "discountAmount": 0,
            "costTotal": 0,
            "status": 0,
            "shortId": 0,
            "position": 0,
            "id": "string"
          }
        ],
        "itemUnitSalesPrices": [
          {
            "itemId": "string",
            "unitTemplateLineId": "string",
            "code": "string",
            "barcode": ["string"],
            "price": 0,
            "retailPrice": 0,
            "wholesPrice": 0,
            "halfWholesPrice": 0,
            "specialPrice": 0,
            "anotherPrice": 0,
            "shortId": 0,
            "id": "string"
          }
        ],
        "itemOptions": [
          {
            "name": "string",
            "description": "string",
            "optionType": 0,
            "displayType": 0,
            "itemId": "string",
            "status": 0,
            "position": 0,
            "minQty": 0,
            "maxQty": 0,
            "shortId": 0,
            "values": [
              {
                "optionId": "string",
                "name": "string",
                "quantity": 0,
                "price": 0,
                "isDefault": true,
                "imageUrl": "string",
                "position": 0,
                "status": 0,
                "shortId": 0,
                "id": "string"
              }
            ]
          }
        ]
      };
      var data = await saveData(AppUrl.addProduct, parameters: formData);
      if (isLoaded) {
        if (kDebugMode) {
          print(" send product model ==  ${data.toString()}");
          // print(" send product model post data ==  ${postData.toString()}");
        }
        return data;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
