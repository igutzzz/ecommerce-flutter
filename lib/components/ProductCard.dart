import 'package:ecommerce_flutter/screens/DetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String img;
  final String name;
  final double price;
  final double rating;

  const ProductCard(
      {super.key,
      required this.id,
      required this.img,
      required this.name,
      required this.price,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailsScreen(id: id)));
      },
      child: Hero(
        tag: "product$id",
        child: SizedBox(
          width: 300,
          height: 500,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                color: Colors.grey[200]),
            padding:
                const EdgeInsets.only(top: 10, right: 10, bottom: 30, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Center(
                          child: Image.network(
                        img,
                        height: 200,
                        width: double.infinity,
                      )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        name,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "R\$${price.toString()}",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    Text(rating.toString())
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
