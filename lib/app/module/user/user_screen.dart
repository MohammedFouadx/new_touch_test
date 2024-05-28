
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_touch_test/app/core/utils/empty_padding.dart';
import 'package:new_touch_test/app/core/values/app_icons.dart';
import 'package:new_touch_test/app/data/model/product_model.dart';
import 'package:new_touch_test/app/data/providers/product_provider.dart';
import 'package:new_touch_test/app/exports/services.dart';
import 'package:new_touch_test/app/exports/widget.dart';
import 'package:new_touch_test/app/global_widgets/custom_dialog.dart';
import 'package:new_touch_test/app/global_widgets/custom_text_form_field.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import '../../core/utils/constant.dart';
import '../../core/utils/route.dart';
import '../../core/values/app_string.dart';
import '../../global_widgets/bottom_sheet_header.dart';
import '../../global_widgets/custom_sliding_panel.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController quantityController;
  late TextEditingController discountController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? _image;
  String? imageName;

  Future getImageFromCamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
      imageName = p.basename(_image!.path);
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
      imageName = p.basename(_image!.path);
    });
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    priceController = TextEditingController();
    quantityController = TextEditingController();
    discountController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    discountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            10.ph,

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                AppString.addProduct,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            10.ph,

            Container(
              height: 260.h,
              padding: EdgeInsets.all(10.0.w),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(AppConstant.defaultRadius),
              ),
              child: ListView(
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
                  /// price & quantity
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
                    textInputAction: TextInputAction.done,
                    hintText:  AppString.productQuantity,
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

                  Padding(
                    padding:  EdgeInsets.all(5.w),
                    child: CustomButtons(
                      text: AppString.send,
                      isLoading: productProvider.isSending,
                      buttonColor: Theme.of(context).secondaryHeaderColor,
                      onTap: () async{

                        if(formKey.currentState!.validate()){
                          productProvider.isSending = true;
                          Product productData = Product(
                            itemFlagId: "65f0c20f000054db97d69646",
                            taxTemplateId: "65f0c1f2000054df97d69644",
                            unitTemplateId: "65fb986b0000024ba94088c2",
                            categoryId: "65f87e3e000054db97d69670",
                            name: nameController.text.trim(),
                            price: double.parse(priceController.text),
                            storeId: "",
                            profitRate: 0,
                            discountRate: double.parse(discountController.text),
                            quantity: double.parse(quantityController.text),

                          );
                          await productProvider.sendItem(product : productData,);
                          if(productProvider.isLoaded && productProvider.errors == "") {
                            CustomDialog.showCustomDialog(
                                context: context,
                                title: AppString.itemAdded,
                                barrierDismissible: false,
                                withActions: true,
                                withYesButton: true,
                                onPressed: () {
                                  productProvider.refreshData();
                                  CustomDialog.hideCustomDialog(context);
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
              ),
            )


          ],
        ),
      ),
    );
  }
}
