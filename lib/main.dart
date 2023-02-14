import 'package:advancetest1/detailpage.dart';
import 'package:advancetest1/relatedPage.dart';
import 'package:flutter/material.dart';
import 'package:advancetest1/Global.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      'related' : (context) => const Related(),
      'detail' : (context) => const DetailPage(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: Global.items.map((e) => GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('related',arguments: e['list']);
            },
            child: Card(
              margin: const EdgeInsets.all(15),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${e["image"]}"),
                  backgroundColor: Colors.transparent,
                ),
                title: Text("${e['name']}",style: const TextStyle(fontSize: 18),),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          )).toList(),
        ),
      ),
    );
  }
}
