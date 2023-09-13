import 'package:flutter/material.dart';
import 'package:toters_ui_clone/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  FontWeight? fontWeight;

  BigText({
    Key? key,
    this.color = const Color(0xFF080808),
    required this.text,
    this.fontWeight,
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.height20 : size,
        fontFamily: "Roboto",
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
