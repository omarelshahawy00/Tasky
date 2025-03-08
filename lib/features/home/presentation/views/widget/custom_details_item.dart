import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';

class CustomDetailsItem extends StatelessWidget {
  final bool showLable;
  final Text title;
  final Color backgroundColor;
  final Color iconColor;
  final Widget? iconButton;
  final String? lableTitle;

  const CustomDetailsItem({
    super.key,
    required this.title,
    this.backgroundColor = const Color(0xFFF3ECFF),
    this.iconColor = const Color(0xFF7B4BDB),
    this.iconButton,
    this.showLable = false,
    this.lableTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showLable
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lableTitle ?? 'End Date',
                    style: Styles.textXSRegular.copyWith(color: Colors.black54),
                  ),
                  SizedBox(height: 4.h),
                  title,
                ],
              )
              : title,
          iconButton ?? SizedBox(),
        ],
      ),
    );
  }
}
