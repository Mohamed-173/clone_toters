import 'package:flutter/material.dart';
import 'package:toters_ui_clone/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow textOverflow;
  final FontWeight fontWeight;

  SmallText({
    Key? key,
    this.color = const Color(0xFF080808),
    required this.text,
    this.fontWeight = FontWeight.w400,
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
        fontSize: size == 0 ? Dimensions.height10 : size,
        fontFamily: "Roboto",
        fontWeight: fontWeight,
      ),
    );
  }
}
