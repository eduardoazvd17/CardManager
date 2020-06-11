import 'package:cardmanager/modelos/bandeira.dart';

class Cartao {
  String nome;
  String numero;
  String titular;
  String codigoSeguranca;
  String dataVencimento;
  String senha4;
  String senha6;
  String senha8;
  Bandeira bandeira;

  Cartao({
    this.nome,
    this.codigoSeguranca,
    this.dataVencimento,
    this.titular,
    this.numero,
    this.bandeira,
  });

  String numeroOculto() {
    String n = this.numero[15].toString() +
        this.numero[16].toString() +
        this.numero[17].toString() +
        this.numero[18].toString();
    return '•••• •••• •••• ' + n;
  }

  atualizar(Cartao novo) {
    this.nome = novo.nome;
    this.numero = novo.numero;
    this.titular = novo.titular;
    this.codigoSeguranca = novo.codigoSeguranca;
    this.dataVencimento = novo.dataVencimento;
  }

  atualizarSenhas(Cartao novo) {
    this.senha4 = novo.senha4;
    this.senha6 = novo.senha6;
    this.senha8 = novo.senha8;
  }

  Cartao.fromJson(Map cartaoMap) {
    this.nome = cartaoMap['nome'];
    this.numero = cartaoMap['numero'];
    this.titular = cartaoMap['titular'];
    this.codigoSeguranca = cartaoMap['codigoSeguranca'];
    this.dataVencimento = cartaoMap['dataVencimento'];
    this.senha4 = cartaoMap['senha4'];
    this.senha6 = cartaoMap['senha6'];
    this.senha8 = cartaoMap['senha8'];
    String bandeiraString = cartaoMap['bandeira'];
    switch (bandeiraString) {
      case 'Bandeira.americanexpress':
        this.bandeira = Bandeira.americanexpress;
        break;
      case 'Bandeira.elo':
        this.bandeira = Bandeira.elo;
        break;
      case 'Bandeira.hipercard':
        this.bandeira = Bandeira.hipercard;
        break;
      case 'Bandeira.mastercard':
        this.bandeira = Bandeira.mastercard;
        break;
      case 'Bandeira.visa':
        this.bandeira = Bandeira.visa;
        break;
    }
  }

  toJson() {
    Map<String, dynamic> cartaoMap = {};
    cartaoMap.putIfAbsent('nome', () => nome);
    cartaoMap.putIfAbsent('numero', () => numero);
    cartaoMap.putIfAbsent('titular', () => titular);
    cartaoMap.putIfAbsent('codigoSeguranca', () => codigoSeguranca);
    cartaoMap.putIfAbsent('dataVencimento', () => dataVencimento);
    cartaoMap.putIfAbsent('senha4', () => senha4);
    cartaoMap.putIfAbsent('senha6', () => senha6);
    cartaoMap.putIfAbsent('senha8', () => senha8);
    cartaoMap.putIfAbsent('bandeira', () => bandeira.toString());
    return cartaoMap;
  }
}
