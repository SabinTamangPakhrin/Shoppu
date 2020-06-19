import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppu/models/cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
          ),
          body: cart.getCartLen() == 0
              ? Center(child: Text('No items in cart'))
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemCount: cart.getCartLen(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(cart.getCartItems()[index].name),
                                    Text('Rs.' +
                                        cart
                                            .getCartItems()[index]
                                            .price
                                            .toString()),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    cart.remove(cart.getCartItems()[index]);
                                  },
                                ),
                              ),
                            ],
                          );
                        }),
                    Container(
                        height: 50,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text(
                            'Total Price:' +
                                '  Rs.' +
                                cart.totalPrice.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {},
                        ))
                  ],
                ),
        );
      },
    );
  }
}
