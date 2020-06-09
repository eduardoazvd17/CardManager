import 'package:cardmanager/modelos/usuario.dart';
import 'package:flutter/material.dart';

class TelaAdicionarCartao extends StatelessWidget {
  final Usuario usuario;
  final Function atualizarUsuario;
  final int indexCartaoSelecionado;
  TelaAdicionarCartao({
    this.usuario,
    this.atualizarUsuario,
    this.indexCartaoSelecionado,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                    indexCartaoSelecionado == null
                        ? 'Adicionar Cartão'
                        : 'Editar Cartão',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
