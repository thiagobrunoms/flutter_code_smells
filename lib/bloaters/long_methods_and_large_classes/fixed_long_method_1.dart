import 'package:flutter/material.dart';

class FixedLongMethod1 extends StatefulWidget {
  const FixedLongMethod1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FixedLongMethod1State();
}

class FixedLongMethod1State extends State<FixedLongMethod1> {
  final TextEditingController fieldController = TextEditingController();
  bool isSending = false;

  @override
  Widget build(BuildContext context) {
    print('Rebuilding....');
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField(),
            _buildButtonArea(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      title: const Text('Long Method'),
      actions: [
        _buildActionIcon(() {}, Icons.add),
        _buildActionIcon(() {}, Icons.access_alarm),
      ],
    );
  }

  Widget _buildActionIcon(Function() callback, IconData icon) {
    return IconButton(
      onPressed: callback,
      icon: Icon(icon),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: fieldController,
        decoration: const InputDecoration(labelText: 'Nome'),
      ),
    );
  }

  Widget _buildButtonArea() {
    return Row(
      children: [
        !isSending
            ? _buildButton(
                "Enviar", _onSendCallback, Theme.of(context).primaryColor)
            : const CircularProgressIndicator(),
        _buildButton("Cancelar", () {
          fieldController.clear();
        }, Colors.red),
      ],
    );
  }

  void _onSendCallback() async {
    print('Sending (fixed long method 1)...');
    fieldController.clear();

    setState(() {
      isSending = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isSending = false;
      });
    });
  }

  Widget _buildButton(String title, Function() callback, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: callback,
        child: Text(title),
      ),
    );
  }
}
