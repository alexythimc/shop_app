import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/product_cards.dart';

import 'cart_page.dart';
import 'global_variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "";
  @override
  void initState() {
    // TODO: implement initState
    selectedCategory = "All";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    List<String> category = [
      "All",
      "Adidas",
      "Nike",
      "New Balance",
      "Converse"
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Text(
                      "Shoes\nCollection",
                      style: GoogleFonts.lato(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.brown,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.zero,
                            ),
                          ),
                          hintText: "Search",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                              right: Radius.zero,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 1000,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        final String categoryType = category[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = categoryType;
                              });

                              print(selectedCategory);
                            },
                            child: Chip(
                              label: Text(
                                category.elementAt(index),
                                style: GoogleFonts.lato(
                                    color: selectedCategory == categoryType
                                        ? Colors.white
                                        : Colors.brown,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: selectedCategory == categoryType
                                  ? Colors.brown
                                  : Colors.white,
                              // const Color.fromRGBO(148, 145, 107, 1.0),
                              elevation: 50,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCards(
                          title: products[index]["title"].toString(),
                          price: products[index]["price"].toString(),
                          index: index,
                          path: products[index]["imageUrl"].toString(),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedIconTheme: const IconThemeData(color: Colors.brown),
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: IconButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => CartPage(
                            product: products[0],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.home))),
            BottomNavigationBarItem(
                label: "Cart",
                icon: IconButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => CartPage(
                            product: products[0],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart)))
          ],
        ),
      ),
    );
  }
}
