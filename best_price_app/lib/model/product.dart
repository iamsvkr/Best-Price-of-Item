import 'package:flutter/material.dart';

class Product {
  String product_name;
  String product_price;
  String product_image_link;
  String shop;

  Product({
    @required this.product_name,
    @required this.product_price,
    @required this.product_image_link,
    @required this.shop
  });

  factory Product.fromJson(Map<String, dynamic> json) {
      return new Product(
         product_name: json['product_name'],
         product_price: json['product_price'],
         product_image_link: json['product_image_link'],
         shop: json['shop']
      );
   }
}