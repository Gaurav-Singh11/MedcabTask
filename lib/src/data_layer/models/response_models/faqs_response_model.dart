class FaqsResponseModel {
  FaqsResponseModel({
    this.faqList,
  });

  FaqsResponseModel.fromJson(dynamic json) {
    if (json['faqList'] != null) {
      faqList = [];
      json['faqList'].forEach((v) {
        faqList?.add(FaqList.fromJson(v));
      });
    }
  }

  List<FaqList>? faqList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (faqList != null) {
      map['faqList'] = faqList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class FaqList {
  FaqList({
    this.header,
    this.description,
  });

  FaqList.fromJson(dynamic json) {
    header = json['header'];
    description = json['description'];
  }

  String? header;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['header'] = header;
    map['description'] = description;
    return map;
  }
}
