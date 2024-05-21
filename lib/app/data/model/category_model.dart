
class CategoryData {
  int? statusCode;
  List<Categories>? categories;

  CategoryData({this.statusCode, this.categories});

  CategoryData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      categories = <Categories>[];
      json['data'].forEach((v) { categories!.add(Categories.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (categories != null) {
      data['data'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? id;
  String? text;
  String? imageUrl;
  String? shortId;

  Categories({this.id, this.text, this.imageUrl, this.shortId});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    imageUrl = json['imageUrl'];
    shortId = json['shortId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['imageUrl'] = this.imageUrl;
    data['shortId'] = this.shortId;

    return data;
  }
}

