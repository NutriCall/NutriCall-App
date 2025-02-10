import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nutri_call_app/features/profile/widget/profile_header_widget.dart';
import 'package:nutri_call_app/features/profile/widget/profile_detail_item_widget.dart';
import 'package:nutri_call_app/features/profile/widget/action_buttons_widget.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profile Page',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: AppColor.darkGreen,
                  ),
                ),
              ),
              const Gap(40),
              const ProfileHeader(
                imagePath: 'assets/images/profile_picture.png',
                name: 'Olivia Rodrigo',
                username: 'oliviarodrigo',
              ),
              const Gap(30),
              ProfileDetailItem(label: 'Age', value: '46 years old'),
              ProfileDetailItem(label: 'Weight', value: '50 Kg'),
              ProfileDetailItem(label: 'Height', value: '165 cm'),
              ProfileDetailItem(label: 'Gender', value: 'Female'),
              ProfileDetailItem(label: 'BMI', value: '18.4 Kg/m2'),
              const Gap(70),
              const ProfileActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
