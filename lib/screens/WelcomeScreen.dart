import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.all(20),
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
                padding: const EdgeInsets.only(left: 20, top: 20),
                width: 250,
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
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 50), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                child: Text(
                  "Explorar",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400)
                  ),
                ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
