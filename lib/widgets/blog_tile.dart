import 'package:flutter/material.dart';


class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  const BlogTile({super.key, required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(description)
        ]
        ),
    );
  }
}
