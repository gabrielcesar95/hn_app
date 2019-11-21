import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:hn_app/src/helpers/serializers.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;
  @nullable
  int get id;
  @nullable
  String get deleted;
  @nullable
  String get type;
  @nullable
  String get by;
  @nullable
  int get time;
  @nullable
  String get text;
  @nullable
  bool get dead;
  @nullable
  int get parent;
  @nullable
  int get poll;

  BuiltList<int> get kids;
  @nullable
  String get url;
  @nullable
  int get score;
  @nullable
  String get title;
  @nullable
  int get parts;
  @nullable
  int get descendants;

  Article . _();

  factory Article([updates(ArticleBuilder b)]) = _$Article;
}