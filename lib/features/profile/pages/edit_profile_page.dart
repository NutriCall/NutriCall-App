import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_floating_field.dart';
import 'package:nutri_call_app/features/profile/widget/edit_profil_header.dart';
import 'package:nutri_call_app/helpers/widget/gender_dropdown.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_field.dart';
import 'package:nutri_call_app/utils/app_color.dart';

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
      appBar: CustomAppBar(
        title: 'Edit Profile',
        onBack: (){
          context.pop();
        },
      ),
      body: RefreshIndicator(
        color: AppColor.semiBlack,
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
                      Gap(6),
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
                      Expanded(
                          child: CustomTextField(
                              label: 'BMI', suffixText: 'Kg/m2')),
                    ],
                  ),
                  const Gap(100),
                  const CustomButtonWidget(text: 'Save')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
