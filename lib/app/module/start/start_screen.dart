
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/module/branch/branch_screen.dart';
import 'package:new_touch_test/app/module/home/home_screen.dart';
import 'package:new_touch_test/app/module/offer/offer_screen.dart';
import 'package:new_touch_test/app/module/start/provider/start_provider.dart';
import 'package:new_touch_test/app/module/user/user_screen.dart';
import 'package:provider/provider.dart';
import '../../core/values/app_icons.dart';
import '../../core/values/app_string.dart';
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
    StartProvider startProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child:  CustomAppBar(
          scaffoldKey: _scaffoldKey,
          isHome: true,
        ),
      ),
      body: _screens[startProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: startProvider.currentIndex,
        onTap: (index) => startProvider.currentIndex = index,
        items: const [
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
              image: AppIcons.home
            ),
            label: AppString.home,
          ),
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
                image: AppIcons.categories
            ),
            label: AppString.category,
          ),
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
                image: AppIcons.offer
            ),
            label: AppString.offer,
          ),
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
                image: AppIcons.branch
            ),
            label: AppString.branch,
          ),
          BottomNavigationBarItem(
            icon: SVGPictureAssets(
                image: AppIcons.profile
            ),
            label: AppString.profile,
          ),
        ],
      ),
    );
  }
}
