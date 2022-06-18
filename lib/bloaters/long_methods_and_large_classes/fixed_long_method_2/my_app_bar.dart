import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        _buildActionIcon(() {}, Icons.add),
        _buildActionIcon(() {}, Icons.access_alarm),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

  Widget _buildActionIcon(Function() callback, IconData icon) {
    return IconButton(
      onPressed: callback,
      icon: Icon(icon),
    );
  }
}
