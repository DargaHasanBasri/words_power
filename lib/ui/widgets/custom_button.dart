import 'package:flutter/material.dart';
import 'package:words_power/utils/custom_colors.dart';

class CustomButton extends StatefulWidget {
  final Color? backgroundColor;
  final String title;
  final Function? onClick;
  final double borderRadius;

  CustomButton({super.key, Color? backgroundColor, String? title, double? borderRadius, Function? onClick})
      : title = title ?? "TEST",
        backgroundColor = backgroundColor ?? CustomColors.buttonBackground,
        borderRadius = borderRadius ?? 4.0,
        onClick = onClick ?? (() {});

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
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.title,
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
