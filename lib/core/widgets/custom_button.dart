import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.startIcon,
    this.endIcon,
    this.backgroundColor,
    this.width,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.margin,
  }) : assert(
         child != null || text != null,
         'Either child or text must be provided',
       );

  final void Function()? onPressed;
  final Widget? child; // New child widget parameter
  final String? text; // Made text optional
  final Widget? startIcon;
  final Widget? endIcon;
  final Color? backgroundColor;
  final double? width;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 0),
      child: Material(
        color: backgroundColor ?? ColorsManager.PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
          splashColor: Colors.grey.withOpacity(0.3),
          onTap: onPressed,
          child: Container(
            width:
                width ??
                (MediaQuery.of(context).size.width > 640
                    ? MediaQuery.of(context).size.width / 3
                    : double.infinity),
            padding:
                padding ?? EdgeInsets.symmetric(vertical: 15.h, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 4),
              border:
                  borderColor != null ? Border.all(color: borderColor!) : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (startIcon != null) ...[startIcon!, const Gap(8)],
                Flexible(
                  child:
                      child ??
                      Text(
                        text!,
                        style: Styles.textMDSemiBold.copyWith(color: textColor),
                        textAlign: TextAlign.center,
                      ),
                ),
                if (endIcon != null) ...[const Gap(8), endIcon!],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
