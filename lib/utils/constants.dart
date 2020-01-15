

class Constants {

  static String TOP_HEADLINES_URL =  "https://newsapi.org/v2/top-headlines?country=us&apiKey=7799a2e379e64616954443bdb1f106d3";

  static String headlinesFor(String keyword) {

    return  "https://newsapi.org/v2/everything?q=$keyword&apiKey=7799a2e379e64616954443bdb1f106d3";

  }

  

}