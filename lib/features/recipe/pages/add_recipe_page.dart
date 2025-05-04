import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_call_app/helpers/widget/add_ingredients_widget.dart';
import 'package:nutri_call_app/helpers/widget/add_steps_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_image_input.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_input.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class AddRecipePage extends HookConsumerWidget {
  const AddRecipePage({super.key});

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  void _showImagePickerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Ambil dari Kamera"),
              onTap: () {
                Navigator.pop(context);
                print("Ambil dari kamera dipilih");
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Pilih dari Galeri"),
              onTap: () {
                Navigator.pop(context);
                print("Pilih dari galeri dipilih");
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Recipe',
        onBack: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: RefreshIndicator(
          onRefresh: _refresh,
          color: AppColor.semiBlack,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImagePicker(
                  onTap: () => _showImagePickerModal(context),
                ),
                const Gap(16),
                const CustomTextInput(
                  label: "Title",
                  placeholder: "Enter Recipe Title",
                ),
                const Gap(8),
                AddIngredientsWidget(
                  onTap: () {
                    context.pushNamed(RouteName.addIngredientPage);
                  },
                ),
                const Gap(16),
                const AddStepsWidget(),
                const Gap(20),
                CustomButtonWidget(
                  text: 'Preview',
                  onTap: () {
                    context.pushNamed(RouteName.previewRecipePage);
                  },
                ),
                const Gap(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
