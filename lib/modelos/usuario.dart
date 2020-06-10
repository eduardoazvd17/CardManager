import 'package:cardmanager/modelos/cartao.dart';

class Usuario {
  String nome;
  String senha;
  String senhaTemp;
  bool exibirInformacoes = false;
  List<Cartao> cartoes = [];

  Usuario({
    this.nome,
    this.senha,
  });

  adicionarCartao(Cartao c) {
    this.cartoes.add(c);
  }

  removerCartao(Cartao c) {
    cartoes.removeWhere((cartao) => cartao.numero == c.numero);
  }

  Usuario.fromJson(Map usuarioMap) {
    this.nome = usuarioMap['nome'];
    this.senha = usuarioMap['senha'];
    this.exibirInformacoes = usuarioMap['exibirInformacoes'];
    List<Cartao> listaCartoes = [];
    for (var cMap in usuarioMap['cartoes']) {
      listaCartoes.add(Cartao.fromJson(cMap));
    }
    this.cartoes = listaCartoes;
  }

  toJson() {
    Map<String, dynamic> usuarioMap = {};
    usuarioMap.putIfAbsent('nome', () => nome);
    usuarioMap.putIfAbsent('senha', () => senha);
    usuarioMap.putIfAbsent('exibirInformacoes', () => false);
    List<Map<String, dynamic>> cartoesMap = [];
    for (var c in cartoes) {
      cartoesMap.add(c.toJson());
    }
    usuarioMap.putIfAbsent('cartoes', () => cartoesMap);
    return usuarioMap;
  }
}
