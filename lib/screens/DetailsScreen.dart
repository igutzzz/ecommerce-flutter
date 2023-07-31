import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
    price = json["price"];
    rating = json["rating"];
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
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.green[700]),
          textTheme: GoogleFonts.interTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.green.shade700),
          ))),
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Detalhes",
            style: GoogleFonts.poppins(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: "product$widget.id",
                    child: Center(
                        child: Image.network(
                      wine.img,
                      height: 450,
                    ))),
                Text(
                  wine.name,
                  style: GoogleFonts.inter(
                      fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "R\$${wine.price.toString()}",
                    style: GoogleFonts.inter(
                      fontSize: 20
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    child: const Text("Adicionar ao carrinho"),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "Descrição",
                        style: GoogleFonts.inter(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ), 
                    Text(wine.description)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
