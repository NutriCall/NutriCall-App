import 'package:flutter/material.dart';
import 'package:nutri_call_app/utils/app_color.dart';

class QuantitySelector extends StatefulWidget {
  final int initialValue;
  final bool isEditable;
  final Function(int) onChanged;

  const QuantitySelector({
    super.key,
    this.initialValue = 1,
    this.isEditable = true,
    required this.onChanged,
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
        widget.onChanged(_quantity);
      });
    }
  }

  void _decrement() {
    if (widget.isEditable && _quantity > 1) {
      setState(() {
        _quantity--;
        widget.onChanged(_quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.darkGreen, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: widget.isEditable ? _decrement : null,
          ),
          Text('$_quantity', style: const TextStyle(fontSize: 18)),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: widget.isEditable ? _increment : null,
          ),
        ],
      ),
    );
  }
}
