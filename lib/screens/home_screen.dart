import 'package:flutter/material.dart';
import 'package:news_app/info/data.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/category_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> category = List<CategoryModel>.empty(growable: true);
  @override
  void initState() {
    super.initState();
    category = getCategoryModel();
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
              text: "Flutter",
              style: TextStyle(color: Colors.black, fontSize: 20)),
          TextSpan(
              text: "News", style: TextStyle(fontSize: 20, color: Colors.blue))
        ])),
      ),
      body: Container(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
          )
        ]),
      ),
    );
  }
}
