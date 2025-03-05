import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart' show ColorsManager;
import 'package:zbooma_to_do_app/core/theme/styles.dart' show Styles;
import 'package:zbooma_to_do_app/core/utilss/assets_manager.dart';
import 'package:zbooma_to_do_app/core/widgets/custom_button.dart';
import 'package:zbooma_to_do_app/core/widgets/default_text_field.dart';
import 'package:zbooma_to_do_app/features/auth/data/models/signup_request_model.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/views/widgets/experience_drop_down_list.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/views/widgets/phone_text_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _yearsOfExperience = TextEditingController();
  String? _phoneNumber;

  void _onSignup() {
    if (_formKey.currentState!.validate() && _phoneNumber != null) {
      final signupRequest = SignupRequestModel(
        displayName: _nameController.text,
        phone: _phoneNumber!,
        level: _experienceController.text,
        address: _addressController.text,
        password: _passwordController.text,
        experienceYears: int.parse(_yearsOfExperience.text),
      );

      context.read<SignupCubit>().userSignup(signupRequest);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Signup Successful!")));
        } else if (state is SignupError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.failure)));
        }
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: height),
          child: Stack(
            children: [
              Image.asset(
                AssetsManager.onboarding3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.32),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sign Up', style: Styles.displayLargeBold),
                        Gap(24.h),
                        DefaultTextField(
                          hintText: 'Name...',
                          controller: _nameController,
                          validator:
                              (value) =>
                                  value!.isEmpty ? "Name is required" : null,
                        ),

                        Gap(20.h),
                        PhoneTextField(
                          onPhoneChanged: (phone) => _phoneNumber = phone,
                        ),
                        Gap(10.h),
                        DefaultTextField(
                          hintText: 'Years of experience...',
                          controller: _yearsOfExperience,
                          validator:
                              (value) =>
                                  value!.isEmpty ? "Name is required" : null,
                        ),
                        Gap(20.h),
                        ExperienceDropDownList(
                          onSelected:
                              (level) => _experienceController.text = level,
                        ),
                        Gap(20.h),
                        DefaultTextField(
                          hintText: 'Address...',
                          controller: _addressController,
                          validator:
                              (value) =>
                                  value!.isEmpty ? "Address is required" : null,
                        ),
                        Gap(20.h),
                        DefaultTextField(
                          hintText: 'Password',
                          isPassword: true,
                          controller: _passwordController,
                          validator:
                              (value) =>
                                  (value!.length < 6)
                                      ? "Password must be 6+ characters"
                                      : null,
                        ),
                        Gap(24.h),
                        BlocBuilder<SignupCubit, SignupState>(
                          builder: (context, state) {
                            return CustomButton(
                              onPressed:
                                  state is SignupLoading ? null : _onSignup,
                              backgroundColor: ColorsManager.appPrimaryColor,
                              borderRadius: 10.r,
                              child:
                                  state is SignupLoading
                                      ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                      : Text(
                                        'Sign Up',
                                        style: Styles.textLBold.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                            );
                          },
                        ),
                        Gap(24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: Styles.textMDBold,
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Login',
                                style: Styles.textMDBold.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(32.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
