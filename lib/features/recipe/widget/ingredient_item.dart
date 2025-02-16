import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class IngredientItem extends StatefulWidget {
  final String ingredientName;
   final String ingredientWeight;
  final int initialQuantity;

  const IngredientItem({
    super.key,
    required this.ingredientName,
    required this.ingredientWeight,
    this.initialQuantity = 1,
  });

  @override
  _IngredientItemState createState() => _IngredientItemState();
}

class _IngredientItemState extends State<IngredientItem> {
  late int quantity;

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
          '${widget.ingredientName} (${widget.ingredientWeight})',
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColor.darkGreen,
          ),
        ),
        const Spacer(),
        Container(
          height: 40,
          width: 130,
          padding: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.darkGreen, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.remove_circle_rounded,
                  color: AppColor.darkGreen,
                  size: 20,
                ),
                onPressed: decrement,
              ),
              Text(
                quantity.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGreen,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: AppColor.darkGreen,
                  size: 20,
                ),
                onPressed: increment,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
