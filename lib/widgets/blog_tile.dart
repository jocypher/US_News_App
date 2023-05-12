import 'package:flutter/material.dart';
import 'package:news_app/screens/article_screen.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;
  const BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleScreen(blogurl: url)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)),
          const SizedBox(
            height: 7,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 15, color: Colors.black54),
          )
        ]),
      ),
    );
  }
}
