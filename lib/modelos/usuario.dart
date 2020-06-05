import 'package:cardmanager/modelos/cartao.dart';

class Usuario {
  String nome;
  String senha;
  List<Cartao> cartoes;

  Usuario({
    this.nome,
    this.senha,
    this.cartoes,
  });
}
