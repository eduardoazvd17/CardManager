import 'package:cardmanager/modelos/bandeira.dart';
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
  Bandeira bandeiraSelecionada;

  _enviar(BuildContext context) {
    var v = Validador(context);
    String nome = nomeController.text;
    String numero = numeroController.text;
    String titular = titularController.text;
    String data = dataController.text;
    String codigo = codigoController.text;

    if (v.isVazio(nome) ||
        v.isVazio(numero) ||
        v.isVazio(titular) ||
        v.isVazio(data) ||
        v.isVazio(codigo) ||
        v.isVazio(bandeiraSelecionada)) {
      v.mostrarDialogoOK(
        'Campos Vazios',
        'Preencha todos os campos para continuar.',
      );
      return;
    }

    if (numero.length < 19 || data.length < 5 || codigo.length < 3) {
      v.mostrarDialogoOK(
        'Cartão Inválido',
        'Preencha todos os campos corretamente.',
      );
      return;
    }

    var cartao = Cartao(
      nome: nome,
      numero: numero,
      titular: titular,
      dataVencimento: data,
      codigoSeguranca: codigo,
      bandeira: bandeiraSelecionada,
    );
    if (widget.indexCartaoSelecionado == null) {
      widget.usuario.adicionarCartao(cartao);
    } else {
      widget.usuario.cartoes[widget.indexCartaoSelecionado].atualizar(cartao);
    }
    widget.atualizarUsuario(widget.usuario);
    Navigator.of(context).pop();
  }

  List<DropdownMenuItem<Bandeira>> _getDropDownBandeiras() {
    List<DropdownMenuItem<Bandeira>> bandeiras = [];
    for (var b in Bandeira.values) {
      bandeiras.add(
        DropdownMenuItem(
          value: b,
          child: Text(b.descricao()),
        ),
      );
    }
    return bandeiras;
  }

  @override
  void initState() {
    super.initState();
    if (widget.indexCartaoSelecionado != null) {
      var cartao = widget.usuario.cartoes[widget.indexCartaoSelecionado];
      nomeController.text = cartao.nome;
      numeroController.text = cartao.numero;
      titularController.text = cartao.titular;
      dataController.text = cartao.dataVencimento;
      codigoController.text = cartao.codigoSeguranca;
      bandeiraSelecionada = cartao.bandeira;
    }
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
                  maxLength: 3,
                  controller: codigoController,
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  decoration: InputDecoration(
                    hintText: 'Insira o código de segurança...',
                    suffixIcon: Icon(Icons.security),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Text(
                      'Bandeira: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    DropdownButton(
                      hint: Text('Selecione uma bandeira'),
                      value: bandeiraSelecionada,
                      items: _getDropDownBandeiras(),
                      onChanged: (b) {
                        setState(
                          () {
                            bandeiraSelecionada = b;
                          },
                        );
                      },
                    ),
                  ],
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
                            widget.indexCartaoSelecionado == null
                                ? 'Enviar'
                                : 'Salvar',
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
