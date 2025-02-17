import 'package:flutter/material.dart';
import 'package:nutri_call_app/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final Function(int)? onChanged;

  const QuantitySelector({
    super.key,
    this.initialValue = 1,
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
    setState(() {
      _quantity++;
      widget.onChanged?.call(_quantity);
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        widget.onChanged?.call(_quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.darkGreen, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconButton(
              Icons.remove,
               _decrement,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '$_quantity',
                style: GoogleFonts.poppins(
                  fontSize: 13, 
                  color: AppColor.darkGreen,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            _buildIconButton(Icons.add, _increment),
          ],
        ),
      )
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 20,
      height: 20,
      child: ElevatedButton(
        onPressed: onPressed ,
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
