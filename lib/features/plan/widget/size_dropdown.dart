import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class SizeDropdown extends StatefulWidget {
  final String initialSize;
  final bool isEditable;
  final Function(String)? onChanged;

  const SizeDropdown({
    super.key,
    this.initialSize = 'medium',
    this.isEditable = true,
    this.onChanged,
  });

  @override
  _SizeDropdownState createState() => _SizeDropdownState();
}

class _SizeDropdownState extends State<SizeDropdown> {
  late String _selectedSize;
  final List<String> _sizes = ['small', 'medium', 'large'];

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.initialSize;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.darkGreen, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: widget.isEditable
          ? DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedSize,
                iconEnabledColor: AppColor.darkGreen,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedSize = newValue;
                      widget.onChanged?.call(newValue);
                    });
                  }
                },
                items: _sizes.map((String size) {
                  return DropdownMenuItem<String>(
                    value: size,
                    child: Text(
                      size,
                      style: GoogleFonts.poppins(
                        fontSize: 13, 
                        color: AppColor.darkGreen,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          : Center(
              child: Text(
                _selectedSize,
                style: TextStyle(
                  color: AppColor.darkGreen,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
