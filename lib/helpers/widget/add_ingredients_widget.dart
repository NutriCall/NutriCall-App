import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class AddIngredientsWidget extends StatefulWidget {
  final VoidCallback? onTap;

  const AddIngredientsWidget({
    super.key,
    this.onTap,
  });

  @override
  State<AddIngredientsWidget> createState() => _AddIngredientsWidgetState();
}

class _AddIngredientsWidgetState extends State<AddIngredientsWidget> {
  List<int> ingredients = [];

  void _addIngredientField() {
    setState(() {
      ingredients.add(ingredients.length);
    });
  }

  void _removeIngredientField(int index) {
    setState(() {
      ingredients.removeAt(index);
    });
  }

  Widget _buildIngredientField(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.darkGreen, width: 1.5),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Text(
                "Add Ingredients ${index + 1}",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGreen,
                ),
              ),
            ),
          ),
        ),
        const Gap(6),
        Expanded(
          flex: 0,
          child: GestureDetector(
            onTap: () => _removeIngredientField(index),
            child: const Icon(
              Icons.remove_circle_rounded,
              color: AppColor.darkGreen,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ingredients",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.semiBlack,
              ),
            ),
            GestureDetector(
              onTap: _addIngredientField,
              child: const Icon(
                Icons.add_circle_rounded,
                color: AppColor.darkGreen,
              ),
            ),
          ],
        ),
        const Gap(8),
        ...List.generate(
          ingredients.length,
          (index) => _buildIngredientField(index),
        ),
      ],
    );
  }
}
