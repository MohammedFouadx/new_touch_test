
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/data/controller/category_controller.dart';
import 'package:new_touch_test/app/data/controller/product_controller.dart';
import 'package:new_touch_test/app/module/start/controller/start_controller.dart';
import 'package:new_touch_test/app/module/start/start_screen.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'module/home/home_screen.dart';

class NewTouchApp extends StatelessWidget {
  const NewTouchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryController(context)),
        ChangeNotifierProvider(create: (context) => StartController()),
        ChangeNotifierProvider(create: (context) => ProductController(context)),
      ],
      child: const MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 732),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getLightTheme(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: StartScreen()
          ),
        );
      },
    );
  }
}

