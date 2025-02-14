import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/product_details_page.dart';

class ProductCards extends StatelessWidget {
  final String title;
  final String price;
  final int index;
  final String path;
  const ProductCards(
      {super.key,
      required this.title,
      required this.price,
      required this.index,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 250,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ProductDetailsPage(product: products[index]);
            }));
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: index % 2 == 0
                ? const Color.fromRGBO(213, 202, 176, 1.0)
                : Colors.white,
            child: Column(
              textDirection: TextDirection.ltr,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        textDirection: TextDirection.ltr,
                        title,
                        style: GoogleFonts.lato(
                            color: Colors.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        textDirection: TextDirection.ltr,
                        price,
                        style: GoogleFonts.lato(
                          color: Colors.brown,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    path,
                    alignment: Alignment.center,
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
