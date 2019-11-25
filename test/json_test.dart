import 'package:hn_app/json_parsing.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  test("parses beststories.json over a network", () async {
    String jsonString;
    final url = 'https://hacker-news.firebaseio.com/v0/beststories.json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      jsonString = response.body;
    }

    expect(parseTopStories(jsonString).first, 21589647);
  });

  test("parses item.json over a network", () async {
    String jsonString;
    final url = 'https://hacker-news.firebaseio.com/v0/item/8863.json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      jsonString = response.body;
    }

    expect(parseArticle(jsonString).by, 'dhouston');
  });
}