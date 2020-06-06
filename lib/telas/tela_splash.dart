import 'dart:convert';

import 'package:cardmanager/modelos/usuario.dart';
import 'package:cardmanager/telas/tela_boas_vindas.dart';
import 'package:cardmanager/telas/tela_principal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaSplash extends StatefulWidget {
  @override
  _TelaSplashState createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  Future<Usuario> buscarUsuario() async {
    var prefs = await SharedPreferences.getInstance();
    var u = prefs.get('usuario');
    Usuario usuario;
    if (u != null) {
      usuario = Usuario.fromJson(json.decode(u));
    }
    return usuario;
  }

  @override
  void initState() {
    super.initState();
    buscarUsuario().then((usuario) {
      Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
        if (usuario == null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => TelaBoasVindas(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => TelaPrincipal(usuario),
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
          size: MediaQuery.of(context).size.width * 0.25,
        ),
      ),
    );
  }
}
