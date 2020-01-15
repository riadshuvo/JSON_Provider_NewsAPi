
import 'dart:convert';

import 'package:flutter_news_api/model/newsArticle.dart';
import 'package:http/http.dart' as http;

class Webservice {

  Future<List<NewsArticle>> fetchTopHeadlines() async {

    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=7799a2e379e64616954443bdb1f106d3";

    final response = await http.get(url);

    if(response.statusCode == 200) {

      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();

    } else {
      throw Exception("Failed to get top news");
    }

  }
}