import 'package:flutter/material.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Reserva'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: _buildDateTimeField(
                      'Inicio', TextEditingController(), context),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: _buildDateTimeField(
                      'Inicio', TextEditingController(), context),
                ),
              ],
            ),
            InkWell(
              child: const ListTile(
                title: Text('Filtrar minhas reservas'),
              ),
              onTap: () {},
            ),
            InkWell(
              child: const ListTile(
                title: Text('Cancelar minhas reservas'),
              ),
              onTap: () {},
            ),
            InkWell(
              child: const ListTile(
                title: Text('Buscar hoteis disponíveis'),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
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
      onChanged: (content) {},
    );
  }
}
