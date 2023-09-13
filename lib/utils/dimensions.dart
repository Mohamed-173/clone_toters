import 'dart:ui' as ui;

class Dimensions {
  static double devicePR = ui.window.devicePixelRatio;

  static double screenHeight = ui.window.physicalSize.height / devicePR;

  static double screenWidth = ui.window.physicalSize.width / devicePR;

  static double pageView = screenHeight / 2.44;
  static double pageViewContainer = screenHeight / 3.83;
  static double pageViewtextContainer = screenHeight / 7.03;

  //? heights
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.3;
  static double height20 = screenHeight / 42.2;
  static double height25 = screenHeight / 31.243;
  static double height30 = screenHeight / 28.1;
  static double height56 = screenHeight / 13.94;
  static double height250 = screenHeight / 3.12;

  //? heights
  static double width5 = screenHeight / 78.544;
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.3;
  static double width20 = screenHeight / 42.2;
  static double width25 = screenHeight / 31.2;

  //? icons height
  static double IconHeight10 = screenHeight / 78.1;
  static double IconHeight20 = screenHeight / 39.05;

  //? Radiuss
  static double radius10 = screenHeight / 84.4;
  static double radius15 = screenHeight / 56.3;
  static double radius20 = screenHeight / 42.2;
}
