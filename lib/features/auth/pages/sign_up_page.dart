import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_floating_field.dart';
import 'package:nutri_call_app/helpers/widget/custom_prompt_text.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_field.dart';
import 'package:nutri_call_app/helpers/widget/gender_dropdown.dart';
import 'package:nutri_call_app/routers/router_name.dart';

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
      body: Container(
        child: RefreshIndicator(
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
                      SizedBox(width: 16),
                      Expanded(
                          child: CustomTextField(
                              label: 'Weight', suffixText: 'Kg')),
                      SizedBox(width: 16),
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
                      SizedBox(width: 16),
                      Expanded(child: GenderDropdown()),
                      SizedBox(width: 16),
                      Expanded(
                          child: CustomTextField(
                              label: 'BMI', suffixText: 'Kg/m2')),
                    ],
                  ),
                  const Gap(60),
                  const CustomButtonWidget(text: 'Sign Up'),
                  const Gap(20),
                  CustomPromptText(
                    labelText: 'Have an account? ',
                    actionText: 'Sign In',
                    onPressed: () {
                      context.pushNamed(RouteName.loginPage);
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
