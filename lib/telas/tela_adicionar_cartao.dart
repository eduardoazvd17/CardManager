import 'package:cardmanager/modelos/cartao.dart';
import 'package:cardmanager/modelos/usuario.dart';
import 'package:cardmanager/utilitarios/validador.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

class TelaAdicionarCartao extends StatefulWidget {
  final Usuario usuario;
  final Function atualizarUsuario;
  final int indexCartaoSelecionado;
  TelaAdicionarCartao({
    this.usuario,
    this.atualizarUsuario,
    this.indexCartaoSelecionado,
  });

  @override
  _TelaAdicionarCartaoState createState() => _TelaAdicionarCartaoState();
}

class _TelaAdicionarCartaoState extends State<TelaAdicionarCartao> {
  var nomeController = TextEditingController();
  var numeroController = TextEditingController();
  var titularController = TextEditingController();
  var dataController = TextEditingController();
  var codigoController = TextEditingController();

  _enviar(BuildContext context) {
    var v = Validador(context);
    //TODO: Adicionar cartão e atualizar usuario
  }

  @override
  void initState() {
    super.initState();
    //TODO: se for editar exibir os dados nos controllers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      widget.indexCartaoSelecionado == null
                          ? 'Adicionar Cartão'
                          : 'Editar Cartão',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                Text(
                  'Nome do Cartão:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: nomeController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Insira um nome para o cartão...',
                    suffixIcon: Icon(Icons.credit_card),
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  'Número do Cartão:',
                  style: TextStyle(fontSize: 16),
                ),
                MaskedTextField(
                  maxLength: 19,
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  maskedTextFieldController: numeroController,
                  mask: "xxxx xxxx xxxx xxxx",
                  inputDecoration: InputDecoration(
                    hintText: 'Insira o número do cartão...',
                    suffixIcon: Icon(Icons.credit_card),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Nome do Titular:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: titularController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: 'Insira o nome do titular...',
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  'Data de Vencimento:',
                  style: TextStyle(fontSize: 16),
                ),
                MaskedTextField(
                  maxLength: 5,
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  maskedTextFieldController: dataController,
                  mask: "xx/xx",
                  inputDecoration: InputDecoration(
                    hintText: 'Insira a data de vencimento...',
                    suffixIcon: Icon(Icons.date_range),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Código de Segurança:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  maxLength: 4,
                  controller: codigoController,
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  decoration: InputDecoration(
                    hintText: 'Insira o código de segurança...',
                    suffixIcon: Icon(Icons.security),
                  ),
                ),
                SizedBox(height: 35),
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
                            'Enviar',
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
