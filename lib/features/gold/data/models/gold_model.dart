class GoldModel {
  final String name;
  final num price;
  final String symbol;
  final String updatedAt;
  final String updatedAtReadable;

  GoldModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAt,
    required this.updatedAtReadable,
  });

  factory GoldModel.fromJson(Map<String, dynamic> json) => GoldModel(
    name: json['name'],
    price: json['price'],
    symbol: json['symbol'],
    updatedAt: json['updatedAt'],
    updatedAtReadable: json['updatedAtReadable'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'symbol': symbol,
    'updatedAt': updatedAt,
    'updatedAtReadable': updatedAtReadable,
  };
}
