import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/provider/cart_item_model.dart';
import 'package:flutterdemo/provider/inherited_provider.dart';

import 'cart_item.dart';
import 'consumer.dart';

class CartProvider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartProviderState();
}

class CartProviderState extends State<CartProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider demo"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartItemModel>(
          data: CartItemModel(),
          child: Builder(builder: (context) {
            return Column(children: [
              Consumer<CartItemModel>(
                  builder: (context, cart) =>
                      Text("${cart.totalPrice}:${cart.items.length}")),
              Builder(builder: (context) {
                print("raise button");
                return RaisedButton(
                  onPressed: () {
                    ChangeNotifierProvider.of<CartItemModel>(context,
                            listener: false)
                        .add(CartItem(20.0, 1));
                  },
                  child: Text("add"),
                );
              })
            ]);
          }),
        ),
      ),
    );
  }
}
