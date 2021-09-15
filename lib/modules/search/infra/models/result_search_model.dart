import 'dart:convert';

import 'package:flutter_clean_arch/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String title;
  final String content;
  final String img;

  ResultSearchModel(
      {required this.title, required this.content, required this.img})
      : super(title: title, content: content, img: img);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'img': img,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      title: map['title'],
      content: map['content'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
