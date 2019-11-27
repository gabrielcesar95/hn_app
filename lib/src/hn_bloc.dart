import 'dart:async';
import 'package:hn_app/src/article.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:hn_app/json_parsing.dart';
import 'dart:collection';

enum StoriesType {
  topStories,
  newStories,
}

class HackerNewsBloc {
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  dynamic _articles = <Article>[];

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  final _storiesTypeController = StreamController<StoriesType>();

  static List<int> _newIds = [
    21589647,
    21567022,
    21585235,
    21565624,
  ];

  static List<int> _topIds = [
    21581361,
    21582698,
    21572552,
    21584847,
  ];

  HackerNewsBloc() {
    _getArticlesAndUpdate(_topIds);

    _updateArticles(_topIds).then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
    });

    _storiesTypeController.stream.listen((storiesType) {
      if (storiesType == StoriesType.newStories) {
        _getArticlesAndUpdate(_newIds);
      } else {
        _getArticlesAndUpdate(_topIds);
      }
    });
  }

  _getArticlesAndUpdate(List<int> ids) {
    _updateArticles(ids).then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
  }

  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  Future<Null> _updateArticles(List<int> articleIds) async {
    final futureArticles = articleIds.map((id) => _getArticle(id));
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
