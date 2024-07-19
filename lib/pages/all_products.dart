import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/provider/cart_provider.dart';
import 'package:sneakers/view%20tile/featured_grid_tile.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  int get quantityState => 1;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
        appBar: AppBar(
          //centerTitle: true,
          title: Text(
            'All Products',
            style: GoogleFonts.robotoFlex(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              height: 22.27 / 19,
              color: Color.fromRGBO(41, 41, 41, 1),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.grid_view),
            ),
          ],
        ),
        body: cartProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : cartProvider.errorMessage != null
                ? Center(
                    child: Column(
                      children: [
                        Text(cartProvider.errorMessage!),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Retry',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              height: 22.27 / 19,
                              color: Color.fromRGBO(41, 41, 41, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2 / 3),
                    itemCount: cartProvider.products.length,
                    itemBuilder: (context, index) {
                      final product = cartProvider.products[index];
                      return FeaturedGridTile(
                          product: product,
                          onAddToCart: () {
                            cartProvider.addToCart(product, quantityState);
                            //ScaffoldMessenger.of(context).showSnackBar(
                            // SnackBar(
                            //   content: Text('${widget.} added to cart'),
                            //   duration: const Duration(milliseconds: 1000),
                            // ),
                            // );
                          });
                    }));
  }
}
