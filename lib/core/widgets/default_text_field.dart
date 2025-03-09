import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart' show Styles;

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    this.isPassword,
    this.shadow,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.maxLines,
    this.inputFormatters,
    this.onChanged,
    this.hintStyle,
    super.key,
    this.suffixIcon,
    this.suffix,
    this.suffixText,
    this.enabled,
    this.contentPadding,
    this.fillColor,
    this.width,
    this.height,
  });

  final String hintText;
  final bool? enabled;
  final double? contentPadding;
  final String? suffixText;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon, suffix;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextStyle? hintStyle;
  final List<BoxShadow>? shadow;
  final double? width;
  final double? height;

  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,

      // height: height ?? 50.h,
      decoration: const BoxDecoration(
        // boxShadow: shadow ??
        //     [
        //       BoxShadow(
        //         color: Colors.grey.withOpacity(0.5),
        //         spreadRadius: 0,
        //         blurRadius: 9,

        //         offset: const Offset(0, 1), // changes position of shadow
        //       ),
        //     ],
      ),
      child: TextFormField(
        enabled: enabled,
        obscureText: isPassword ?? false,
        controller: controller,
        // validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          errorMaxLines: 2,
          errorStyle: const TextStyle(height: 0.0),
          disabledBorder: customOutlinedBorder(),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 50,
            maxWidth: 50,
          ),
          hintText: hintText,
          prefixIconColor: ColorsManager.appBoardersColor,
          hintStyle:
              hintStyle ??
              Styles.displayMediumMedium.copyWith(
                textBaseline: TextBaseline.ideographic,
                color: Color(0xff7f7f7f), // Default hint text color
                fontSize: 14,
              ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: prefixIcon,
          ),
          suffixIcon: suffixIcon,
          suffixText: suffixText,
          suffix: suffix,
          fillColor: fillColor ?? Colors.white,
          filled: true,
          constraints: const BoxConstraints(),
          enabledBorder: customOutlinedBorder(
            color: ColorsManager.appBoardersColor,
          ),
          focusedBorder: customOutlinedBorder(
            color: ColorsManager.appBoardersColor,
          ),
          errorBorder: customOutlinedBorder(color: Colors.red),
          focusedErrorBorder: customOutlinedBorder(
            color: Colors.red,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: contentPadding ?? 16),
        ),
      ),
    );
  }
}

OutlineInputBorder customOutlinedBorder({Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.red),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );
}
