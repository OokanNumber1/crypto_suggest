class CmcToken {
  CmcToken({
    required this.id,
    required this.symbol,
    required this.name,
    required this.rank,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.volumeChange24,
    required this.change30d,
    required this.price,
    required this.change24hr,
    required this.change7d,
    required this.marketCap,
  });

  String symbol;
  String id;
  String name;
  int rank;
  num circulatingSupply;
  num totalSupply;
  num volumeChange24;
  num change30d;
  double price;
  double change24hr;
  double change7d;
  double marketCap;

  factory CmcToken.empty() => CmcToken(
        id: "0",
        symbol: "",
        name: "",
        rank: 0,
        circulatingSupply: 0,
        totalSupply: 0,
        volumeChange24: 0,
        change30d: 0,
        price: 0,
        change24hr: 0,
        change7d: 0,
        marketCap: 0,
      );

  factory CmcToken.fromJson(Map<String, dynamic> json) {
    return CmcToken(
      id: json['id'].toString(),
      rank: json['cmc_rank'] ?? 0,
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      price: json["quote"]["USD"]["price"] ?? 0.00,
      change24hr: json["quote"]["USD"]['percent_change_24h'] ?? 0.00,
      change7d: json["quote"]["USD"]['percent_change_7d'] ?? 0.00,
      change30d: json["quote"]["USD"]['percent_change_30d'] ?? 0.00,
      volumeChange24: json["quote"]["USD"]['volume_change_24h'] ?? 0.00,
      totalSupply: json['total_supply'] ?? 0.00,
      circulatingSupply: json['circulating_supply'] ?? 0.00,
      marketCap: json["quote"]["USD"]["market_cap"] ?? 0.00,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rank': rank,
      'symbol': symbol,
      'name': name,
      'price': price,
      'change24': change24hr,
      'change7d': change7d,
      'change30d': change30d,
      'volumeChange24': volumeChange24,
      'totalSupply': totalSupply,
      'circulatingSupply': circulatingSupply,
      'marketCap': marketCap,
    };
  }

  // factory CmcToken.fromLocal(Map<String, dynamic> json) {
  //   return CmcToken(
  //       rank: json['rank'],
  //       symbol: json['symbol'],
  //       name: json['name'],
  //       price: json['price'],
  //       change30d: json['change30d'],
  //       marketCap: json['marketCap'],
  //       change24hr: json['change24'],
  //       change7d: json['change7d'],
  //       totalSupply: json['totalSupply'],
  //       circulatingSupply: json['circulatingSupply'],
  //       volumeChange24: json['volumeChange24']);
  // }

  @override
  String toString() {
    return 'CmcToken(symbol: $symbol, id:$id, name: $name, rank: $rank, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, volumeChange24: $volumeChange24, change30d: $change30d, price: $price, change24hr: $change24hr, change7d: $change7d, marketCap: $marketCap)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CmcToken &&
        other.symbol == symbol &&
        other.id == id &&
        other.name == name &&
        other.rank == rank &&
        other.circulatingSupply == circulatingSupply &&
        other.totalSupply == totalSupply &&
        other.volumeChange24 == volumeChange24 &&
        other.change30d == change30d &&
        other.price == price &&
        other.change24hr == change24hr &&
        other.change7d == change7d &&
        other.marketCap == marketCap;
  }

  @override
  int get hashCode {
    return symbol.hashCode ^
        id.hashCode ^
        name.hashCode ^
        rank.hashCode ^
        circulatingSupply.hashCode ^
        totalSupply.hashCode ^
        volumeChange24.hashCode ^
        change30d.hashCode ^
        price.hashCode ^
        change24hr.hashCode ^
        change7d.hashCode ^
        marketCap.hashCode;
  }
}
