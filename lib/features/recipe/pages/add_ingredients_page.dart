import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/recipe/widget/ingredient_item.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_search_field.dart';
import 'package:nutri_call_app/routers/router_name.dart';

class AddIngredientsPage extends StatefulWidget {
  const AddIngredientsPage({Key? key}) : super(key: key);

  @override
  _AddIngredientsPageState createState() => _AddIngredientsPageState();
}

class _AddIngredientsPageState extends State<AddIngredientsPage> {
  final TextEditingController searchController = TextEditingController();
  List<String> ingredients = [
    'Bawang Putih',
    'Bawang Merah',
    'Garam',
    'Gula',
    'Merica',
    'Kecap',
    'Saus Tiram',
    'Saus Tomat',
    'Minyak Goreng',
    'Minyak Wijen',
    'Kunyit',
    'Ketumbar',
    'Jahe',
    'Kemiri',
    'Serai',
  ];

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ingredients",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomSearchField(
                  hintText: "Search ingredients..",
                  controller: searchController,
                  onSearch: searchIngredients,
                ),
                const SizedBox(height: 16),
                Text(
                  "List of Ingredients",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshIngredients,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: ingredients
                    .map((ingredient) =>
                        IngredientItem(ingredientName: ingredient))
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: CustomButtonWidget(
              text: 'Save',
              onTap: () {
                context.pushNamed(RouteName.addRecipePage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
