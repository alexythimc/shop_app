import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/cart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    // Access the product from the widget
    Map<String, Object> product = widget.product;
    List<int> sizeList = product['size'] as List<int>;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.brown,
          ),
        ),
        title: Text("Product Details", style: GoogleFonts.lato()),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product['title'].toString(),
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Flexible(
            flex: 4,
            child: Image(
              image: AssetImage(
                product['imageUrl'].toString(),
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(250, 240, 216, 1.0),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 250,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_bag_sharp,
                        color: Colors.brown,
                      ),
                      Text(
                        product['price'].toString(),
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sizeList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = sizeList[index];

                              print(selectedSize);
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedSize == sizeList[index]
                                ? Colors.brown
                                : Colors.white,
                            label: Text(
                              sizeList[index].toString(),
                              style: GoogleFonts.lato(
                                color: selectedSize == sizeList[index]
                                    ? Colors.white
                                    : Colors.brown,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      const Size(double.infinity, 50),
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.brown),
                  ),
                  onPressed: () {
                    if (selectedSize == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please select a size",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Color.fromRGBO(100, 99, 99, 1.0),
                        ),
                      );
                      return;
                    }
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => CartPage(
                          product: product,
                          size: selectedSize,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add To Cart   ",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Icon(
                        Icons.shopping_cart,
                        size: 25,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
