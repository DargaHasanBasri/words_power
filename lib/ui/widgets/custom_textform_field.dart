import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:words_power/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    required this.controller,
    super.key,
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
    this.isHaveObscure = false,
  })  : inputType = inputType ?? TextInputType.text,
        textFieldBgColor = textFieldBgColor ?? Colors.transparent,
        textFieldTitle = textFieldName ?? '',
        hintText = hintText ?? '',
        borderRadius = borderRadius ?? 4,
        isAutoTrue = isAutoTrue ?? false,
        // ignore: unnecessary_null_in_if_null_operators
        inputFormatter = inputFormatter ?? null,
        multiline = multiline ?? false;
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

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getTextFieldTitle(),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isHaveObscure,
          autofocus: widget.isAutoTrue ?? false,
          keyboardType: widget.inputType,
          onChanged: _onChanged,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.backgroundColor,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: AppColors.textFormFieldBorderColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: AppColors.backgroundColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getTextFieldTitle() {
    if (widget.textFieldTitle.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              widget.textFieldTitle,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            if (widget.isRequired)
              const Text(
                '*',
                style: TextStyle(color: AppColors.black,),
              ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) {
      widget.onChanged?.call(value.trim());
    }
  }
}
