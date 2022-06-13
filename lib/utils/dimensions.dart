import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.72;
  static double pageView = screenHeight / 2.56;
  static double pageViewTextContainer = screenHeight / 6.83;

  //dynamic height for padding and margin
  static double height10 = screenHeight / 82;
  static double height15 = screenHeight / 54.66;
  static double height20 = screenHeight / 41;
  static double height25 = screenHeight / 32.8;
  static double height30 = screenHeight / 27.33;
  static double height45 = screenHeight / 18.22;

  //dynamic width for padding and margin
  static double width10 = screenHeight / 82;
  static double width15 = screenHeight / 54.66;
  static double width20 = screenHeight / 41;
  static double width25 = screenHeight / 32.8;
  static double width30 = screenHeight / 27.33;

  static double font16 = screenHeight / 51.25;
  static double font20 = screenHeight / 41;
  static double font26 = screenHeight / 31.53;

  //radius
  static double radius15 = screenHeight / 54.66;
  static double radius20 = screenHeight / 41;
  static double radius30 = screenHeight / 27.33;
  //iconSize
  static double iconSize16 = screenHeight / 51.25;
  static double iconSize24 = screenHeight / 34.16;
  //listView size
  static double listViewImgSize = screenWidth / 3.42;
  static double listViewTextCont = screenWidth / 4.11;

  static double popularFoodImgSz = screenWidth / 2.34;


  //bottom height
  static double bottomHeightBar = screenHeight / 6.83;

}