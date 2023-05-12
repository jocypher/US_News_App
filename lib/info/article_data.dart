
import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<ArticleModel> articleNews = [];
  Future<void> getnews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e2e5db21b1974e8ebc31b23ccb0e73b4";

    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
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
