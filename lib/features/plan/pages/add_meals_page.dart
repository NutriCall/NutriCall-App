import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_search_field.dart';
import 'package:nutri_call_app/features/plan/widget/meal_list_widget.dart';
import 'package:nutri_call_app/features/plan/widget/meal_item_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class AddMealsPage extends StatefulWidget {
  final String mealId;

  const AddMealsPage({super.key, required this.mealId});

  @override
  _AddMealsPageState createState() => _AddMealsPageState();
}

class _AddMealsPageState extends State<AddMealsPage> {
  TextEditingController searchController = TextEditingController();
  List<MealItem> allMeals = [
    MealItem(id: 1, name: 'Milk', kcal: 101),
    MealItem(id: 2, name: 'Banana', kcal: 210),
    MealItem(id: 3, name: 'Oats', kcal: 150),
    MealItem(id: 4, name: 'Egg', kcal: 155),
  ];
  List<MealItem> filteredMeals = [];

  XFile? _selectedImage;

  void _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera, color: AppColor.darkGreen),
                title: Text("Take a Photo",
                    style: GoogleFonts.poppins(color: AppColor.darkGreen)),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.photo_library, color: AppColor.darkGreen),
                title: const Text("Choose from Gallery",
                    style: TextStyle(color: AppColor.darkGreen)),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    filteredMeals = List.from(allMeals);
  }

  void _searchMeals(String query) {
    setState(() {
      filteredMeals = allMeals
          .where(
              (meal) => meal.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Meals',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.mealId,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton.icon(
                  onPressed: _showImagePickerOptions,
                  icon:
                      const Icon(Icons.add_a_photo, color: AppColor.darkGreen),
                  label: const Text("Add Image",
                      style: TextStyle(color: AppColor.darkGreen)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                ),
              ],
            ),
            if (_selectedImage != null)
              Image.file(File(_selectedImage!.path), height: 100),
            const SizedBox(height: 5),
            CustomSearchField(
              hintText: "Search meals..",
              controller: searchController,
              onSearch: () => _searchMeals(searchController.text),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: MealListWidget(
                meals: filteredMeals,
                onSelectionChanged: (selected) {},
              ),
            ),
            const SizedBox(height: 10),
            CustomButtonWidget(
              text: 'Save',
              onTap: () {
                context.pushNamed(RouteName.planPage);
              },
            )
          ],
        ),
      ),
    );
  }
}
