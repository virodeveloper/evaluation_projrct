// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

Result articleFromJson(String str) =>
    Result.fromJson(json.decode(str)["response"]);

Result filteredArticleFromJson(String str) => Result.fromJson(json.decode(str));

class Result {
  Result({required this.docs});

  List<Article> docs;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        docs: json.containsKey('docs')
            ? List<Article>.from(
                json["docs"].map(
                  (x) => Article.fromJson(x),
                ),
              )
            : List<Article>.from(
                json["results"].map(
                  (x) => Article.fromJson(x),
                ),
              ),
      );
}

class Article {
  Article({
    required this.webUrl,
    required this.title,
    required this.utc,
  });

  String webUrl;

  String title;

  String utc;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        webUrl: json.containsKey('web_url') ? json["web_url"] : json["url"],
        title: json.containsKey('web_url')
            ? json["headline"]["main"]
            : json["title"],
        utc: json.containsKey('web_url')
            ? json["pub_date"]
            : json["published_date"],
      );
}
