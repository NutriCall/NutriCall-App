import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/features/plan/controllers/post_calculate_nutrients_controller.dart';

class ItemDetailMealPage extends HookConsumerWidget {
  final String id;
  final String name;
  final String initialSize;
  final bool isEditable;
  final String type;

  const ItemDetailMealPage({
    super.key,
    required this.id,
    required this.name,
    this.initialSize = 'gram',
    this.isEditable = true,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeState = useState<int>(0);

    Future<void> _refresh() async {
      await Future.delayed(const Duration(seconds: 2));
    }

    useEffect(() {
      if (sizeState.value > 0) {
        Future.microtask(() {
          ref.read(postCalculateNutrientsNotifierProvider.notifier).fetch(
                params: CalculateNutrientParams(
                  namaBahan: name,
                  size: sizeState.value.toDouble(),
                ),
                onSuccess: (data) {
                  // Handle success logic here
                },
                onFailed: (err) {
                  // Handle failure logic here
                },
              );
        });
      }
      return null;
    }, []);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search Meal',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: AppColor.semiBlack,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  color: AppColor.semiBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Size per gram',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: AppColor.darkGreen,
                          ),
                        ),
                        const Gap(8),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter amount',
                            hintStyle: GoogleFonts.poppins(fontSize: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: AppColor.darkGreen),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 14),
                            suffixText: 'gram',
                            suffixStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: AppColor.darkGreen,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColor.darkGreen,
                            fontWeight: FontWeight.w500,
                          ),
                          onChanged: (val) {
                            sizeState.value = int.tryParse(val) ?? 0;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(30),
              CustomButtonWidget(
                text: 'Preview',
                onTap: () async {
                  await ref
                      .read(postCalculateNutrientsNotifierProvider.notifier)
                      .fetch(
                        params: CalculateNutrientParams(
                          namaBahan: name,
                          size: sizeState.value.toDouble(),
                        ),
                        onSuccess: (data) {
                          context.pushNamed(
                            RouteName.itemPreviewMealPage,
                            pathParameters: {
                              'id': data['id'].toString(),
                              'name': name,
                              'type': type,
                            },
                            extra: {
                              'size': data['size'],
                              'calories': data['energi'],
                              'carbs': data['karbohidrat'],
                              'protein': data['protein'],
                              'fat': data['lemak'],
                            },
                          );
                        },
                        onFailed: (err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Gagal: $err')),
                          );
                        },
                      );
                },
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
