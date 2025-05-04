import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/plan/pages/add_meals_page.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class PlanMealWidget extends StatefulWidget {
  final String label;
  final String kcal;
  final List<Map<String, dynamic>> items;
  final void Function(Map<String, dynamic> item)? onDelete;

  const PlanMealWidget({
    super.key,
    required this.label,
    required this.kcal,
    required this.items,
    this.onDelete,
  });

  @override
  _PlanMealWidgetState createState() => _PlanMealWidgetState();
}

class _PlanMealWidgetState extends State<PlanMealWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColor.darkGreen),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.label,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: AppColor.darkGreen),
                    ),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: widget.kcal,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: AppColor.darkGreen,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'kcal',
                            style: GoogleFonts.poppins(
                                fontSize: 9,
                                color: AppColor.darkGreen,
                                fontWeight: FontWeight.w500),
                          )
                        ])),
                        const Gap(16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddMealsPage(mealId: widget.label),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.darkGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Text(
                            'Add',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.darkGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          isExpanded ? Radius.zero : const Radius.circular(12),
                      bottomRight:
                          isExpanded ? Radius.zero : const Radius.circular(12),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Detail items',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              if (isExpanded)
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor.darkGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  child: widget.items.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.items.map((item) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                            '${item["name"]} (${item["calories"]}',
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: 'kcal',
                                        style: GoogleFonts.poppins(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: ')',
                                        style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      )
                                    ])),
                                    IconButton(
                                      onPressed: () {
                                        if (widget.onDelete != null) {
                                          widget.onDelete!(item);
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                      width: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Carb',
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '${item["carbs"]}g',
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                      width: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Protein',
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '${item["protein"]}g',
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                      width: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Fat',
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '${item["fat"]}g',
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(10),
                                const Divider(color: Colors.white54),
                              ],
                            );
                          }).toList(),
                        )
                      : Center(
                          child: Text(
                            "No Items",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
