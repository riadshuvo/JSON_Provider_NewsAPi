

import 'package:flutter/material.dart';
import 'package:flutter_news_api/model/newsArticle.dart';
import 'package:flutter_news_api/services/webservices.dart';

import 'newsArticlesViewModel.dart';

enum LoadingStatus {
  completed,
  searching,
  empty
}

class NewsArticleListViewModel extends ChangeNotifier {

  var loadingStatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> search(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticles = await Webservice().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> populateTopHeadlines() async {
    this.loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadlines();
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

}