import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_call_app/features/profile/widget/profile_header_widget.dart';
import 'package:nutri_call_app/features/profile/widget/profile_detail_item_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Profile Page'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(50),
              ProfileHeader(
                imagePath: Assets.images.userProfile.path,
                name: 'Olivia Rodrigo',
                username: 'oliviarodrigo',
              ),
              const Gap(40),
              const Column(
                children: [
                  ProfileDetailItem(label: 'Age', value: '46 years old'),
                  ProfileDetailItem(label: 'Weight', value: '50 Kg'),
                  ProfileDetailItem(label: 'Height', value: '165 cm'),
                  ProfileDetailItem(label: 'Gender', value: 'Female'),
                  ProfileDetailItem(label: 'BMI', value: '18.4 Kg/m2'),
                ],
              ),
              const Gap(60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButtonWidget(
                          text: 'Edit',
                          backgroundColor: AppColor.darkGreen,
                          textColor: Colors.white,
                          onTap: () {
                            context.pushNamed(RouteName.editProfilePage);
                          },
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: CustomButtonWidget(
                          text: 'Logout',
                          isOutlined: true,
                          borderColor: AppColor.darkGreen,
                          textColor: AppColor.darkGreen,
                          onTap: () {
                            context.pushNamed(RouteName.loginPage);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
