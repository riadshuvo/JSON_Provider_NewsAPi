
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news_api/viewModels/newsArticlesViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatelessWidget {

  final NewsArticleViewModel article; 

  NewsArticleDetailsPage({this.article});

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${this.article.title}")
      ),
      body: WebView(
        initialUrl: this.article.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      )
    );
    
  }

}