import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zbooma_to_do_app/core/theme/colors.dart';
import 'package:zbooma_to_do_app/core/theme/styles.dart';

class PhoneTextField extends StatelessWidget {
  final Function(String) onPhoneChanged;

  const PhoneTextField({super.key, required this.onPhoneChanged});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: '123 456-7890',
        hintStyle: Styles.textMDRegular.copyWith(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: ColorsManager.appBoardersColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: ColorsManager.appBoardersColor),
        ),
      ),
      initialCountryCode: 'EG',
      onChanged: (phone) => onPhoneChanged(phone.completeNumber),
    );
  }
}
