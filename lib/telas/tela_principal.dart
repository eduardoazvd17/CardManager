import 'dart:convert';

import 'package:cardmanager/componentes/card_cartao.dart';
import 'package:cardmanager/modelos/usuario.dart';
import 'package:cardmanager/telas/tela_adicionar_cartao.dart';
import 'package:cardmanager/utilitarios/validador.dart';
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
    setState(() {
      usuario = u;
    });
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('usuario', json.encode(u.toJson()));
    });
  }

  _adicionarCartao(BuildContext context, bool isEditar) {
    var v = Validador(context);
    if (usuario.exibirInformacoes == false) {
      v.mostrarDialogoOK(
        'Desbloqueio Necessário',
        'Você precisa desbloquear o app para visualizar ou fazer alterações.',
      );
      return;
    }

    if (isEditar) {
      if (usuario.cartoes.length == 0) {
        v.mostrarDialogoOK(
          'Adicione um cartão',
          'Você não possui nenhum cartão adicionado.',
        );
        return;
      }
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TelaAdicionarCartao(
          usuario: usuario,
          atualizarUsuario: _atualizarUsuario,
          indexCartaoSelecionado: isEditar ? _indexCartaoSelecionado : null,
        ),
      ),
    );
  }

  _informacoesDetalhadas(BuildContext context) {
    var v = Validador(context);
    if (usuario.exibirInformacoes == false) {
      v.mostrarDialogoOK(
        'Desbloqueio Necessário',
        'Você precisa desbloquear o app para visualizar ou fazer alterações.',
      );
      return;
    }

    if (usuario.cartoes.length == 0) {
      v.mostrarDialogoOK(
        'Adicione um cartão',
        'Você não possui nenhum cartão adicionado.',
      );
      return;
    }
  }

  _senhas(BuildContext context) {
    var v = Validador(context);
    if (usuario.exibirInformacoes == false) {
      v.mostrarDialogoOK(
        'Desbloqueio Necessário',
        'Você precisa desbloquear o app para visualizar ou fazer alterações.',
      );
      return;
    }

    if (usuario.cartoes.length == 0) {
      v.mostrarDialogoOK(
        'Adicione um cartão',
        'Você não possui nenhum cartão adicionado.',
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _adicionarCartao(context, false),
        child: Icon(Icons.add),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Meus Cartões',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                usuario.exibirInformacoes
                                    ? Icons.lock_open
                                    : Icons.lock,
                                size: 35,
                              ),
                              onPressed: () {
                                if (usuario.exibirInformacoes == true) {
                                  usuario.exibirInformacoes =
                                      !usuario.exibirInformacoes;
                                  _atualizarUsuario(usuario);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      final senhaController =
                                          TextEditingController();
                                      return AlertDialog(
                                        title: Text('Desbloquear'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            TextField(
                                              obscureText: true,
                                              controller: senhaController,
                                              decoration: InputDecoration(
                                                hintText: 'Insira sua senha',
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            onPressed: () {
                                              if (senhaController.text ==
                                                  usuario.senha) {
                                                usuario.exibirInformacoes =
                                                    !usuario.exibirInformacoes;
                                                _atualizarUsuario(usuario);
                                              }
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Enviar',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      usuario.cartoes.length == 0
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: InkWell(
                                onTap: () => _adicionarCartao(context, false),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: new BorderRadius.circular(16),
                                  ),
                                  width: double.infinity,
                                  height: 250,
                                  child: Center(
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      size: 80,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : CarouselSlider(
                              items: usuario.cartoes.map((cartao) {
                                return CardCartao(
                                    cartao, usuario.exibirInformacoes);
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          usuario.cartoes.length == 0
                              ? 'Nenhum cartão adicionado'
                              : usuario.cartoes[_indexCartaoSelecionado].nome,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        ListTile(
                          onTap: () => _informacoesDetalhadas(context),
                          leading: Icon(
                            Icons.remove_red_eye,
                          ),
                          title: Text('Informações Detalhadas'),
                        ),
                        Divider(),
                        ListTile(
                          onTap: () => _senhas(context),
                          leading: Icon(Icons.vpn_key),
                          title: Text('Senhas'),
                        ),
                        Divider(),
                        ListTile(
                          onTap: () => _adicionarCartao(context, true),
                          leading: Icon(Icons.edit),
                          title: Text('Editar Cartão'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
