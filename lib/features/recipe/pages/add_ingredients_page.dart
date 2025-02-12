import 'package:flutter/material.dart';
import 'package:nutri_call_app/helpers/widget/custom_app_bar.dart';

class AddIngredientsPage extends StatelessWidget {
  const AddIngredientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Ingredients',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: const Center(
        child: Text('This is Add Ingredients Page'),
      ),
    );
  }
}
