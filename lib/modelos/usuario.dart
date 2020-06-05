import 'package:cardmanager/modelos/cartao.dart';

class Usuario {
  String email;
  String nome;
  String senha;
  List<Cartao> cartoes;

  Usuario({
    this.email,
    this.nome,
    this.senha,
    this.cartoes,
  });
}
