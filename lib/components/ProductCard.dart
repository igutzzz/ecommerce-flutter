import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String img;
  final String name;
  final double price;
  final double rating;

  const ProductCard(
        {super.key,
        required this.img,
        required this.name,
        required this.price,
        required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 500,
      child: Column(
        children: [
          Image.network(img,height: 200),
          Text(name),
          Row(
            children: [
              Text(price.toString()),
              Text(rating.toString())
            ],
          )
        ],
      ),
    );
  }
}
