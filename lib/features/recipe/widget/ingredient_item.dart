import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class IngredientItem extends StatefulWidget {
  final String ingredientName;
  final int initialQuantity;

  const IngredientItem({
    Key? key,
    required this.ingredientName,
    this.initialQuantity = 1,
  }) : super(key: key);

  @override
  _IngredientItemState createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.ingredientName,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.darkGreen,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline,
                  color: AppColor.darkGreen),
              onPressed: decrement,
            ),
            Text(
              quantity.toString(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.darkGreen,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline,
                  color: AppColor.darkGreen),
              onPressed: increment,
            ),
          ],
        ),
      ],
    );
  }
}
