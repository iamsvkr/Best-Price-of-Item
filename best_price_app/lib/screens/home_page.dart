import 'package:best_price_app/model/product.dart';
import 'package:best_price_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _productName = TextEditingController();

  List<Product> productList = [];

  _submit(String productName) async {
    List<Product> temp = await getItems(productName);
    setState(() {
      productList = temp;
    });
    // print(productList.length.toString());
  }

  Future<List<Product>> getItems(String productName) async {
    var url = "http://10.0.2.2:3000/product/"+productName;
    var response = await http.get(url);
    List responseJson = json.decode(response.body);
    if(response.statusCode == 200 && response.body!='[]'){
      print("success");
      return responseJson.map((m) => new Product.fromJson(m)).toList();
    }else{
      print("failed");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
      ),

      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: _productName,
                decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  hintText: 'Enter Product Name',
                  labelText: 'Enter Product Name',
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  _submit(_productName.text.toString());
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryTextTheme.button.color,
              ),
            ),
            SizedBox(height: 20,),
            productList.length == 0 ? Text("Loading") : SingleChildScrollView (
                          child: Container(
                height: 300,
                child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    Product item = productList[index];
                    return ProductCard(product: item,);
                  },
                ),
              ),
            )
          ],
        ), 
      ),
    );
  }
}