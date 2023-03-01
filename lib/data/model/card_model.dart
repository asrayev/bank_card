class CardModel {
  CardModel({
    required this.id,
    required this.cardNum,
    required this.expireDate,
    required this.color,
    required this.balance,
    required this.bankName,
    required this.backup,
  });

  String id;
  String cardNum;
  String expireDate;
  String color;
  String balance;
  String bankName;
  String backup;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
    id: json["id"],
    cardNum: json["cardNum"],
    expireDate: json["expire date"],
    color: json["color"],
    balance: json["balance"],
    bankName: json["bank_name"],
    backup: json["backup"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cardNum": cardNum,
    "expire date": expireDate,
    "color": color,
    "balance": balance,
    "bank_name": bankName,
    "backup": backup,
  };
}
