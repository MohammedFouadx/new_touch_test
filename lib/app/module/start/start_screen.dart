
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/module/branch/branch_screen.dart';
import 'package:new_touch_test/app/module/home/home_screen.dart';
import 'package:new_touch_test/app/module/offer/offer_screen.dart';
import 'package:new_touch_test/app/module/start/controller/start_controller.dart';
import 'package:new_touch_test/app/module/user/user_screen.dart';
import 'package:provider/provider.dart';

import '../../core/values/app_icons.dart';
import '../../global_widgets/custom_app_bar.dart';
import '../../global_widgets/svg_picture_assets.dart';
import '../category/categories_screen.dart';


class StartScreen extends StatelessWidget {
   StartScreen({super.key});
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const OfferScreen(),
    const BranchScreen(),
    const UserScreen(),
  ];
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var startController = Provider.of<StartController>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child:  CustomAppBar(
          scaffoldKey: _scaffoldKey,
          isHome: true,
        ),
      ),
      body: _screens[startController.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: startController.currentIndex,
        onTap: (index) => startController.currentIndex = index,
        items: const [
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
              image: AppIcons.home
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
                image: AppIcons.categories
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
                image: AppIcons.offer
            ),
            label: 'العروض',
          ),
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
                image: AppIcons.branch
            ),
            label: 'الفروع',
          ),
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
                image: AppIcons.profile
            ),
            label: 'الملف الشخصي',
          ),
        ],
      ),
    );
  }
}
