import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_floating_field.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/features/profile/widget/edit_profil_header.dart';
import 'package:nutri_call_app/helpers/widget/gender_dropdown.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(color: AppColor.darkGreen),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(
                color: AppColor.darkGrey,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: const ProfileHeader(),
                  ),
                  const Gap(40),
                  const CustomFloatingTextField(label: 'Name'),
                  const Gap(20),
                  const CustomFloatingTextField(label: 'Username'),
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
                  const Gap(100),
                  const Row(
                    children: [
                      Expanded(
                        child: CustomButtonWidget(
                          text: 'Save',
                          backgroundColor: AppColor.darkGreen,
                          textColor: Colors.white,
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
    );
  }
}
