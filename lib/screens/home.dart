import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppu/models/cart.dart';
import 'package:shoppu/models/product.dart';
import 'package:shoppu/screens/checkout.dart';

class HomeScreen extends StatelessWidget {
  final productList = [
    Product(
        name: 'Nike Shoes',
        description: 'This is mostly used for casual wear',
        price: 6000),
    Product(
        name: 'Addidas Shoes',
        description: 'This is mostly used for casual wear',
        price: 7000),
    Product(
        name: 'Vans Shoes',
        description: 'This is moslty used casual wear',
        price: 4000),
    Product(
        name: 'Converse Shoes',
        description: 'This is moslty used casual wear',
        price: 5000),
    Product(
        name: 'Ezeey Shoes',
        description: 'This is moslty used casual wear',
        price: 10000),
    Product(
        name: 'Caliber Shoes',
        description: 'This is moslty used casual wear',
        price: 3000),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Shoppu'),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartScreen()));
                      },
                    ),
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(cart.getCartLen().toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    )
                  ],
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 5),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: ListTile(
                    title: Text(productList[index].name),
                    subtitle: Text(productList[index].description),
                    trailing: Text('Rs.'+productList[index].price.toString()),
                  ),                  
                  onTap: () {
                    cart.add(productList[index]);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
