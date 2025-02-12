import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/helpers/widget/custom_floating_field.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _refreshPage() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
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
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Gap(70),
                    Image.asset(
                      Assets.images.logoApp.path,
                      height: 180,
                    ),
                    const Gap(16),
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
                        color: AppColor.lightBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Gap(50),
                    const CustomFloatingTextField(label: 'Username'),
                    const Gap(20),
                    CustomFloatingTextField(
                      label: "Password",
                      controller: TextEditingController(),
                      isPassword: true, 
                    ),
                    const Gap(65),
                    GestureDetector(
                      onTap: (){
                        context.pushReplacement(RouteName.main);
                      },
                      child: const CustomButtonWidget(text: 'Log in'),
                    ), 
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColor.lightBlack,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(RouteName.signUpPage);
                          },
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColor.darkGreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
