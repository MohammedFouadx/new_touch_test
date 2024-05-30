
class ProductData {
  int? statusCode;
  List<Product>? data;

  ProductData({this.statusCode, this.data});

  ProductData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = statusCode;
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
  String? description;
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
        this.description,
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
    description = json['description'];
    additional = json['additional'] != null
        ? new Additional.fromJson(json['additional'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profitRate'] = profitRate;
    data['discountRate'] = discountRate;
    data['imageUrl'] = imageUrl;
    data['thumbUrl'] = thumbUrl;
    data['linkUrl'] = linkUrl;
    data['id'] = id;
    data['shortId'] = shortId;
    data['itemFlagId'] = itemFlagId;
    data['taxTemplateId'] = taxTemplateId;
    data['unitTemplateId'] = unitTemplateId;
    data['categoryId'] = categoryId;
    data['storeId'] = storeId;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['description'] = description;
    if (additional != null) {
      data['additional'] = additional!.toJson();
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
    data['taxVat'] = taxVat;
    data['unitTemplateName'] = unitTemplateName;
    data['itemFlagName'] = itemFlagName;
    data['categoryName'] = categoryName;
    return data;
  }
}
