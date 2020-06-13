import 'package:cardmanager/modelos/usuario.dart';
import 'package:cardmanager/utilitarios/validador.dart';
import 'package:flutter/material.dart';

class FormSenhas extends StatefulWidget {
  FormSenhas({
    this.usuario,
    this.atualizarUsuario,
    this.indexCartaoSelecionado,
    this.atualizarCartao,
  });
  final Usuario usuario;
  final Function atualizarUsuario;
  final Function atualizarCartao;
  final int indexCartaoSelecionado;
  @override
  _FormSenhasState createState() => _FormSenhasState();
}

class _FormSenhasState extends State<FormSenhas> {
  var senha4Controller = TextEditingController();
  var senha6Controller = TextEditingController();
  var senha8Controller = TextEditingController();

  _enviar(BuildContext context) {
    String senha4 = senha4Controller.text;
    String senha6 = senha6Controller.text;
    String senha8 = senha8Controller.text;
    var v = Validador(context);
    if (senha4.length != 0 && senha4.length != 4) {
      v.mostrarDialogoOK(
          'Senha de 4 digitos', 'Sua senha não possui 4 digitos.');
      return;
    }
    if (senha6.length != 0 && senha6.length != 6) {
      v.mostrarDialogoOK(
          'Senha de 6 digitos', 'Sua senha não possui 6 digitos.');
      return;
    }
    if (senha8.length != 0 && senha8.length != 8) {
      v.mostrarDialogoOK(
          'Senha de 8 digitos', 'Sua senha não possui 8 digitos.');
      return;
    }

    if (senha4 != null && senha4.isEmpty) {
      senha4 = null;
    }
    if (senha6 != null && senha6.isEmpty) {
      senha6 = null;
    }
    if (senha8 != null && senha8.isEmpty) {
      senha8 = null;
    }

    var c = widget.usuario.cartoes[widget.indexCartaoSelecionado];
    c.senha4 = senha4;
    c.senha6 = senha6;
    c.senha8 = senha8;
    widget.usuario.cartoes[widget.indexCartaoSelecionado].atualizarSenhas(c);
    widget.atualizarUsuario(widget.usuario);
    widget
        .atualizarCartao(widget.usuario.cartoes[widget.indexCartaoSelecionado]);
    Navigator.of(context).pop();
  }

  void initState() {
    super.initState();
    var cartao = widget.usuario.cartoes[widget.indexCartaoSelecionado];
    if (cartao.senha4 != null) {
      senha4Controller.text = cartao.senha4;
    }
    if (cartao.senha6 != null) {
      senha6Controller.text = cartao.senha6;
    }
    if (cartao.senha8 != null) {
      senha8Controller.text = cartao.senha8;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Senhas',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                'Os campos de senhas são opcionais, podendo ser deixados vazios.'),
            SizedBox(height: 20),
            Text(
              'Senha de 4 digitos:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              maxLength: 4,
              obscureText: true,
              controller: senha4Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              textCapitalization: TextCapitalization.none,
              decoration: InputDecoration(
                hintText: '',
                suffixIcon: Icon(Icons.vpn_key),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Senha de 6 digitos:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              maxLength: 6,
              obscureText: true,
              controller: senha6Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              textCapitalization: TextCapitalization.none,
              decoration: InputDecoration(
                hintText: '',
                suffixIcon: Icon(Icons.vpn_key),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Senha de 8 digitos:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              maxLength: 8,
              obscureText: true,
              controller: senha8Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: false),
              textCapitalization: TextCapitalization.none,
              decoration: InputDecoration(
                hintText: '',
                suffixIcon: Icon(Icons.vpn_key),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => _enviar(context),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.done,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Salvar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
