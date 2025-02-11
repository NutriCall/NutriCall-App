import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({super.key});

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String selectedGender = 'Female';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: GoogleFonts.poppins(
              color: AppColor.darkGreen,
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
        const Gap(5),
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
            value: selectedGender,
            items: ['Male', 'Female']
                .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(
                        gender,
                        style: GoogleFonts.poppins(
                            color: AppColor.semiBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
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
