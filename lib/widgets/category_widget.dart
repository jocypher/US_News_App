import 'package:flutter/material.dart';
import 'package:news_app/info/article_data.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/widgets/blog_tile.dart';

// ignore: must_be_immutable
class CategoryNews extends StatefulWidget {
  late String category;
  CategoryNews({super.key, required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);
  // ignore: unused_field
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsObj = CategoryNewsClass();
    await newsObj.getCategoryNews(widget.category);
    articles = newsObj.categoryNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        elevation: 0,
        title: RichText(
            text:  TextSpan(children: [
          TextSpan(
              text: widget.category,
              style: const TextStyle(color: Colors.black, fontSize: 20)),
          const TextSpan(
              text: "News", style: TextStyle(fontSize: 20, color: Colors.blue))
        ])),
      ),
      body:_loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
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

