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
    String jsonString;
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
              if (snapshot.connectionState == ConnectionState.done) {
                print(snapshot);
                return Text(snapshot.data.title);
              } else {
                return Text('Not done!');
              }
            },
          );
        }).toList(),
      ),
    );
  }

//  RefreshIndicator(
//  onRefresh: () async {
//  var fakeFuture = await Future.delayed(const Duration(
//  seconds: 1,
//  ));
//  setState(() {
//  _ids.removeAt(0);
//  });
//
//  return fakeFuture;
//},

  Widget _buildItem(article) {
    return Padding(
      key: Key('${article.id}'),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(
          article.text,
          style: TextStyle(fontSize: 20),
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('NULL comentários'),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  final String url = 'https://example.com';
                  if (await canLaunch(url)) {
                    await launch(url);
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
