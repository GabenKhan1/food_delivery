import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/base/custom_snackbar.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/models/sign_up_model.dart';
import 'package:food_delivery/routes/routes_helpers.dart';
import 'package:food_delivery/screens/home/home_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    var nameController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];
    void _registration(AuthController authController) {
      // var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackbar("Type in your Name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackbar("Type in your Phone Number", title: "Phone");
      } else if (email.isEmpty) {
        showCustomSnackbar("Type in your Email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackbar("Type in a valid email ", title: "Email");
      } else if (password.isEmpty) {
        showCustomSnackbar("Password can not be less than seven character",
            title: "Password");
      } else if (password.length < 7) {
        showCustomSnackbar("Alll went Well", title: "perpect");
        SignUpModel signUpModel = SignUpModel(
            name: name, phone: phone, email: email, password: password);
        authController.registration(signUpModel).then((status) {
          if (status.isSuccess) {
            log("Success registeritation");
            Get.offNamed(RoutesHelpers.initial);
          } else {
            showCustomSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
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
                    AppTextField(
                        controller: nameController,
                        hintText: "Name",
                        icon: Icons.person),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                        controller: phoneController,
                        hintText: "Phone",
                        icon: Icons.phone),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    InkWell(
                      onTap: () {
                        _registration(_authController);
                        print("signup selected");
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
                                text: "Sign Up",
                                size: Dimensions.font26,
                                color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: "Have an Account already?",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20))),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.03,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Sign Up Using one of the following Methods",
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font16))),
                    Wrap(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CircleAvatar(
                                  radius: Dimensions.radius30,
                                  backgroundImage: AssetImage(
                                      "assets/image/" + signUpImages[index]),
                                ),
                              )),
                    )
                  ]),
                )
              : const CustomLoader();
        },
      ),
    );
  }
}
