import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'src/article.dart';
import 'package:http/http.dart' as http;
import 'json_parsing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  Mock data:
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

  Future<Article> _getArticle(int id) async {
    final url = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyResponse = await http.get(url);
    String jsonString = storyResponse.body;
    if (storyResponse.statusCode == 200) {
      return parseArticle(jsonString);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _ids.map((i) {
          return FutureBuilder<Article>(
            future: _getArticle(i),
            builder: (BuildContext context, AsyncSnapshot<Article> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return _buildItem(snapshot.data);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: Key('${article.id}'),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          article.title,
          style: TextStyle(fontSize: 20),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(article.type),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  if (await canLaunch(article.url)) {
                    await launch(article.url);
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
