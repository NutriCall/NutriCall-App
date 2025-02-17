import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/recipe/widget/ingredient_item.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_search_field.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class AddIngredientsPage extends StatefulWidget {
  const AddIngredientsPage({super.key});

  @override
  _AddIngredientsPageState createState() => _AddIngredientsPageState();
}

class _AddIngredientsPageState extends State<AddIngredientsPage> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> ingredients = [
    {"name": "Bawang Putih", "weight": "40 gr", "quantity": 1},
    {"name": "Bawang Merah", "weight": "20 gr", "quantity": 2},
    {"name": "Garam", "weight": "15 gr", "quantity": 1},
  ];

  List<Map<String, dynamic>> filteredIngredients = [];

  @override
  void initState() {
    super.initState();
    filteredIngredients = List.from(ingredients);
  }

  Future<void> _refreshIngredients() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  void searchIngredients() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Ingredients',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ingredients",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.semiBlack),
            ),
            const Gap(10),
            CustomSearchField(
              hintText: "Search ingredients..",
              controller: searchController,
              onSearch: searchIngredients,
            ),
            const Gap(20),
            Text(
              "List of Ingredients",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.semiBlack),
            ),
            Expanded(
              child: RefreshIndicator(
                color: AppColor.semiBlack,
                onRefresh: _refreshIngredients,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: filteredIngredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = filteredIngredients[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: IngredientItem(
                        ingredientName: ingredient["name"],
                        ingredientWeight: ingredient["weight"],
                        initialQuantity: ingredient["quantity"],
                      ),
                    );
                  },
                ),
              ),
            ),
            const Gap(20),
            CustomButtonWidget(
              text: 'Save',
              onTap: () {
                context.pushNamed(RouteName.addRecipePage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
