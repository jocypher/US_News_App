
import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<ArticleModel> articleNews = [];
  Future<void> getnews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=e2e5db21b1974e8ebc31b23ccb0e73b4";

    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null && element['author'] != null && element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
            element['author'],
            element['title'],
            element['description'],
            element['url'],
            element['urlToImage'],
            element['content'],
          );
          articleNews.add(articleModel);
        }
      });
    }
  }
}
class CategoryNewsClass {
  List<ArticleModel> categoryNews = [];
  Future<void> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=e2e5db21b1974e8ebc31b23ccb0e73b4";

    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null && element['author'] != null && element['content'] != null) {
          ArticleModel articleModel = ArticleModel(
            element['author'],
            element['title'],
            element['description'],
            element['url'],
            element['urlToImage'],
            element['content'],
          );
          categoryNews.add(articleModel);
        }
      });
    }
  }
}

