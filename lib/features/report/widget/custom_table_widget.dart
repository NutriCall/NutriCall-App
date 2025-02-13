import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class CustomTableWidget extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final List<List<String>> data; 

  const CustomTableWidget({
    super.key,
    required this.rowCount,
    required this.columnCount,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> colorMap = {
      "A1": AppColor.blue,
      "A2": AppColor.orange,
      "A3": AppColor.pink,
      "A4": AppColor.purple,
    };

    return Container(
      width: double.infinity, 
      color: AppColor.darkWhite,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Table(
        columnWidths: {
          for (int i = 0; i < columnCount; i++)
            i: data.any((row) => colorMap.containsKey(row[i]))
                ? const FixedColumnWidth(8.0) 
                : const IntrinsicColumnWidth(),
        },
        border: const TableBorder(
          horizontalInside: BorderSide(color: AppColor.grey, width: 1),
        ),
        children: List.generate(
          rowCount,
          (rowIndex) => TableRow(
            children: List.generate(
              columnCount,
              (colIndex) {
                String cellData = data[rowIndex][colIndex];
                bool isTotalRow = data[rowIndex].contains("Total");

                if (colorMap.containsKey(cellData)) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Container(
                      width: 8, 
                      height: 8,
                      decoration: BoxDecoration(
                        color: colorMap[cellData], 
                        shape: BoxShape.circle, 
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        text: cellData.contains("(kcal)") 
                            ? cellData 
                            : cellData.replaceAll(" kcal", ""), 
                        style: GoogleFonts.poppins(
                          color: AppColor.semiBlack,
                          fontSize: 10,
                          fontWeight: isTotalRow ? FontWeight.w700 : FontWeight.w500, 
                        ),
                        children: [
                          if (cellData.contains("kcal") && !cellData.contains("(kcal)")) 
                            TextSpan(
                              text: " kcal",
                              style: GoogleFonts.poppins(
                                color: AppColor.grey, 
                                fontSize: 8,
                                fontWeight: isTotalRow ? FontWeight.w700 : FontWeight.w400,
                              ),
                            ),
                        ],
                      ),
                      textAlign: TextAlign.end,
                      softWrap: true,
                    ),
                  );
                }
              },
            ),
          )
        ),
      ),
    );
  }
}
