import 'package:flutter/material.dart';
import 'package:flutter_news_api/pages/newsListPage.dart';
import 'package:flutter_news_api/viewModels/newsArticlesListViewModels.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsListPage(),
      )
    );
  }
}
