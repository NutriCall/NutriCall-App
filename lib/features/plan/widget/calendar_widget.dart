import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int selectedDay = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime startOfWeek = today.subtract(Duration(days: today.weekday % 7));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColor.darkGreen,
          padding: const EdgeInsets.all(8.0),
          child: const Center(
            child: Text(
              'Calendar',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              DateTime day = startOfWeek.add(Duration(days: index));
              bool isSelected = day.day == selectedDay;
              return GestureDetector(
                // onTap: () {
                //   setState(() {
                //     selectedDay = day.day;
                //   });
                //   widget.onDateSelected(selectedDay);
                // },
                child: Column(
                  children: [
                    const Gap(5),
                    Text(
                      DateFormat.E().format(day).toUpperCase(),
                      style: const TextStyle(
                          color: AppColor.darkGreen,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const Gap(3),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.lightGreen
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        day.day.toString(),
                        style: TextStyle(
                            color:
                                isSelected ? Colors.white : AppColor.darkGreen,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
