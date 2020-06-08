import 'package:flutter/material.dart';

class Validador {
  BuildContext context;
  Validador(this.context);

  Widget mostrarDialogoOK(String titulo, String mensagem) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensagem),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Ok',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget mostrarDialogoSN({
    @required String titulo,
    @required String mensagem,
    @required Function sim,
    @required Function nao,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensagem),
          actions: <Widget>[
            FlatButton(
              onPressed: sim,
              child: Text(
                'Sim',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            FlatButton(
              onPressed: nao,
              child: Text(
                'Não',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget mostrarCarregamento(String msg) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                SizedBox(height: 15),
                new Text(
                  msg,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ocultarCarregamento() {
    Navigator.of(context).pop();
  }

  bool isVazio(dynamic v) {
    return v == null || v.toString().isEmpty;
  }

  bool isEmail(String e) {
    return e.contains(RegExp('@.'));
  }

  bool isNumero(dynamic n) {
    return int.tryParse(n) != null || double.tryParse(n) != null;
  }
}
