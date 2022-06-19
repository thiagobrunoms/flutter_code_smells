import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final String title;
  final Color color;
  bool? _isStatefull;
  void Function() calback;

  AddButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.calback})
      : super(key: key) {
    _isStatefull = false;
  }

  AddButton.statefull(
      {Key? key,
      required this.title,
      required this.color,
      required this.calback})
      : super(key: key) {
    _isStatefull = true;
  }

  @override
  State<StatefulWidget> createState() => AddButtonState();
}

class AddButtonState extends State<AddButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    print('Building button');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: !_isLoading
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(primary: widget.color),
              onPressed: () {
                if (widget._isStatefull!) {
                  _updateState();
                  Future.delayed(const Duration(seconds: 3), () {
                    _updateState();
                  });
                }

                widget.calback();
              },
              child: const Text('Adicionar'),
            )
          : const CircularProgressIndicator(),
    );
  }

  void _updateState() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }
}
