import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_call_app/core/provider/shared_preference_provider.dart';
import 'package:nutri_call_app/features/recipe/controllers/submit_recipe_controller.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_ingredients_model.dart';
import 'package:nutri_call_app/features/recipe/pages/add_ingredients_page.dart';
import 'package:nutri_call_app/helpers/widget/add_ingredients_widget.dart';
import 'package:nutri_call_app/helpers/widget/add_steps_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_text_input.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/shared_preferences_util.dart';
import 'package:permission_handler/permission_handler.dart';

class AddRecipePage extends HookConsumerWidget {
  const AddRecipePage({super.key});

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImage = useState<XFile?>(null);
    final submitController = ref.watch(submitRecipeControllerProvider.notifier);
    final titleController = useTextEditingController();
    final steps = useState<List<String>>([]);
    final ingredients = ValueNotifier<List<ListIngredientsModel>>([]);

    useEffect(() {
      titleController.text =
          SharedPreferencesUtil.getString("recipeTitleInput") ?? '';
      return null;
    }, []);

    Future<void> requestPermission() async {
      PermissionStatus cameraStatus = await Permission.camera.request();
      PermissionStatus galleryStatus = await Permission.photos.request();

      if (!cameraStatus.isGranted || !galleryStatus.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Camera and Gallery permissions are required")),
        );
      }
    }

    void handleSubmit() {
      print(titleController.text);
      print(steps.value);
      print(pickedImage.value?.path);
      print(ingredients.value.map((e) => e.compositionId).toList());
      if (pickedImage.value == null ||
          titleController.text.isEmpty ||
          ingredients.value.isEmpty ||
          steps.value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields')),
        );
        return;
      }

      final params = RecipeSubmitParams(
        title: titleController.text,
        ingredients: ingredients.value.map((e) => e.compositionId).toList(),
        steps: steps.value,
        image: File(pickedImage.value!.path),
      );

      submitController.submit(
        params: params,
        onSuccess: (data) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Recipe submitted successfully!')),
          );
          Future.microtask(() {
            context.pushNamed(RouteName.previewRecipePage, extra: data);
          });
        },
        onFailed: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error)),
          );
        },
      );
    }

    Future<void> pickImage(ImageSource source) async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image != null) {
        final File file = File(image.path);
        final int sizeInBytes = await file.length();
        final double sizeInMb = sizeInBytes / (1024 * 1024);
        if (sizeInMb > 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The image size should not exceed 2 MB.'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        pickedImage.value = image;
      }
    }

    void _handlePickImage(BuildContext context) async {
      await requestPermission();
      if (!context.mounted) return;

      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Capture from Camera"),
                onTap: () async {
                  Navigator.pop(context);
                  await pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  await pickImage(ImageSource.gallery);
                },
              ),
            ],
          );
        },
      );
    }

    return PopScope(
      onPopInvokedWithResult: (_, __) {
        SharedPreferencesUtil.remove("recipeTitleInput");
      },
      child: Scaffold(
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
                  Text(
                    "Image",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: AppColor.semiBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Gap(6),
                  GestureDetector(
                    onTap: () {
                      _handlePickImage(context); // Memanggil fungsi terpisah
                    },
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.darkGreen,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: pickedImage.value != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(pickedImage.value!.path),
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  height: 160,
                                ),
                              )
                            : Text(
                                'Add Image +',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.darkGreen,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const Gap(16),
                  CustomTextInput(
                    label: "Title",
                    placeholder: "Enter Recipe Title",
                    controller: titleController,
                    onChanged: (newValue) => SharedPreferencesUtil.setString(
                        "recipeTitleInput", newValue),
                  ),
                  const Gap(8),
                  AddIngredientsWidget(
                    onTapPickIngredient: () async {
                      final picked =
                          await Navigator.push<ListIngredientsModel?>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddIngredientsPage(),
                        ),
                      );
                      return picked;
                    },
                    onChanged: (selectedIngredients) {
                      ingredients.value = selectedIngredients
                          .where((e) => e != null)
                          .toList() as List<ListIngredientsModel>;
                    },
                  ),
                  const Gap(16),
                  AddStepsWidget(
                    onChanged: (updatedSteps) {
                      steps.value = updatedSteps;
                    },
                  ),
                  const Gap(20),
                  CustomButtonWidget(
                    text: 'Preview',
                    onTap: () {
                      handleSubmit();
                    },
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
