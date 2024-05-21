

import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/global_widgets/svg_picture_assets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../core/values/app_icons.dart';
import '../services/screen_navigation_service.dart';

class CustomAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool isHome;

  const CustomAppBar({
    Key? key,
    this.scaffoldKey,
    this.isHome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: _buildAppBarLeading(context),
      centerTitle:  true,
      title:  _buildLogo(context),
      actions: [
        _buildActions(context)
      ],
    );
  }



  Widget _buildDrawerIcon(BuildContext context) {
    return InkWell(
        onTap: () {
          scaffoldKey?.currentState!.openDrawer();
        },
        child:  SVGPictureAssets(
          image: AppIcons.drawer,
          height: 20.h,
          width: 20.w,
        )
    );
  }



  Widget _buildCartIcon(BuildContext context) {
      return SVGPictureAssets(
        image: AppIcons.cart,
        height: 20.h,
        width: 20.w,
      );

  }

  Widget _buildArrowIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: SVGPictureAssets(
        image: AppIcons.arrowBack,
        height: 20.h,
        width: 20.w,
      )
    );
  }

  Widget _buildLogo(BuildContext context) {
      return Image.asset(
        AppIcons.logo,
        height: 90.h,
        width: 90.w,
      );

  }

  Widget _buildAppBarLeading (BuildContext context) {
    if(isHome == false ){
      return Padding(
        padding: EdgeInsets.only(left: 10.0.w , right: 10.w),
        child: _buildArrowIcon(context),
      );
    }else {
      return Padding(
        padding: EdgeInsets.only(left: 15.0.w , right: 15.w),
        child: _buildDrawerIcon(context),
      );
    }

  }

  Widget _buildActions (BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        15.pw,
        _buildCartIcon(context),
        15.pw,
      ],
    );
  }



}
