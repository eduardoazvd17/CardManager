import 'dart:convert';

import 'package:cardmanager/modelos/usuario.dart';
import 'package:cardmanager/telas/tela_principal.dart';
import 'package:cardmanager/utilitarios/validador.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaBoasVindas extends StatelessWidget {
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmacaoSenhaController = TextEditingController();

  _entrar(BuildContext context) async {
    Validador v = Validador(context);
    String nome = nomeController.text;
    String senha = senhaController.text;
    String confirmacaoSenha = confirmacaoSenhaController.text;

    if (v.isVazio(nome) || v.isVazio(senha) || v.isVazio(confirmacaoSenha)) {
      v.mostrarDialogoOK(
        'Campos Vazios',
        'Preencha todos os campos para continuar.',
      );
      return;
    }

    if (senha != confirmacaoSenha) {
      v.mostrarDialogoOK(
        'Senhas Diferentes',
        'Os campos senha e confirmação de senha devem ser iguais.',
      );
      return;
    }

    v.mostrarCarregamento('Carregando...');

    var prefs = await SharedPreferences.getInstance();
    var usuario = Usuario(
      nome: nome,
      senha: senha,
    );
    prefs.setString('usuario', json.encode(usuario.toJson()));

    v.ocultarCarregamento();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => TelaPrincipal(usuario),
      ),
    );

    //TODO: Faz o registro.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.credit_card,
                              size: 80,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Olá, Seja Bem Vindo!',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\nTodas as informações inseridas neste app serão salvas no seu dispositivo e criptografadas com uma senha criada por você mesmo, ou seja, apenas você terá acesso!',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '\nVamos começar?',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: nomeController,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            hintText: 'Insira seu nome',
                          ),
                        ),
                        Text(
                          '\nPara proteger suas informações, é necessário uma senha.',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          controller: senhaController,
                          decoration: InputDecoration(
                            hintText: 'Insira sua senha',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          controller: confirmacaoSenhaController,
                          decoration: InputDecoration(
                            hintText: 'Confirme sua senha',
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () => _entrar(context),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Continuar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
