import 'package:cardmanager/componentes/card_informacoes.dart';
import 'package:cardmanager/componentes/form_senhas.dart';
import 'package:cardmanager/modelos/cartao.dart';
import 'package:cardmanager/modelos/usuario.dart';
import 'package:flutter/material.dart';

class TelaSenhas extends StatefulWidget {
  TelaSenhas(
      {this.usuario, this.atualizarUsuario, this.indexCartaoSelecionado});
  final Usuario usuario;
  final Function atualizarUsuario;
  final int indexCartaoSelecionado;

  @override
  _TelaSenhasState createState() =>
      _TelaSenhasState(usuario.cartoes[indexCartaoSelecionado]);
}

class _TelaSenhasState extends State<TelaSenhas> {
  Cartao cartao;
  _TelaSenhasState(this.cartao);

  _atualizarCartao(Cartao c) {
    setState(() {
      cartao = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _exibirSenhas() {
      return cartao.senha4 != null ||
          cartao.senha6 != null ||
          cartao.senha8 != null;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (_) => FormSenhas(
              usuario: widget.usuario,
              atualizarUsuario: widget.atualizarUsuario,
              indexCartaoSelecionado: widget.indexCartaoSelecionado,
              atualizarCartao: _atualizarCartao,
            ),
          );
        },
        child: Icon(Icons.vpn_key),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      'Senhas',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _exibirSenhas()
                    ? Column(
                        children: <Widget>[
                          CardInformacoes(
                            'Senha de 4 dígitos',
                            cartao.senha4 == null
                                ? 'Não informada'
                                : cartao.senha4,
                          ),
                          CardInformacoes(
                            'Senha de 6 dígitos',
                            cartao.senha6 == null
                                ? 'Não informada'
                                : cartao.senha6,
                          ),
                          CardInformacoes(
                            'Senha de 8 dígitos',
                            cartao.senha8 == null
                                ? 'Não informada'
                                : cartao.senha8,
                          ),
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Nenhuma senha adicionada para este cartão.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.vpn_key,
                                size: 50,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Divider(),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Para adicionar utilize o botão flutuante no fim da tela.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.add,
                                size: 50,
                                color: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
