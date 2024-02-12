import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String textFieldTitle;
  final double borderRadius;
  final Function? onChanged;
  final Function? onObscureChanged;
  final bool? isEnabled;
  final bool? multiline;
  final TextInputType inputType;
  final Color textFieldBgColor;
  final TextInputFormatter? inputFormatter;
  final bool? isAutoTrue;
  final bool isRequired;
  final bool isHaveObscure;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      String? hintText,
      String? textFieldName,
      double? borderRadius,
      bool? multiline,
      TextInputType? inputType,
      Color? textFieldBgColor,
      TextInputFormatter? inputFormatter,
      this.isEnabled,
      this.onChanged,
      this.onObscureChanged,
      bool? isAutoTrue,
      this.isRequired = false,
      this.isHaveObscure = false})
      : inputType = inputType ?? TextInputType.text,
        textFieldBgColor = textFieldBgColor ?? Colors.transparent,
        textFieldTitle = textFieldName ?? "",
        hintText = hintText ?? "",
        borderRadius = borderRadius ?? 24.0,
        isAutoTrue = isAutoTrue ?? false,
        // ignore: unnecessary_null_in_if_null_operators
        inputFormatter = inputFormatter ?? null,
        multiline = multiline ?? false;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getTextFieldTitle(),
        const SizedBox(height: 10),
        TextFormField(
          controller: widget.controller,
          autofocus: widget.isAutoTrue ?? false,
          keyboardType: widget.inputType,
          onChanged: _onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  getTextFieldTitle() {
    if (widget.textFieldTitle.isNotEmpty) {
      return Row(
        children: [
          Text(
            widget.textFieldTitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          if (widget.isRequired)
            const Text(
              "*",
              style: TextStyle(color: Colors.black),
            ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) widget.onChanged!(value.trim());
  }
}
