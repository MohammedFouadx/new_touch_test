import 'package:flutter/material.dart';
import 'package:new_touch_test/app/exports/model.dart';
import 'package:new_touch_test/app/module/product_details/product_details_screen.dart';
import '../../module/start/start_screen.dart';

class Routes {
  Routes._();
  static const String start = '/startScreen';
  static const String productDetails = '/productDetailsScreen';
  // static const String offer = '/offer';


  static final routes = <String, WidgetBuilder>{
    start: (BuildContext context) => StartScreen(),

    /// product screen
    productDetails: (BuildContext context) =>
        ProductDetailsScreen(
            product: ModalRoute.of(context)!.settings.arguments as Product),

    // /// offer test
    // offer: (BuildContext context) =>
    //     OfferScreen(
    //         isOffer: ModalRoute.of(context)!.settings.arguments as bool),

  };
}