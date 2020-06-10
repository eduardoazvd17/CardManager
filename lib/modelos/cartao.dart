class Cartao {
  String nome;
  String numero;
  String titular;
  String codigoSeguranca;
  String dataVencimento;
  String senha4;
  String senha6;
  String senha8;

  Cartao({
    this.nome,
    this.codigoSeguranca,
    this.dataVencimento,
    this.titular,
    this.numero,
  });

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
    return cartaoMap;
  }
}
