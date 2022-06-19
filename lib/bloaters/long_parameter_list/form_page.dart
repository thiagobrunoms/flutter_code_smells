import 'package:flutter/material.dart';
import 'package:flutter_code_smells/bloaters/long_parameter_list/range_dates.dart';
import 'package:flutter_code_smells/bloaters/long_parameter_list/service.dart';

class FormPage extends StatelessWidget {
  Map<String, dynamic> data = {};
  TextEditingController beginDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  Service service = Service();
  RangeDates dateRange = RangeDates(begin: DateTime.now(), end: DateTime.now());

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
            _buildDateTimeField("Begin Date", beginDateController, context),
            _buildDateTimeField("End Date", endDateController, context),
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
          String name = data["Name"];
          String age = data["Age"];
          String email = data["Email"];
          String cpf = data["Cpf"];
          String address = data["Address"];

          DateTime begin;
          if (beginDateController.text.isNotEmpty) {
            begin = DateTime.parse(beginDateController.text);
          } else {
            begin = dateRange.begin;
          }

          DateTime end;
          if (endDateController.text.isNotEmpty) {
            end = DateTime.parse(endDateController.text);
          } else {
            end = dateRange.end;
          }

          service.signUp(name, age, email, cpf, address, begin, end);
        },
        child: const Text('Enviar'));
  }
}
