import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  const CategoryTile({super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(imageUrl, width: 140, height: 80,fit: BoxFit.cover,)),
        Container(
          width: 140, 
          height: 80,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(categoryName, 
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600),)),
        )
      ]),
    );
  }
}
