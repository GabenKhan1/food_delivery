import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/routes/routes_helpers.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class ProfilePAge extends StatelessWidget {
  const ProfilePAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIin = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIin) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(text: "Profile", size: 24, color: Colors.white),
        ),
        body: GetBuilder<UserController>(
          builder: (userController) {
            return _userLoggedIin
                ? (userController.isLoading
                    ? Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: Dimensions.height20),
                        child: Column(
                          children: [
                            //profile Icon
                            AppIcon(
                              icon: Icons.person,
                              backgroundColor: AppColors.mainColor,
                              iconColor: Colors.white,
                              iconSize:
                                  Dimensions.height45 + Dimensions.height30,
                              size: Dimensions.height45 * 3,
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    //Name
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.person,
                                          backgroundColor: AppColors.mainColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height30,
                                          size: Dimensions.height45,
                                        ),
                                        bigText: BigText(
                                          text: userController.userModel.name,
                                        )),
                                    SizedBox(
                                      height: Dimensions.height30,
                                    ),
                                    //phone
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.phone,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height30,
                                          size: Dimensions.height45,
                                        ),
                                        bigText: BigText(
                                          text: userController.userModel.phone,
                                        )),
                                    SizedBox(
                                      height: Dimensions.height30,
                                    ),
                                    //email
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.email,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height30,
                                          size: Dimensions.height45,
                                        ),
                                        bigText: BigText(
                                          text: userController.userModel.email,
                                        )),
                                    SizedBox(
                                      height: Dimensions.height30,
                                    ),
                                    //address
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.location_on,
                                          backgroundColor: AppColors.mainColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height30,
                                          size: Dimensions.height45,
                                        ),
                                        bigText: BigText(
                                          text: "Pakistan",
                                        )),
                                    SizedBox(
                                      height: Dimensions.height30,
                                    ),
                                    //message
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.message_outlined,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.height30,
                                          size: Dimensions.height45,
                                        ),
                                        bigText: BigText(
                                          text: userController
                                              .userModel.orderCount
                                              .toString(),
                                        )),
                                    SizedBox(
                                      height: Dimensions.height30,
                                    ),
                                    //log out
                                    GestureDetector(
                                      onTap: () {
                                        if (Get.find<AuthController>()
                                            .userLoggedIn()) {
                                          Get.find<AuthController>()
                                              .clearSharedData();
                                          Get.find<CartController>().clear();
                                          Get.find<CartController>()
                                              .clearCartHistory();
                                          Get.offNamed(
                                              RoutesHelpers.getSignInPage());
                                        }
                                      },
                                      child: AccountWidget(
                                          appIcon: AppIcon(
                                            icon: Icons.logout,
                                            backgroundColor: Colors.red,
                                            iconColor: Colors.white,
                                            iconSize: Dimensions.height30,
                                            size: Dimensions.height45,
                                          ),
                                          bigText: BigText(
                                            text: "Log Out",
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
                    : const CustomLoader())
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height30 * 6,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/image/signintocontinue.png"))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesHelpers.getSignInPage());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height30 * 6,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: Center(
                              child: BigText(
                                text: "Sign In",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ));
  }
}
