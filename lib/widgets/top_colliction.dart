import 'package:flutter/material.dart';
import 'package:toters_ui_clone/utils/colors.dart';
import 'package:toters_ui_clone/utils/dimensions.dart';
import 'package:toters_ui_clone/widgets/small_text.dart';

class TopCollictionWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double? height;
  final double? width;
  final double? iconSize;
  final double textSize;
  final Color? textColor;
  final Color? iconColor;
  final double? radius;

  TopCollictionWidget(
      {Key? key,
      required this.icon,
      required this.text,
      this.height = 0,
      this.width = 0,
      this.iconSize = 10,
      this.textColor = const Color(0xFF080808),
      this.iconColor = const Color(0xFF04b494),
      this.radius = 0,
      this.textSize = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
      height: height == 0 ? Dimensions.height20 * 2 : height,
      width: width == 0 ? Dimensions.width20 * 2 : width,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(radius == 0 ? Dimensions.radius15 : 15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black12.withOpacity(0.10))
          ]
          // color: Colors.amber,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon(
          //   icon,
          //   color: iconColor ?? AppColors.mainColor,
          //   size: iconSize,
          // ),
          Image.asset("assets/images/hamburger.png", width: iconSize),
          const SizedBox(
            height: 5,
          ),
          SmallText(
            text: text,
            color: textColor ?? Colors.black87,
            size: textSize == 0 ? Dimensions.height15 : textSize,
          ),
        ],
      ),
    );
  }
}
