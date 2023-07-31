import 'package:ecommerce_flutter/components/ProductCard.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List wines = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("data/wines.json");
    final data = await jsonDecode(response);
    setState(() {
      wines = data["wines"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
    print(wines);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.green[700]),
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text("Home"),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Text(
                      "Vinhos",
                      style: GoogleFonts.poppins(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: (10/15)
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: wines.length,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        clipBehavior: Clip.antiAlias,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            id: wines[index]["id"],
                            img: wines[index]["img"], 
                            name: wines[index]["name"],
                            price: wines[index]["price"],
                            rating: wines[index]["rating"],
                          );
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
