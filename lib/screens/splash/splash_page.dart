import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/routes/routes_helpers.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    _loadResources();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 5),
        () => Get.offNamed(RoutesHelpers.getInitial()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation),
          Center(
              child: Image.asset(
            "assets/image/logo part 1.png",
            width: MediaQuery.of(context).size.width / 3,
          )),
          Center(
              child: Image.asset(
            "assets/image/logo part 2.png",
            width: MediaQuery.of(context).size.width / 3,
          )),
        ],
      ),
    );
  }
}
