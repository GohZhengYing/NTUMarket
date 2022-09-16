import 'package:flutter/material.dart';

class ProductOwner {
  final String image, title;
  final int price;
  final Color bgColor;

  ProductOwner({
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<ProductOwner> demo_product_owner = [
  ProductOwner(
    image: "assets/images/NTUPaper.jpg",
    title: "NTU Paper",
    price: 165,
    bgColor: const Color(0xFFFEFBF9),
  ),
  ProductOwner(
    image: "assets/images/product_1.png",
    title: "Casual Henley Shirts",
    price: 99,
  ),
  ProductOwner(
    image: "assets/images/product_2.png",
    title: "Curved Hem Shirts",
    price: 180,
    bgColor: const Color(0xFFF8FEFB),
  ),
  ProductOwner(
    image: "assets/images/product_3.png",
    title: "Casual Nolin",
    price: 149,
    bgColor: const Color(0xFFEEEEED),
  ),
];
