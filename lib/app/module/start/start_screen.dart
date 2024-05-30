
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/module/branch/branch_screen.dart';
import 'package:new_touch_test/app/module/home/home_screen.dart';
import 'package:new_touch_test/app/module/offer/offer_screen.dart';
import 'package:new_touch_test/app/module/start/provider/start_provider.dart';
import 'package:new_touch_test/app/module/user/user_screen.dart';
import 'package:provider/provider.dart';
import '../../core/utils/constant.dart';
import '../../core/values/app_colors.dart';
import '../../core/values/app_icons.dart';
import '../../core/values/app_string.dart';
import '../../data/model/product_model.dart';
import '../category/categories_screen.dart';
import 'package:new_touch_test/app/exports/widget.dart';
import 'package:new_touch_test/app/exports/provider.dart';


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
      floatingActionButton: FloatingActionButton(
          mini: false,
          backgroundColor: Theme.of(context).accentColor,
          tooltip: AppString.addProduct,
          onPressed: () async{
            await  showModalBottomSheet(
                context: context,
                enableDrag: true,
                isScrollControlled: true,
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppConstant.defaultRadius)),
                ),
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context , mySetState){
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: FractionallySizedBox(
                          heightFactor: 0.9,
                          child: Padding(
                            padding: EdgeInsets.all(10.0.w),
                            child: ListView(
                              shrinkWrap: true,
                              primary: false,
                              children:  const [

                                BottomSheetHeader(title: AppString.addProduct,),
                                BottomBody()
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                });
          },
          child:  Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
          )
      ),
    );
  }
}


class BottomBody extends StatefulWidget {
  const BottomBody({super.key});

  @override
  State<BottomBody> createState() => _BottomBodyState();
}

class _BottomBodyState extends State<BottomBody> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController quantityController;
  late TextEditingController discountController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    quantityController = TextEditingController();
    discountController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    discountController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// product name
            CustomTextFormField(
              maxLines: 1,
              controller: nameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              hintText:  AppString.enterProductName,
              contentPadding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
              validator: (value) {
                if (value.length == 0) {
                  return AppString.fieldRequired;
                }
                return null;
              },
              onFieldSubmitted: (){
                FocusScope.of(context).nextFocus();
              },
            ),
            10.ph,
            /// price & discount
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// price
                Expanded(
                  child: CustomTextFormField(
                    maxLines: 1,
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    hintText:  AppString.productPrice,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
                    validator: (value) {
                      if (value.length == 0) {
                        return AppString.fieldRequired;
                      }
                      return null;
                    },
                    onFieldSubmitted: (){
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                ),
                10.pw,

                /// discount
                Expanded(
                  child: CustomTextFormField(
                    maxLines: 1,
                    controller: discountController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    hintText:  AppString.discountPercentage,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
                    validator: (value) {
                      if (value.length == 0) {
                        return AppString.fieldRequired;
                      }
                      return null;
                    },
                    onFieldSubmitted: (){
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                ),
              ],
            ),

            10.ph,

            /// quantity
            CustomTextFormField(
              maxLines: 1,
              controller: quantityController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              hintText:  AppString.productQuantity,
              contentPadding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
              validator: (value) {
                if (value.length == 0) {
                  return AppString.fieldRequired;
                }
                return null;
              },
              onFieldSubmitted: (){
                FocusScope.of(context).nextFocus();
              },
            ),

            10.ph,

            /// description
            CustomTextFormField(
              maxLines: 3,
              controller: descriptionController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              hintText:  AppString.enterProductDesc,
              contentPadding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
              validator: (value) {
                if (value.length == 0) {
                  return AppString.fieldRequired;
                }
                return null;
              },
              onFieldSubmitted: (){
                FocusScope.of(context).unfocus();
              },
            ),



            20.ph,

            /// button
            Padding(
              padding:  EdgeInsets.all(5.w),
              child: CustomButtons(
                text: AppString.send,
                isLoading: productProvider.isSending,
                buttonColor: Theme.of(context).accentColor,
                onTap: () async{

                  if(formKey.currentState!.validate()){
                    productProvider.isSending = true;
                    Product productData = Product(
                      itemFlagId: "65f0c20f000054db97d69646",
                      taxTemplateId: "65f0c1f2000054df97d69644",
                      unitTemplateId: "65fb986b0000024ba94088c2",
                      categoryId: "65f87e3e000054db97d69670",
                      name: nameController.text.trim(),
                      description : descriptionController.text,
                      price: double.parse(priceController.text),
                      storeId: "",
                      profitRate: 0,
                      discountRate: double.parse(discountController.text),
                      quantity: double.parse(quantityController.text),
                    );
                    await productProvider.sendItem(product: productData);
                    if(productProvider.isLoaded && productProvider.errors=="") {
                      CustomDialog.showCustomDialog(
                          context: context,
                          title: AppString.itemAdded,
                          barrierDismissible: false,
                          withActions: true,
                          withYesButton: true,
                          onPressed: () {
                            productProvider.refreshData();
                            CustomDialog.hideCustomDialog(context);
                            Navigator.pop(context);

                          }
                      );
                      productProvider.isSending = false;
                    }
                    else{
                      productProvider.isSending = false;
                      if(productProvider.errors != ""){
                        CustomDialog.showCustomDialog(
                            context: context,
                            title: productProvider.errors.toString(),
                            barrierDismissible: false,
                            withActions: true,
                            withYesButton: true,
                            onPressed: () {
                              productProvider.refreshData();
                              CustomDialog.hideCustomDialog(context);
                            }
                        );
                      }
                    }
                  }else {
                    formKey.currentState!.validate();
                    productProvider.isSending = false;
                  }


                },
              ),
            ),
          ],
        )
    );
  }
}

