import 'package:cardmanager/modelos/cartao.dart';
import 'package:flutter/material.dart';

class CardCartao extends StatelessWidget {
  final bool exibirInformacoes;
  final Cartao cartao;
  CardCartao(this.cartao, this.exibirInformacoes);
  @override
  Widget build(BuildContext context) {
    double larguraMax = MediaQuery.of(context).size.width;

    return Container(
      decoration: new BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: new BorderRadius.circular(16),
      ),
      width: double.infinity,
      height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            exibirInformacoes ? '${cartao.numero}' : '${cartao.numeroOculto()}',
            style: TextStyle(
              fontSize: larguraMax * 0.065,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: larguraMax * 0.06, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'VALIDADE:',
                      style: TextStyle(
                        fontSize: larguraMax * 0.037,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      exibirInformacoes ? '${cartao.dataVencimento}' : '••/••',
                      style: TextStyle(
                        fontSize: larguraMax * 0.037,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'CÓDIGO DE SEGURANÇA:',
                      style: TextStyle(
                        fontSize: larguraMax * 0.037,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      exibirInformacoes ? '${cartao.codigoSeguranca}' : '•••',
                      style: TextStyle(
                        fontSize: larguraMax * 0.037,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: larguraMax * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    '${cartao.titular.toUpperCase()}',
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: larguraMax * 0.045,
                    ),
                  ),
                ),
                Icon(Icons.credit_card, size: larguraMax * 0.15),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
