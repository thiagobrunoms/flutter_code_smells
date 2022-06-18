import 'package:flutter/material.dart';
import 'package:flutter_code_smells/bloaters/long_methods_and_large_classes/bad_smell_long_method.dart';
import 'package:flutter_code_smells/bloaters/long_methods_and_large_classes/fixed_long_method_2/fixed_long_method_2.dart';

import 'bloaters/long_methods_and_large_classes/fixed_long_method_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home:
            const FixedLongMethod2()); //const FixedLongMethod2()); // const FixedLongMethod1()); //const BadSmellLongMethod());
  }
}
