enum Bandeira {
  americanexpress,
  elo,
  hipercard,
  mastercard,
  visa,
}

extension BandeiraExtension on Bandeira {
  String descricao() {
    switch (this) {
      case Bandeira.americanexpress:
        return 'American Express';
      case Bandeira.elo:
        return 'Elo';
      case Bandeira.hipercard:
        return 'Hiper Card';
      case Bandeira.mastercard:
        return 'Master Card';
      case Bandeira.visa:
        return 'Visa';
    }
  }

  String imagem() {
    switch (this) {
      case Bandeira.americanexpress:
        return 'assets/images/bandeiras/americanexpress.png';
      case Bandeira.elo:
        return 'assets/images/bandeiras/elo.png';
      case Bandeira.hipercard:
        return 'assets/images/bandeiras/hipercard.png';
      case Bandeira.mastercard:
        return 'assets/images/bandeiras/mastercard.png';
      case Bandeira.visa:
        return 'assets/images/bandeiras/visa.png';
    }
  }
}
