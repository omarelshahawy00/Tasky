import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';
import 'package:zbooma_to_do_app/features/home/presentation/views/widget/custom_details_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
      child: Column(
        spacing: 8.h,
        children: [
          CustomDetailsItem(
            title: Text(
              "Omar Mahmoud",
              style: Styles.textXLBold.copyWith(color: Colors.grey),
            ),
            backgroundColor: Color(0xfff5f5f5),
            showLable: true,
            lableTitle: 'NAME',
          ),
          CustomDetailsItem(
            title: Text(
              "+20 123 456-7890",
              style: Styles.textXLBold.copyWith(color: Colors.grey),
            ),
            backgroundColor: Color(0xfff5f5f5),
            showLable: true,
            lableTitle: 'PHONE',
            iconButton: Icon(
              Icons.copy_rounded,
              color: ColorsManager.appPrimaryColor,
            ),
          ),
          CustomDetailsItem(
            title: Text(
              "Senior",
              style: Styles.textXLBold.copyWith(color: Colors.grey),
            ),
            backgroundColor: Color(0xfff5f5f5),
            showLable: true,
            lableTitle: 'LEVEL',
          ),
          CustomDetailsItem(
            title: Text(
              "7 years",
              style: Styles.textXLBold.copyWith(color: Colors.grey),
            ),
            backgroundColor: Color(0xfff5f5f5),
            showLable: true,
            lableTitle: 'Years of experience',
          ),
          CustomDetailsItem(
            title: Text(
              "Mansoura",
              style: Styles.textXLBold.copyWith(color: Colors.grey),
            ),
            backgroundColor: Color(0xfff5f5f5),
            showLable: true,
            lableTitle: 'Location',
          ),
        ],
      ),
    );
  }
}
