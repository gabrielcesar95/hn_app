import 'dart:async';
import 'package:hn_app/src/article.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:hn_app/json_parsing.dart';
import 'dart:collection';

class HackerNewsBloc {
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  dynamic _articles = <Article>[];

  List<int> _ids = [
    21589647,
    21567022,
    21585235,
    21565624,
    21581361,
    21582698,
    21572552,
    21584847,
  ];

  HackerNewsBloc() {
    _updateArticles().then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
  }

  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  Future<Null> _updateArticles() async {
    final futureArticles = _ids.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }

  Future<Article> _getArticle(int id) async {
    final url = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyResponse = await http.get(url);
    String jsonString = storyResponse.body;
    if (storyResponse.statusCode == 200) {
      return parseArticle(jsonString);
    }
    return null;
  }
}
