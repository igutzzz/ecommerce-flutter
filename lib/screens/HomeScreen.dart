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
                children: [
                  const Text("Vinhos"),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: wines.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(20),
                            color: Colors.grey,
                            child: Text(wines[index]["name"]),
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
