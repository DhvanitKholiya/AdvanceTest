import 'package:flutter/material.dart';

class Related extends StatefulWidget {
  const Related({Key? key}) : super(key: key);

  @override
  State<Related> createState() => _RelatedState();
}

class _RelatedState extends State<Related> {
  @override
  Widget build(BuildContext context) {
    List data = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${data[0]['title']}",
          style: const TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.builder(
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('detail',arguments: i);
              },
              child: Card(
                elevation: 10,
                child: GridView(
                    padding: const EdgeInsets.all(15),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: NetworkImage('${data[i]['image']}'),
                              height: 47,
                              fit: BoxFit.cover,
                            ),
                            Text("${data[i]['name']}"),
                            Text("Rs :- ${data[i]['price']}"),
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}
