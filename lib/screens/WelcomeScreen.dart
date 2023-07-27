import 'package:ecommerce_flutter/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green[700]
      ),
      home: Builder(
        builder: (context) =>  Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                      "Winery",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(image: AssetImage("assets/imgs/drinking wine-bro.png")),
                    Container(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    width: 300,
                    child: Text(
                        "Vinhos são a melhor companhia",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, )
                        ),
                      ),
                  )
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen()
                      )
                      );
                    }, 
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700], minimumSize: const Size(double.infinity, 50), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                    child: Text(
                      "EXPLORAR",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)
                      ),
                    ),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
