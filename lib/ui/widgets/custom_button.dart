import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Color? backgroundColor;
  final String title;
  final Function? onClick;
  final double borderRadius;

  CustomButton(
      {super.key,
      Color? backgroundColor,
      String? title,
      double? borderRadius,
      Function? onClick})
      : title = title ?? "TEST",
        backgroundColor = backgroundColor ?? Colors.black,
        borderRadius = borderRadius ?? 24.0,
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
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
