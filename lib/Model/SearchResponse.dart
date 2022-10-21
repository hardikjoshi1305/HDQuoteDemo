// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  SearchResponse({
    this.count,
    this.totalCount,
    this.page,
    this.totalPages,
    this.lastItemIndex,
    this.results,
  });

  int count;
  int totalCount;
  int page;
  int totalPages;
  int lastItemIndex;
  List<Result> results;

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    count: json["count"],
    totalCount: json["totalCount"],
    page: json["page"],
    totalPages: json["totalPages"],
    lastItemIndex: json["lastItemIndex"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "totalCount": totalCount,
    "page": page,
    "totalPages": totalPages,
    "lastItemIndex": lastItemIndex,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.content,
    this.author,
    this.tags,
    this.authorId,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  String id;
  String content;
  String author;
  List<String> tags;
  String authorId;
  String authorSlug;
  int length;
  DateTime dateAdded;
  DateTime dateModified;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    content: json["content"],
    author: json["author"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    authorId: json["authorId"],
    authorSlug: json["authorSlug"],
    length: json["length"],
    dateAdded: DateTime.parse(json["dateAdded"]),
    dateModified: DateTime.parse(json["dateModified"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "author": author,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "authorId": authorId,
    "authorSlug": authorSlug,
    "length": length,
    "dateAdded": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    "dateModified": "${dateModified.year.toString().padLeft(4, '0')}-${dateModified.month.toString().padLeft(2, '0')}-${dateModified.day.toString().padLeft(2, '0')}",
  };
}
