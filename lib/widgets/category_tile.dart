import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  const CategoryTile({super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Image.network(imageUrl)
      ]),
    );
  }
}
