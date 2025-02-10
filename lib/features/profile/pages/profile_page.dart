import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_call_app/features/home/pages/home_page.dart';
import 'package:nutri_call_app/features/profile/widget/profile_header_widget.dart';
import 'package:nutri_call_app/features/profile/widget/profile_detail_item_widget.dart';
import 'package:nutri_call_app/features/profile/widget/action_buttons_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Profile Page',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Gap(50),
              ProfileHeader(
                imagePath: Assets.images.userProfile.path,
                name: 'Olivia Rodrigo',
                username: 'oliviarodrigo',
              ),
              const Gap(30),
              const ProfileDetailItem(label: 'Age', value: '46 years old'),
              const ProfileDetailItem(label: 'Weight', value: '50 Kg'),
              const ProfileDetailItem(label: 'Height', value: '165 cm'),
              const ProfileDetailItem(label: 'Gender', value: 'Female'),
              const ProfileDetailItem(label: 'BMI', value: '18.4 Kg/m2'),
              const Gap(70),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ProfileActionButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
