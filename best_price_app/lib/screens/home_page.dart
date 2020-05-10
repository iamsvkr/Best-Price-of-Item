import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _product = TextEditingController();

  _submit(String product) async {
    var url = "http://10.0.2.2:3000/product/"+product;
    var response = await http.get(url);
    final body = json.decode(response.body);
    if(response.statusCode == 200 && response.body!='[]'){
      print("success");     
    }else{
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
      ),

      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: _product,
                decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  hintText: 'Enter Product Name',
                  labelText: 'Enter Product Name',
                ),
              ),
            ),
            SizedBox(height: 10,),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                _submit(_product.text.toString());
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding:
              EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).primaryTextTheme.button.color,
            ),
            SizedBox(height: 20,),
          ],
        ), 
      ),
    );
  }
}