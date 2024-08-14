import 'package:flutter/material.dart';
import 'package:words_power/utils/app_colors.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    super.key,
    Color? backgroundColor,
    Color? titleColor,
    String? title,
    double? borderRadius,
    VoidCallback? onClick,
  })  : title = title ?? 'TEST',
        backgroundColor = backgroundColor ?? AppColors.buttonBackground,
        titleColor = titleColor ?? AppColors.white,
        borderRadius = borderRadius ?? 4.0,
        onClick = onClick ?? (() {});
  final Color? backgroundColor;
  final Color? titleColor;
  final String title;
  final VoidCallback? onClick;
  final double borderRadius;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick?.call(),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.titleColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
