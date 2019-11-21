import 'dart:convert';
import 'src/helpers/serializers.dart';
import 'package:hn_app/src/article.dart';

List<int> parseTopStories(String jsonStr) {
  final parsed = jsonDecode(jsonStr);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
}

Article parseArticle(String jsonStr) {
  final parsed = jsonDecode(jsonStr);
  Article article =
      standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}
