import 'package:flutter/material.dart';

class MyTextEditField extends StatelessWidget {
  final TextEditingController fieldController;

  const MyTextEditField({
    Key? key,
    required this.fieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: fieldController,
        decoration: const InputDecoration(labelText: 'Nome'),
      ),
    );
  }
}
