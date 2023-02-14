import 'package:flutter/material.dart';

import 'Global.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed('cart');
        },
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.bookmark_add),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Image(
                image: NetworkImage('${data['image']}'),
                height: 200,
              ),
              Text(
                "${data['name']} Vivobook",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Price :- ${data['total']}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if(i > 0) {
                                  i--;
                                  data['total'] -= data['price'];
                                }
                              });
                            },
                            icon: const Icon(Icons.remove)),
                        Text(
                          "$i",
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                i++;
                                data['total'] = data['price'] * i;
                              });
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      Global.cart.add(data);
                    });
                  }, icon: const Icon(Icons.bookmark_add_outlined)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment(-0.9, 0),
                child: Text(
                  "Description :- ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "${data['description']}",
                  style: const TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
