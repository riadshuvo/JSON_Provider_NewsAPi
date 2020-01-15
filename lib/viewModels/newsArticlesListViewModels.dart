import 'package:flutter/material.dart';
import 'package:flutter_news_api/model/newsArticle.dart';
import 'package:flutter_news_api/services/webservices.dart';

import 'newsArticlesViewModel.dart';



class NewsArticleListViewModel extends ChangeNotifier {


  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadlines();
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }

}