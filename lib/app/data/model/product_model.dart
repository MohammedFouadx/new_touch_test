
class ProductData {
  int? statusCode;
  List<Product>? data;

  ProductData({this.statusCode, this.data});

  ProductData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  double? profitRate;
  double? discountRate;
  String? imageUrl;
  String? thumbUrl;
  String? linkUrl;
  String? id;
  int? shortId;
  String? itemFlagId;
  String? taxTemplateId;
  String? unitTemplateId;
  String? categoryId;
  String? storeId;
  String? name;
  double? price;
  double? quantity;
  Additional? additional;

  Product(
      {this.profitRate,
        this.discountRate,
        this.imageUrl,
        this.thumbUrl,
        this.linkUrl,
        this.id,
        this.shortId,
        this.itemFlagId,
        this.taxTemplateId,
        this.unitTemplateId,
        this.categoryId,
        this.storeId,
        this.name,
        this.price,
        this.quantity,
        this.additional});

  Product.fromJson(Map<String, dynamic> json) {
    profitRate = json['profitRate'];
    discountRate = json['discountRate'];
    imageUrl = json['imageUrl'];
    thumbUrl = json['thumbUrl'];
    linkUrl = json['linkUrl'];
    id = json['id'];
    shortId = json['shortId'];
    itemFlagId = json['itemFlagId'];
    taxTemplateId = json['taxTemplateId'];
    unitTemplateId = json['unitTemplateId'];
    categoryId = json['categoryId'];
    storeId = json['storeId'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    additional = json['additional'] != null
        ? new Additional.fromJson(json['additional'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profitRate'] = this.profitRate;
    data['discountRate'] = this.discountRate;
    data['imageUrl'] = this.imageUrl;
    data['thumbUrl'] = this.thumbUrl;
    data['linkUrl'] = this.linkUrl;
    data['id'] = this.id;
    data['shortId'] = this.shortId;
    data['itemFlagId'] = this.itemFlagId;
    data['taxTemplateId'] = this.taxTemplateId;
    data['unitTemplateId'] = this.unitTemplateId;
    data['categoryId'] = this.categoryId;
    data['storeId'] = this.storeId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    if (this.additional != null) {
      data['additional'] = this.additional!.toJson();
    }
    return data;
  }
}

class Additional {
  double? taxVat;
  String? unitTemplateName;
  String? itemFlagName;
  String? categoryName;

  Additional(
      {this.taxVat,
        this.unitTemplateName,
        this.itemFlagName,
        this.categoryName});

  Additional.fromJson(Map<String, dynamic> json) {
    taxVat = json['taxVat'];
    unitTemplateName = json['unitTemplateName'];
    itemFlagName = json['itemFlagName'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxVat'] = this.taxVat;
    data['unitTemplateName'] = this.unitTemplateName;
    data['itemFlagName'] = this.itemFlagName;
    data['categoryName'] = this.categoryName;
    return data;
  }
}
