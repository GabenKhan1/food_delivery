import 'package:food_delivery/screens/auth/sign_in_page.dart';
import 'package:food_delivery/screens/cart/cart_page.dart';
import 'package:food_delivery/screens/food/popular_food_detail.dart';
import 'package:food_delivery/screens/food/recomended_food_detail.dart';
import 'package:food_delivery/screens/home/home_page.dart';
import 'package:food_delivery/screens/splash/splash_page.dart';
import 'package:get/get.dart';

class RoutesHelpers {
  static const String splashPage = "/Splash";
  static const String initial = "/";
  static const String popularFood = "/popularfood";
  static const String recommendedFood = "/recommendedfood";
  static const String cartPage = "/cartpage";
  static const String signIn = "/signin";

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;

  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId = $pageId&page = $page ";
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId = $pageId&page = $page";
  static String getCartPage() => cartPage;
  static String getSignInPage() => signIn;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(name: initial, page: () => const HomePage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return PopularFoodDetail(
              pageId: int.parse(pageId!), page: page.toString());
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return RecomendedFoodDetail(
              pageId: int.parse(pageId ?? ""), page: page.toString());
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: signIn,
        page: () {
          return const SignInPage();
        },
        transition: Transition.fadeIn),
  ];
}
