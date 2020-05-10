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
}