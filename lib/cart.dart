import 'package:flutter/material.dart';

import 'Global.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: Global.cart.length,
            itemBuilder: (context,i){
            return Card(
              elevation: 8,
              child: ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(Global.cart[i]['image']),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.transparent,
                  ),
                ),
                title: Text(Global.cart[i]['name']),
                subtitle: Text("${Global.cart[i]['price']}"),
                trailing: IconButton(onPressed: (){
                  setState(() {
                    Global.cart.remove(Global.cart[i]);
                  });
                }, icon: const Icon(Icons.delete_outlined)),
              ),
            );
            }),
      ),
    );
  }
}
