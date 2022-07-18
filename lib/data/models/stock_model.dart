class StockModel {
  DateTime? date;
  String? productName;
  int? productCount;
  String? productUnit;
  String? productDescription;
  String? productStorageName;
  List<String>? productImageList;
  late bool isConfirmed;

  StockModel(
      {this.date,
      this.productName,
      this.productCount,
      this.productUnit,
      this.productDescription,
      this.productStorageName,
      this.productImageList,
      this.isConfirmed = false});

  StockModel.fromJson(Map<String, dynamic> json) {
    date = json['date'] == null ? null : DateTime.parse(json['date']);
    productName = json['productName'];
    productCount = json['productCount'];
    productUnit = json['productUnit'];
    productDescription = json['productDescription'];
    productStorageName = json['productStorageName'];
    productImageList = json['productImageList'].cast<String>();
    isConfirmed = json['isConfirmed'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['productName'] = productName;
    data['productCount'] = productCount;
    data['productUnit'] = productUnit;
    data['productDescription'] = productDescription;
    data['productStorageName'] = productStorageName;
    data['productImageList'] = productImageList;
    data['isConfirmed'] = isConfirmed;
    return data;
  }

  @override
  String toString() {
    return 'StockModel{date: $date, productName: $productName, productCount: $productCount, productUnit: $productUnit, productDescription: $productDescription, productStorageName: $productStorageName, productImageList: $productImageList, isConfirmed: $isConfirmed}';
  }
}
