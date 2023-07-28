import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsScreen extends StatefulWidget {
  final int id;
  const DetailsScreen({super.key, required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class Wine {
  var id;
  var name;
  var img;
  var description;
  var price;
  var rating;

  Wine.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    img = json["img"];
    description = json["description"];
    price = json[price];
    rating = json[rating];
  }
}

class _DetailsScreenState extends State<DetailsScreen> {
  var wine;
  Future<void> readJson() async {
    final String response = await rootBundle.loadString("data/wines.json");
    final Map<String, dynamic> json = await jsonDecode(response);
    final List<dynamic> data = json['wines'];
    setState(() {
      data.retainWhere((element) {
        return element["id"] == widget.id;
      });
      wine = Wine.fromJson(data[0]);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Detalhes"),
        ),
        body: Column(
          children: [
            Hero(tag: "product$widget.id", child: Image.network(wine.img)),
            Text(wine.name)
          ],
        ),
      ),
    );
  }
}
