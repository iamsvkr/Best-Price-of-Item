import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // const ProductCard({Key key}) : super(key: key);

  final String imglink, name, price;

  ProductCard({
    @required this.name,
    @required this.price, 
    @required this.imglink
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              height: 40.0,
              width: 40.0,
              child: Image.network(imglink),
            ),
            SizedBox(height : 10),
            Container(
              
            ) 
          ],
        ),
      ),
    );
  }
}