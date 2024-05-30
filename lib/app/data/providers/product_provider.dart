
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_touch_test/app/core/utils/app_url.dart';
import 'package:new_touch_test/app/data/providers/app_provider.dart';
import '../model/product_model.dart';

class ProductProvider extends AppProvider {
  ProductProvider(super.context);

  bool _isSending = false;

  bool get isSending => _isSending;

  set isSending (bool newValue){
    _isSending = newValue;
    notifyListeners();
  }

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



  Future sendItem ({required Product product}) async{
    // Map<String, dynamic> formData = {
    //   "name": "test",
    //   "itemFlagId": "65f0c20f000054db97d69646",
    //   "taxTemplateId": "65f0c1f2000054df97d69644",
    //   "unitTemplateId": "65fb986b0000024ba94088c2",
    //   "categoryId": "65f87e3e000054db97d69670",
    //   "storeId": "",
    //   "price": 0,
    //   "description": "string",
    //   "isExpired": true,
    //   "sellUnitId": "string",
    //   "sellCode": "string",
    //   "purchaseUnitId": "string",
    //   "purchaseCode": "string",
    //   "profitRate": 0,
    //   "discountRate": 0,
    //   "imageUrl": "string",
    //   "thumbUrl": "string",
    //   "linkUrl": "string",
    //   "status": 0,
    //   "position": 0,
    //   "quantity": 0,
    //   "warehouseId": "string",
    //   "itemGroupId": "string",
    //   "costAmount": 0,
    //   "itemImages": [
    //     "string"
    //   ],
    //   "properties": {
    //     "additionalProp1": "string",
    //     "additionalProp2": "string",
    //     "additionalProp3": "string"
    //   },
    //   "shortId": 0,
    //   "id": "string",
    //   "compoundAttribute": 0,
    //   "compoundStoreType": 0,
    //   "itemUnitSalesPrices": [
    //     {
    //       "itemId": "string",
    //       "unitTemplateLineId": "string",
    //       "code": "string",
    //       "barcode": [
    //         "string"
    //       ],
    //       "price": 0,
    //       "retailPrice": 0,
    //       "wholesPrice": 0,
    //       "halfWholesPrice": 0,
    //       "specialPrice": 0,
    //       "anotherPrice": 0,
    //       "shortId": 0,
    //       "id": "string"
    //     }
    //   ],
    //   "itemOptions": [
    //     {
    //       "name": "string",
    //       "description": "string",
    //       "optionType": 1,
    //       "displayType": 1,
    //       "itemId": "string",
    //       "status": 0,
    //       "position": 0,
    //       "minQty": 0,
    //       "maxQty": 0,
    //       "shortId": 0,
    //       "values": [
    //         {
    //           "optionId": "string",
    //           "name": "string",
    //           "quantity": 0,
    //           "price": 0,
    //           "isDefault": true,
    //           "imageUrl": "string",
    //           "position": 0,
    //           "status": 0,
    //           "shortId": 0,
    //           "id": "string"
    //         }
    //       ]
    //     }
    //   ]
    // };
    Map<String, dynamic> sendData = product.toJson();

    try {
       await postData(AppUrl.addProduct, parameters: sendData);

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  }


