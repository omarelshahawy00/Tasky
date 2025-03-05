import 'package:flutter/material.dart';
import 'package:zbooma_to_do_app/features/auth/signup/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SignupViewBody()));
  }
}
