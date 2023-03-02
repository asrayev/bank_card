class CardModel {
  String id;
  String cardNum;
  String expireDate;
  String color;
  String balance;
  String bankName;
  String backup;

  CardModel({
    required this.id,
    required this.cardNum,
    required this.expireDate,
    required this.color,
    required this.balance,
    required this.bankName,
    required this.backup,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      cardNum: json['cardNum'],
      expireDate: json['expire date'],
      color: json['color'],
      balance: json['balance'],
      bankName: json['bank_name'],
      backup: json['backup'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'cardNum': cardNum,
    'expire date': expireDate,
    'color': color,
    'balance': balance,
    'bank_name': bankName,
    'backup': backup,
  };

  CardModel copyWith({
    String? id,
    String? cardNum,
    String? expireDate,
    String? color,
    String? balance,
    String? bankName,
    String? backup,
  }) {
    return CardModel(
      id: id ?? this.id,
      cardNum: cardNum ?? this.cardNum,
      expireDate: expireDate ?? this.expireDate,
      color: color ?? this.color,
      balance: balance ?? this.balance,
      bankName: bankName ?? this.bankName,
      backup: backup ?? this.backup,
    );
  }
}
