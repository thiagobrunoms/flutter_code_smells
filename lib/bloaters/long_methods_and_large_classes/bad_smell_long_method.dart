import 'package:flutter/material.dart';

class BadSmellLongMethod extends StatefulWidget {
  const BadSmellLongMethod({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BadSmellLongMethodState();
}

class BadSmellLongMethodState extends State<BadSmellLongMethod> {
  final TextEditingController fieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long Method'),
        actions: [
          IconButton(
            onPressed: () {
              print('Adding...');
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              print('Access alarm...');
            },
            icon: const Icon(Icons.access_alarm),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: fieldController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Sending...');
                    },
                    child: const Text('Enviar'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      print('Clear...');
                      fieldController.clear();
                    },
                    child: const Text('Apagar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
