import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutri_call_app/features/plan/controllers/get_composition_controllers.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_search_field.dart';
import 'package:nutri_call_app/features/plan/widget/meal_list_widget.dart';
import 'package:nutri_call_app/features/plan/widget/meal_item_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class AddMealsPage extends ConsumerStatefulWidget {
  final String mealId;

  const AddMealsPage({super.key, required this.mealId});

  @override
  _AddMealsPageState createState() => _AddMealsPageState();
}

class _AddMealsPageState extends ConsumerState<AddMealsPage> {
  TextEditingController searchController = TextEditingController();
  List<MealItem> allMeals = [
    MealItem(id: 1, name: 'Milk', kcal: 101),
    MealItem(id: 2, name: 'Banana', kcal: 210),
    MealItem(id: 3, name: 'Oats', kcal: 150),
    MealItem(id: 4, name: 'Egg', kcal: 155),
  ];

  XFile? _selectedImage;

  OverlayEntry? overlayEntry;

  void _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  late String _lastSearchQuery = '';
  void _debouncedSearch(String query) {
    if (query.isEmpty) {
      if (overlayEntry != null) {
        overlayEntry?.remove();
        overlayEntry = null;
      }
      ref.read(fetchCompositionControllersProvider.notifier).clear();

      return;
    }

    if (_lastSearchQuery != query) {
      _lastSearchQuery = query;
      _searchMeals(query);
      _searchCompositions(query);
    }
  }

  void _searchMeals(String query) {
    if (overlayEntry != null) {
      overlayEntry?.remove();
      overlayEntry = null;
    }
  }

  void _searchCompositions(String query) {
    ref
        .read(fetchCompositionControllersProvider.notifier)
        .fetch(namaBahan: query);
  }

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        _debouncedSearch(searchController.text);
      });
    });
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Meal',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.mealId,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.semiBlack),
                  ),
                  TextButton.icon(
                    onPressed: _showImagePickerOptions,
                    icon: const Icon(Icons.add_a_photo,
                        color: AppColor.darkGreen),
                    label: Text("Add Image",
                        style: GoogleFonts.poppins(
                            color: AppColor.darkGreen,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                    ),
                  ),
                ],
              ),
              if (_selectedImage != null)
                Image.file(File(_selectedImage!.path), height: 100),
              const Gap(5),
              CustomSearchField(
                hintText: "Search meals..",
                controller: searchController,
                onSearch: () {
                  _debouncedSearch(searchController.text);
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(fetchCompositionControllersProvider);
                  return Column(
                    children: [
                      if (state is AsyncLoading &&
                          state.value != null &&
                          state.value!.isEmpty)
                        const CircularProgressIndicator(
                          color: AppColor.darkGreen,
                        ),
                      if (state is AsyncData &&
                          state.value != null &&
                          state.value!.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.value!.length,
                          itemBuilder: (context, index) {
                            final composition = state.value![index];
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      composition.namaBahan ?? "",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: AppColor.darkGreen,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.north_east,
                                    size: 20,
                                    color: AppColor.darkGreen,
                                  ),
                                ],
                              ),
                              onTap: () {},
                            );
                          },
                        ),
                      if (state is AsyncError)
                        Text(state.error.toString(),
                            style: const TextStyle(color: Colors.red)),
                    ],
                  );
                },
              ),
              const Gap(20),
              SizedBox(
                height: 300,
                child: MealListWidget(
                  meals: allMeals,
                  onSelectionChanged: (selected) {},
                ),
              ),
              CustomButtonWidget(
                text: 'Save',
                onTap: () {
                  context.pushNamed(RouteName.planPage);
                },
              ),
              const Gap(20),
            ],
          )),
    );
  }
}
