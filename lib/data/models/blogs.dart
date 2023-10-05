import 'dart:convert';
import 'package:hive/hive.dart';
part 'blogs.g.dart';

@HiveType(typeId: 0)
class Blogs {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String url;

  Blogs({
    required this.id,
    required this.title,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'url': url,
    };
  }

  factory Blogs.fromMap(Map<String, dynamic> map) {
    return Blogs(
      id: map['id'] as String,
      title: map['title'] as String,
      url: map['image_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Blogs.fromJson(String source) =>
      Blogs.fromMap(json.decode(source) as Map<String, dynamic>);
}
