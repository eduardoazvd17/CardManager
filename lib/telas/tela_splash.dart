import 'package:cardmanager/telas/tela_boas_vindas.dart';
import 'package:cardmanager/telas/tela_principal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaSplash extends StatefulWidget {
  @override
  _TelaSplashState createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  Future<bool> isPrimeiraVez() async {
    var prefs = await SharedPreferences.getInstance();
    bool isPrimeraVez = prefs.getBool('isPrimeiraVez');
    if (isPrimeraVez == null || isPrimeraVez) {
      prefs.setBool('isPrimeiraVez', false);
    }
    return isPrimeraVez;
  }

  @override
  void initState() {
    super.initState();
    isPrimeiraVez().then((isPrimeiraVez) {
      Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
        if (isPrimeiraVez == null || isPrimeiraVez) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => TelaBoasVindas(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => TelaPrincipal(),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.credit_card,
          size: 80,
        ),
      ),
    );
  }
}
