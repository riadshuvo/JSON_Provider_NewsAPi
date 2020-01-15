

class NewsArticle {

  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String source;

  NewsArticle({this.title, this.description, this.urlToImage, this.url, this.source});

  factory NewsArticle.fromJSON(Map<String, dynamic> json) {
    return NewsArticle(
        title: json["title"],
        description: json["description"],
        urlToImage: json["urlToImage"],
        url: json["url"],
        source: json["source"]["name"]
    );
  }

}