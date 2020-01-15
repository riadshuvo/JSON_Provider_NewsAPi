import 'package:flutter/material.dart';
import 'package:flutter_news_api/viewModels/newsArticlesListViewModels.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Top News"),
        ),
        body: ListView.builder(
            itemCount: viewModel.articles.length,
            itemBuilder: (context, index) {

              final article = viewModel.articles[index];

              return ListTile(
                title: Text(article.title),
                leading: Container(
                    height: 90.0,
                    width: 100.0,
                    child: article.imageURL == null
                        ? Image.asset("images/news.png")
                        : Image.network(
                            article.imageURL,
                            fit: BoxFit.fitHeight,
                          )),
              );
            }));
  }
}
