import 'package:flutter/material.dart';
import 'package:tuchtrip_staff_portal/utils/text_styles.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Gradient? gradient;
  final double height;
  final double width;
  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: width * 0.87,
        decoration: BoxDecoration(
          color: Colors.blue,
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(text, style: mediumTextstylewhitebold),
        ),
      ),
    );
  }
}
