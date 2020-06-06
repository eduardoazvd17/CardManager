class Cartao {
  String numero;
  String titular;
  String codigoSeguranca;
  String mesVencimento;
  String anoVencimento;
  String senha4;
  String senha6;
  String senha8;

  Cartao({
    this.anoVencimento,
    this.codigoSeguranca,
    this.mesVencimento,
    this.titular,
    this.numero,
  });

  Cartao.fromJson(Map cartaoMap) {
    this.numero = cartaoMap['numero'];
    this.titular = cartaoMap['titular'];
    this.codigoSeguranca = cartaoMap['codigoSeguranca'];
    this.mesVencimento = cartaoMap['mesVencimento'];
    this.anoVencimento = cartaoMap['anoVencimento'];
    this.senha4 = cartaoMap['senha4'];
    this.senha6 = cartaoMap['senha6'];
    this.senha8 = cartaoMap['senha8'];
  }

  toJson() {
    Map<String, dynamic> cartaoMap = {};
    cartaoMap.putIfAbsent('numero', () => numero);
    cartaoMap.putIfAbsent('titular', () => titular);
    cartaoMap.putIfAbsent('codigoSeguranca', () => codigoSeguranca);
    cartaoMap.putIfAbsent('mesVencimento', () => mesVencimento);
    cartaoMap.putIfAbsent('anoVencimento', () => anoVencimento);
    cartaoMap.putIfAbsent('senha4', () => senha4);
    cartaoMap.putIfAbsent('senha6', () => senha6);
    cartaoMap.putIfAbsent('senha8', () => senha8);
    return cartaoMap;
  }
}
