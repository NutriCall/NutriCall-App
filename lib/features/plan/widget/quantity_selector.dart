import 'package:flutter/material.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final bool isEditable;
  final Function(int)? onChanged;

  const QuantitySelector({
    super.key,
    this.initialValue = 1,
    this.isEditable = true,
    this.onChanged,
  });

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  void _increment() {
    if (widget.isEditable) {
      setState(() {
        _quantity++;
        widget.onChanged?.call(_quantity);
      });
    }
  }

  void _decrement() {
    if (widget.isEditable && _quantity > 1) {
      setState(() {
        _quantity--;
        widget.onChanged?.call(_quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.darkGreen, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: widget.isEditable
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(Icons.remove, _decrement),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    '$_quantity',
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: AppColor.darkGreen),
                  ),
                ),
                _buildIconButton(Icons.add, _increment),
              ],
            )
          : Center(
              child: Text(
                '$_quantity',
                style: GoogleFonts.poppins(
                    fontSize: 18, color: AppColor.darkGreen),
              ),
            ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 28,
      height: 28,
      child: ElevatedButton(
        onPressed: widget.isEditable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          backgroundColor: AppColor.darkGreen,
          elevation: 0,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
