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
import 'package:nutri_call_app/helpers/widget/custom_text_field.dart';

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
    final TextEditingController sizeController = useTextEditingController();

    final isTouched = useState({
      'size': false,
    });

    final isButtonEnabled = useState(false);
    final isLoading = useState(false);

    void validateInputs() {
      bool isValid = sizeController.text.isNotEmpty;

      isButtonEnabled.value = isValid;

      print("Button Enabled: $isButtonEnabled");
    }

    useEffect(() {
      sizeController.addListener(() {
        validateInputs();
        isTouched.value = {...isTouched.value, 'fullName': true};
      });
      return () {
        sizeController.removeListener(() {
          validateInputs();
        });
      };
    }, [sizeController]);

    final postCalculateNutrient =
        ref.read(postCalculateNutrientsNotifierProvider.notifier);

    void handleCalculateNutrient() {
      if (!isButtonEnabled.value || isLoading.value) return;

      isLoading.value = true;
      final calculateNutrientParams = CalculateNutrientParams(
        namaBahan: name,
        size: sizeState.value.toDouble(),
      );

      postCalculateNutrient.fetch(
        params: calculateNutrientParams,
        onSuccess: (data) {
          isLoading.value = false;
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
          isLoading.value = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal: $err')),
          );
        },
      );
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
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: CustomTextField(
                            label: 'Size per gram',
                            suffixText: 'gram',
                            controller: sizeController,
                            errorText: (isTouched.value['size']! ||
                                        isButtonEnabled.value) &&
                                    sizeController.text.isEmpty
                                ? 'Size is required'
                                : null,
                            onTap: () => isTouched.value = {
                              ...isTouched.value,
                              'size': true
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(30),
              CustomButtonWidget(
                text: isLoading.value ? 'Loading..' : 'Preview',
                onTap: () {
                  if (isButtonEnabled.value) {
                    sizeState.value = int.parse(sizeController.text);
                    handleCalculateNutrient();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in the required fields'),
                      ),
                    );
                  }
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
