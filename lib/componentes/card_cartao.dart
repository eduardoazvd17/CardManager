import 'package:cardmanager/modelos/cartao.dart';
import 'package:flutter/material.dart';

class CardCartao extends StatelessWidget {
  final Cartao cartao;
  CardCartao(this.cartao);
  @override
  Widget build(BuildContext context) {
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
            '${cartao.numero}',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'VALIDADE:',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${cartao.mesVencimento}/${cartao.anoVencimento}',
                      style: TextStyle(
                        fontSize: 16,
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
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${cartao.codigoSeguranca}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${cartao.titular.toUpperCase()}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Icon(Icons.credit_card, size: 60),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
