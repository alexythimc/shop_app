import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/home_page.dart';

class CartPage extends StatefulWidget {
  final Map<String, Object>? product;
   List<Map<String, Object>> cartProducts=[];
  final int? size;
  CartPage({
    super.key,
    this.product,
    this.size,
    //  required this.cartProducts,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, Object>> cartProducts=[];

  @override
  void initState() {
    super.initState();
     //cartProducts = widget.cartProducts;
    if (widget.product != null) {
      addToCart(widget.product!);
    }
  }

  void addToCart(Map<String, Object> newProduct) {
    cartProducts.add(newProduct);
    widget.cartProducts=cartProducts;
    setState(() {
      if (kDebugMode) {
        print("product count${widget.cartProducts}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.cartProducts=cartProducts;
    int currentIndex = 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: GoogleFonts.lato(),
        ),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              setState(() {});
            },
            label: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Column(
        children: [
          if (cartProducts.isEmpty)
            const Center(
              child: Text("No items in the cart"),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "${cartProducts[index]["imageUrl"]}",
                    ),
                  ),
                  title: Text(
                    cartProducts[index]["title"].toString(),
                  ),
                  subtitle: Text(
                    "Size: ${cartProducts[index]["size"].toString()}",
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
                      builder: (BuildContext context) => const HomePage()),
                );
              },
              icon: const Icon(
                Icons.home,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
          )
        ],
      ),
    );
  }
}
