import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zbooma_to_do_app/core/routes/routes.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';
import 'package:zbooma_to_do_app/core/utils/assets_manager.dart';
import 'package:zbooma_to_do_app/core/widgets/custom_button.dart';
import 'package:zbooma_to_do_app/core/widgets/default_text_field.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/login_models/login_request_model.dart';
import 'package:zbooma_to_do_app/features/auth/login/presentation/manager/cubit/login_cubit.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/views/widgets/phone_text_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login', style: Styles.displayLargeBold),
                    Gap(24.h),
                    PhoneTextField(
                      onPhoneChanged: (p0) {
                        phoneController.text = p0;
                      },
                    ),
                    Gap(10.h),
                    DefaultTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      isPassword: true,
                      suffixIcon: Icon(Icons.visibility_outlined),
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    Gap(24.h),
                    CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().userLogin(
                            LoginRequestModel(
                              phone: phoneController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
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
            ),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, Routes.homeView);
                } else if (state is LoginError) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errMessage)));
                } else if (state is LoginLoading) {
                  showDialog(
                    context: context,
                    builder:
                        (context) => const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AlertDialog(
                                content: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            ],
                          ),
                        ),
                  );
                }
              },
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
