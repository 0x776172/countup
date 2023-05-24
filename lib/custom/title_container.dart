import 'package:countup/custom/text_fading_widget.dart';
import 'package:countup/design/style.dart';
import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    super.key,
    required this.title,
    required this.height,
    required this.radiusValue,
  });

  final double radiusValue;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: ColorStyle.baseColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 1,
            spreadRadius: 0.5,
            offset: Offset(0, 2.0),
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radiusValue),
          bottomRight: Radius.circular(radiusValue),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: AnimatedText(
          text: title,
        ),
      ),
    );
  }
}
