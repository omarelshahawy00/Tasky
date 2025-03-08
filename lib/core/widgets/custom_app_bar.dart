import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/utilss/assets_manager.dart';

import '../routes/routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: ColorsManager.appPrimaryColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: SvgPicture.asset(AssetsManager.logo, height: 30.h),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.profileView);
          },
          icon: Icon(Icons.person_outline, size: 30.r),
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.login_rounded, size: 30.r),
        ),
      ],
    );
  }
}
