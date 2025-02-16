import 'package:flutter/material.dart';

class RecipeImageWidget extends StatelessWidget {
  final String imageUrl;

  const RecipeImageWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imageUrl,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
