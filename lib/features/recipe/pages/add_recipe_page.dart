import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_description_input.dart';
import 'package:nutri_call_app/helpers/widget/custom_image_input.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_input.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class AddRecipePage extends HookConsumerWidget {
  const AddRecipePage({Key? key});

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
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
        padding: const EdgeInsets.all(16),
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const CustomImagePicker(),
                const SizedBox(height: 16),
                const CustomTextInput(
                  label: "Title",
                  placeholder: "Enter Recipe Title",
                ),
                const Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(RouteName.addIngredientPage);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.darkGreen, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Ingredients",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.grey),
                          ),
                        ),
                        const Icon(
                          Icons.add,
                          color: AppColor.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const CustomDescriptionInput(
                  label: "Step by Step",
                  placeholder: "Describe the steps...",
                ),
                const Gap(15),
                const CustomButtonWidget(text: 'Save')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
