import 'package:flutter/material.dart';
import 'package:flutter_code_smells/bloaters/long_methods_and_large_classes/fixed_long_method_2/add_button.dart';
import 'package:flutter_code_smells/bloaters/long_methods_and_large_classes/fixed_long_method_2/my_app_bar.dart';
import 'package:flutter_code_smells/bloaters/long_methods_and_large_classes/fixed_long_method_2/my_text_edit_field.dart';

class FixedLongMethod2 extends StatefulWidget {
  const FixedLongMethod2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FixedLongMethod2State();
}

class FixedLongMethod2State extends State<FixedLongMethod2> {
  final TextEditingController fieldController = TextEditingController();
  final List<Widget> namesList = [];

  @override
  Widget build(BuildContext context) {
    print('rebuilding main');

    //=== FOR QUERY METHODs EXAMPLE
    // var myFunc = () {
    //   print('Thiago');
    // };

    return Scaffold(
      appBar: const MyAppBar(title: 'Long Method'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyTextEditField(
              fieldController: fieldController,
            ),
            Row(
              children: [
                AddButton.statefull(
                    title: "Enviar",
                    color: Theme.of(context).primaryColor,
                    calback: _onButtonPressed),
                AddButton(
                    title: "Cancelar",
                    color: Colors.red,
                    calback: _onCancelingButtonPressed),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    print('Sending (fixed long method 2)...');

    fieldController.clear();
  }

  void _onCancelingButtonPressed() {
    print('Canceling (fixed long method 2)...');

    fieldController.clear();
  }
}
