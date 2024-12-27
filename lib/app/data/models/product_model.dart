class ProductModel {
  final String? productName; // Ürün adı
  final String? productBolumi; // Ürün adı
  final String? productCode; // Ürün kodu
  final String? incomingGoods; // Gelen ürünler
  final String? outgoingGoods; // Çıkan ürünler
  final String? totalQuantity; // Toplam ürün sayısı
  final String? unit; // Ölçü birimi (kg, adet vb.)
  final String? unitType; // Ölçü biriminin türü (int, double, string)
  final String? documentID; // Belge ID

  ProductModel({
    this.productName,
    this.productBolumi,
    this.productCode,
    this.incomingGoods,
    this.outgoingGoods,
    this.totalQuantity,
    this.unit,
    this.unitType,
    this.documentID,
  });

  // Firebase'e kaydetmek için bir Map döndürme
  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productCode': productCode,
      'incomingGoods': incomingGoods,
      'outgoingGoods': outgoingGoods,
      'totalQuantity': totalQuantity,
      'unit': unit,
      'unitType': unitType,
      'productBolumi': productBolumi,
    };
  }
}
