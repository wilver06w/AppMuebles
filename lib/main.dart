import 'package:flutter/material.dart';
import 'package:storenike/InicioShoesStore/InicioShoesStore.dart';

import 'InicioNuevoDiseno/InicioNuevoDiseno.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: InicioNuevoDiseno(),
    );
  }
}
