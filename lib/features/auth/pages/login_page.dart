import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/auth/widget/app_logo.dart';
import 'package:nutri_call_app/helpers/widget/custom_prompt_text.dart';
import 'package:nutri_call_app/helpers/widget/custom_floating_field.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<void> _refreshPage() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.9, 0),
            end: Alignment.topCenter,
            colors: [AppColor.disabledGreen, AppColor.darkWhite],
          ),
        ),
        child: RefreshIndicator(
          onRefresh: _refreshPage,
          color: AppColor.semiBlack,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(120),
                  const AppLogo(height: 170),
                  const Gap(20),
                  Text(
                    'Welcome back!',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkGreen,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Let’s sign you in',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: AppColor.grey,
                    ),
                  ),
                  const Gap(40),
                  const CustomFloatingTextField(label: 'Username'),
                  const Gap(20),
                  const CustomFloatingTextField(label: 'Password'),
                  const Gap(30),
                  const CustomButtonWidget(text: 'Log in'),
                  const Gap(20),
                  CustomPromptText(
                    labelText: 'Don’t have an account? ',
                    actionText: 'Sign Up',
                    onPressed: () {
                      context.pushNamed(RouteName.signUpPage);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
