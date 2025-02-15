import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/features/plan/pages/add_meals_page.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class PlanMealWidget extends StatefulWidget {
  final String label;
  final String kcal;
  final List<Map<String, dynamic>> items;

  const PlanMealWidget({
    super.key,
    required this.label,
    required this.kcal,
    required this.items,
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
            borderRadius: BorderRadius.circular(12),
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
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.kcal} kcal',
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(width: 10),
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
                            style: GoogleFonts.poppins(color: Colors.white),
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
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Detail items',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                          ),
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
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: widget.items.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.items.map((item) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${item["name"]} (${item["calories"]} kcal)',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          widget.items.remove(item);
                                        });
                                      },
                                      icon: const Icon(Icons.delete,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Carb: ${item["carbs"]}g',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Protein: ${item["protein"]}g',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Fat: ${item["fat"]}g',
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(color: Colors.white),
                              ],
                            );
                          }).toList(),
                        )
                      : Center(
                          child: Text(
                            "No Items",
                            style: GoogleFonts.poppins(color: Colors.white),
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
