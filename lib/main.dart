import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'src/article.dart';
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
  List<Article> _articles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          var fakeFuture = await Future.delayed(const Duration(
            seconds: 1,
          ));
          setState(() {
            _articles.removeAt(0);
          });

          return fakeFuture;
        },
        child: ListView(
          children: _articles.map(this._buildItem).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
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
