import 'package:flutter/material.dart';
import 'package:news_app/info/article_data.dart';
import 'package:news_app/info/data.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/category_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> category = List<CategoryModel>.empty(growable: true);
  List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    category = getCategoryModel();
    getNews();
  }

  getNews() async {
    News newsOb = News();
    await newsOb.getnews();
    articles = newsOb.articleNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "US",
              style: TextStyle(color: Colors.black, fontSize: 20)),
          TextSpan(
              text: "News", style: TextStyle(fontSize: 20, color: Colors.blue))
        ])),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :
          //Categories section
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: category.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                              imageUrl: category[index].imageUrl,
                              categoryName: category[index].categoryName);
                        }),
                  ),
                  // Blogs section
                  Container(
                    padding: const EdgeInsets.only(top: 18),
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            title: articles[index].title,
                            imageUrl: articles[index].urlToImage,
                            description: articles[index].description,
                            url: articles[index].url,
                          );
                        }),
                  )
                ]),
              ),
          ),
    );
  }
}
