import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/routes/routes_helpers.dart';
import 'package:food_delivery/screens/auth/sign_up.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../base/custom_snackbar.dart';
import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      // var authController = Get.find<AuthController>();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackbar("Type in your Email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackbar("Type in a valid email ", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackbar("Password can not be less than seven character",
            title: "Password");
      } else if (password.length < 7) {
        showCustomSnackbar("Alll went Well", title: "perpect");

        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RoutesHelpers.initial);
          } else {
            showCustomSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (authController) {
            return !authController.isLoading
                ? SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.25,
                          child: const Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage:
                                  AssetImage("assets/image/logo part 1.png"),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: Dimensions.width20),
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello",
                                style: TextStyle(
                                  fontSize: Dimensions.font20 * 3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Sign in to your account",
                                style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        AppTextField(
                            controller: emailController,
                            hintText: "Email",
                            icon: Icons.email),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        AppTextField(
                          controller: passwordController,
                          hintText: "Password",
                          icon: Icons.lock,
                          isObsecure: true,
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Dimensions.width25),
                          child: Row(
                            children: [
                              Expanded(child: Container()),
                              Text(
                                "Sign in to your account",
                                style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  color: Colors.grey[500],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.06,
                        ),
                        GestureDetector(
                          onTap: () {
                            _login(authController);
                            print("sign in tapped");
                          },
                          child: Container(
                            height: Dimensions.screenHeight / 13,
                            width: Dimensions.screenWidth / 2,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.mainColor,
                            ),
                            child: Center(
                                child: BigText(
                                    text: "Sign In",
                                    size: Dimensions.font26,
                                    color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.06,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Don\'t have an account?",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font26),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => Get.to(() => const SignUpPage()),
                                  text: "Create",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                      fontSize: Dimensions.font26),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  )
                : const CustomLoader();
          },
        ));
  }
}
