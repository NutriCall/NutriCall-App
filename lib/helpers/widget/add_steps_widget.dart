import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class AddStepsWidget extends StatefulWidget {
  const AddStepsWidget({super.key});

  @override
  State<AddStepsWidget> createState() => _AddStepsWidgetState();
}

class _AddStepsWidgetState extends State<AddStepsWidget> {
  List<TextEditingController> stepControllers = [];

  void _addStepField() {
    setState(() {
      stepControllers.add(TextEditingController());
    });
  }

  void _removeStepField(int index) {
    setState(() {
      stepControllers[index].dispose();
      stepControllers.removeAt(index);
    });
  }

  Widget _buildStepField(int index) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
            controller: stepControllers[index],
            cursorColor: AppColor.semiBlack,
            decoration: InputDecoration(
              hintText: "Step ${index + 1}",
              hintStyle: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColor.darkGreen,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColor.darkGreen, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColor.darkGreen, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    const BorderSide(color: AppColor.darkGreen, width: 1.5),
              ),
            ),
          ),
        ),
        const Gap(6),
        GestureDetector(
          onTap: () => _removeStepField(index),
          child: const Icon(
            Icons.remove_circle_rounded,
            color: AppColor.darkGreen,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Steps",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.semiBlack,
              ),
            ),
            GestureDetector(
              onTap: _addStepField,
              child: const Icon(
                Icons.add_circle_rounded,
                color: AppColor.darkGreen,
              ),
            ),
          ],
        ),
        const Gap(8),
        ...List.generate(
          stepControllers.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildStepField(index),
          ),
        ),
      ],
    );
  }
}
