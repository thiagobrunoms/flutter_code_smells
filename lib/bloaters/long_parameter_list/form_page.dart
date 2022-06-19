import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  Map<String, dynamic> data = {};
  TextEditingController initDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulário')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildField('Name', TextInputType.text),
            _buildField('Age', TextInputType.number),
            _buildField('Email', TextInputType.emailAddress),
            _buildField('Cpf', TextInputType.number),
            _buildField('Address', TextInputType.text),
            _buildDateTimeField("Data Inicio", initDateController, context),
            _buildDateTimeField("Data Fim", endDateController, context),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextInputType inputType) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      keyboardType: inputType,
      onChanged: (content) {
        data[label] = content;
      },
    );
  }

  Widget _buildDateTimeField(
      String label, TextEditingController controller, BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
      keyboardType: TextInputType.datetime,
      onTap: () async {
        DateTime? selected = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now(),
        );

        controller.text = selected!.toIso8601String();
      },
      onChanged: (content) {
        data[label] = content;
      },
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
        onPressed: () {
          print(data["Name"]);
          print(data["Age"]);
          print(data["Email"]);
          print(data["Cpf"]);
          print(data["Address"]);
        },
        child: Text('Enviar'));
  }
}
