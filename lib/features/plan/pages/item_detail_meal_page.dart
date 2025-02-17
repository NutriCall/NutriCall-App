import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/plan/widget/quantity_selector.dart';
import 'package:nutri_call_app/features/plan/widget/size_dropdown.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';
import 'package:nutri_call_app/helpers/widget/custom_button_widget.dart';
import 'package:nutri_call_app/routers/router_name.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class ItemDetailMealPage extends StatefulWidget {
  final String id;
  final String name;
  final int initialQuantity;
  final String initialSize;
  final bool isEditable;

  const ItemDetailMealPage({
    super.key,
    required this.id,
    required this.name,
    this.initialQuantity = 1,
    this.initialSize = 'medium',
    this.isEditable = true,
  });

  @override
  _ItemDetailMealPageState createState() => _ItemDetailMealPageState();
}

class _ItemDetailMealPageState extends State<ItemDetailMealPage> {
  late int quantity;
  late String size;

  @override
  void initState() {
    super.initState();
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
              Text(
                widget.name,
                style: GoogleFonts.poppins(
                  color: AppColor.semiBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
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
                    RouteName.itemPreviewMealPage,
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
