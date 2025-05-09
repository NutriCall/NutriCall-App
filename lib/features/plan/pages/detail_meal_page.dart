import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/plan/widget/quantity_selector.dart';
import 'package:nutri_call_app/features/plan/widget/size_dropdown.dart';
import 'package:nutri_call_app/features/recipe/widget/recipe_image_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/helpers/widget/custom_description_input.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:nutri_call_app/utils/assets.gen.dart';

class DetailMealPage extends StatefulWidget {
  final String id;
  final String name;
  final String? initialImage;
  final int initialQuantity;
  final String initialSize;
  final bool isEditable;

  const DetailMealPage({
    super.key,
    required this.id,
    required this.name,
    this.initialImage,
    this.initialQuantity = 1,
    this.initialSize = 'medium',
    this.isEditable = true,
  });

  @override
  _DetailMealPageState createState() => _DetailMealPageState();
}

class _DetailMealPageState extends State<DetailMealPage> {
  late int quantity;
  late String size;
  late String image;

  @override
  void initState() {
    super.initState();
    image = widget.initialImage ?? Assets.images.chickenKatsu.path;
    quantity = widget.initialQuantity;
    size = widget.initialSize;
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      quantity = widget.initialQuantity;
      size = widget.initialSize;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              RecipeImageWidget(imageUrl: image),
              CustomDescriptionInput(
                label: "",
                placeholder: 'Describe your meal, for example “a piece of chicken with rice”.',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 13,
                  color: AppColor.lightBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(6),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: AppColor.darkGreen,
                          ),
                        ),
                        const Gap(8),
                        QuantitySelector(
                          initialValue: quantity,
                          onChanged: (value) => setState(() => quantity = value),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Size',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: AppColor.darkGreen,
                          ),
                        ),
                        const Gap(8),
                        SizeDropdown(
                          initialSize: size,
                          isEditable: widget.isEditable,
                          onChanged: (value) => setState(() => size = value),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(30),
              CustomButtonWidget(
                text: 'Preview',
                onTap: () {
                  context.pushNamed(
                    RouteName.previewMealPage,
                    pathParameters: {
                      'id': widget.id,
                      'name': widget.name,
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
