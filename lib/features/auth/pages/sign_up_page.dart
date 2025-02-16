import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_floating_field.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_field.dart';
import 'package:nutri_call_app/helpers/widget/gender_dropdown.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  Future<void> _refreshPage() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Sign Up',
        onBack: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        color: AppColor.semiBlack,
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(30),
                const CustomFloatingTextField(label: 'Full Name'),
                const Gap(20),
                const CustomFloatingTextField(label: 'Username'),
                const Gap(20),
                const CustomFloatingTextField(label: 'Password'),
                const Gap(20),
                const Row(
                  children: [
                    Expanded(
                        child:
                            CustomTextField(label: 'Age', suffixText: 'Y.O')),
                    Gap(16),
                    Expanded(
                        child: CustomTextField(
                            label: 'Weight', suffixText: 'Kg')),
                    Gap(16),
                    Expanded(
                        child: CustomTextField(
                            label: 'Weight Target', suffixText: 'Kg')),
                  ],
                ),
                const Gap(20),
                const Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            label: 'Height', suffixText: 'cm')),
                    Gap(16),
                    Expanded(child: GenderDropdown()),
                    Gap(16),
                    Expanded(
                        child: CustomTextField(
                            label: 'BMI', suffixText: 'Kg/m2')),
                  ],
                ),
                const Gap(65),
                const CustomButtonWidget(text: 'Sign Up'),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account? ",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColor.lightBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(RouteName.loginPage);
                      },
                      child: Text(
                        'Sign In',
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
    );
  }
}
