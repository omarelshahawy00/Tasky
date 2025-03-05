import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zbooma_to_do_app/core/routes/routes.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';
import 'package:zbooma_to_do_app/core/utilss/assets_manager.dart';
import 'package:zbooma_to_do_app/core/widgets/custom_button.dart';
import 'package:zbooma_to_do_app/core/widgets/default_text_field.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/views/widgets/phone_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          children: [
            Image.asset(
              AssetsManager.onboarding2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.6,
                left: 24.5.w,
                right: 24.5.w,
                bottom: 32.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login', style: Styles.displayLargeBold),
                  Gap(24.h),
                  PhoneTextField(onPhoneChanged: (p0) {}),
                  Gap(10.h),
                  DefaultTextField(
                    hintText: 'Password',
                    isPassword: true,
                    suffixIcon: Icon(Icons.visibility_outlined),
                  ),
                  Gap(24.h),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.homeView);
                    },
                    backgroundColor: ColorsManager.appPrimaryColor,
                    borderRadius: 10.r,
                    child: Text(
                      'Login',
                      style: Styles.textLBold.copyWith(color: Colors.white),
                    ),
                  ),
                  Gap(24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Didn\'t have any account?',
                        style: Styles.textMDBold,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signupView);
                        },
                        child: Text(
                          'Sign Up here',
                          style: Styles.textMDBold.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
