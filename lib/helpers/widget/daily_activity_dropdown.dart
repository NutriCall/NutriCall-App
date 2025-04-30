import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class DailyActivityDropdown extends StatefulWidget {
  final ValueChanged<String?> onSelected;
  final String? selectedValue;
  const DailyActivityDropdown({
    super.key,
    required this.onSelected,
    this.selectedValue,
  });

  @override
  _DailyActivityDropdownState createState() => _DailyActivityDropdownState();
}

class _DailyActivityDropdownState extends State<DailyActivityDropdown> {
  String? selectedDailyActivity;

  @override
  void initState() {
    super.initState();
    selectedDailyActivity = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColor.darkWhite2,
            border: Border.all(color: AppColor.darkGreen, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            isDense: true,
            value: selectedDailyActivity,
            hint: Text(
              'Daily Activity',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColor.darkGreen,
              ),
            ),
            items: [
              'Little Activity/No Exercise',
              'Light Activity',
              'Moderate Activity',
              'High Activity'
            ]
                .map((dailyActivity) => DropdownMenuItem(
                      value: dailyActivity,
                      child: Text(
                        dailyActivity,
                        style: GoogleFonts.poppins(
                          color: AppColor.semiBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedDailyActivity = value;
              });
              widget.onSelected(value);
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
