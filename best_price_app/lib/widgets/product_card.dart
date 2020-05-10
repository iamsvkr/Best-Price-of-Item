import '../model/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // const ProductCard({Key key}) : super(key: key);

  final Product product;

  ProductCard({
    @required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image.network(product.product_image_link),
        title: Text(product.product_name.substring(0, 9)),
        subtitle: Text("Rs. "+product.product_price),
      ),
    );
  }
}