import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/features/recipe/domain/entities/list_ingredients_model.dart';
import 'package:nutri_call_app/features/recipe/controllers/get_ingredients_controller.dart';
import 'package:nutri_call_app/features/recipe/controllers/delete_ingredient_controller.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class AddIngredientsWidget extends HookConsumerWidget {
  final Future<ListIngredientsModel?> Function()? onTapPickIngredient;
  final void Function(List<ListIngredientsModel?>)? onChanged;

  const AddIngredientsWidget({
    super.key,
    this.onTapPickIngredient,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getIngredientsController =
        ref.watch(getIngredientsControllerProvider);

    final ValueNotifier<List<ListIngredientsModel?>> ingredients = useState([]);
    void _notifyChange() {
      if (onChanged != null) {
        print('Tes:${ingredients.value}');
        onChanged!(ingredients.value);
      }
    }

    useEffect(() {
      ref
          .read(getIngredientsControllerProvider.notifier)
          .fetch(type: "Ingredients");
      return null;
    }, []);

    getIngredientsController.whenData((data) {
      if (data != null) {
        ingredients.value = data;
        _notifyChange();
      }
    });

    void _addIngredientField() async {
      if (onTapPickIngredient != null) {
        final selected = await onTapPickIngredient!();
        if (selected != null) {
          ingredients.value.add(selected);
          _notifyChange();
        }
      }
    }

    void _removeIngredientField(int index) {
      ref.read(deleteIngredientControllerProvider.notifier).delete(
          id: ingredients.value[index]?.id ?? 0,
          onFailed: (_) {},
          onSuccess: () {});
      ingredients.value = [
        ...ingredients.value..removeAt(index),
      ];
      _notifyChange();
    }

    Widget _buildIngredientField(int index) {
      final ingredient = ingredients.value[index];

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.darkGreen, width: 1.5),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Text(
                ingredient != null
                    ? '${ingredient.namaBahan} (${ingredient.energi} kcal)'
                    : 'Add Ingredient...',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGreen,
                ),
              ),
            ),
          ),
          const Gap(6),
          GestureDetector(
            onTap: () => _removeIngredientField(index),
            child: const Icon(
              Icons.remove_circle_rounded,
              color: AppColor.darkGreen,
            ),
          ),
        ],
      );
    }

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
          ingredients.value.length,
          (index) => _buildIngredientField(index),
        ),
      ],
    );
  }
}
