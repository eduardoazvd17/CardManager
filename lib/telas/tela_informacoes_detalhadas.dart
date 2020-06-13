import 'package:cardmanager/componentes/card_informacoes.dart';
import 'package:cardmanager/modelos/bandeira.dart';
import 'package:cardmanager/modelos/cartao.dart';
import 'package:flutter/material.dart';

class TelaInformacoesDetalhadas extends StatelessWidget {
  final Cartao cartao;
  TelaInformacoesDetalhadas({this.cartao});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Informações',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CardInformacoes('Cartão', cartao.nome),
                CardInformacoes('Bandeira', cartao.bandeira.descricao()),
                CardInformacoes('Titular', cartao.titular.toUpperCase()),
                CardInformacoes('Número', cartao.numero),
                CardInformacoes('Data de Vencimento', cartao.dataVencimento),
                CardInformacoes('Código de Segurança', cartao.codigoSeguranca),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
