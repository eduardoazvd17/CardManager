import 'dart:convert';

import 'package:cardmanager/componentes/card_cartao.dart';
import 'package:cardmanager/modelos/usuario.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaPrincipal extends StatefulWidget {
  final Usuario usuario;
  TelaPrincipal(this.usuario);
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState(usuario);
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Usuario usuario;
  int _indexCartaoSelecionado = 0;
  _TelaPrincipalState(this.usuario);

  _atualizarUsuario(Usuario u) {
    usuario = u;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('usuario', json.encode(u.toJson()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Meus Cartões',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    CarouselSlider(
                      items: usuario.cartoes.map((cartao) {
                        return CardCartao(cartao);
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _indexCartaoSelecionado = index;
                          });
                        },
                        enlargeCenterPage: true,
                        initialPage: 0,
                        height: 200,
                        enableInfiniteScroll: false,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
