import 'package:cardmanager/telas/tela_splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Gerenciador de Cartões',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: TelaSplash(),
      ),
    );
  }
}
