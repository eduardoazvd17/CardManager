import 'package:flutter/material.dart';

class CardInformacoes extends StatelessWidget {
  CardInformacoes(this.titulo, this.conteudo);
  final String titulo;
  final String conteudo;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                titulo,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 5),
              Text(
                conteudo,
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
