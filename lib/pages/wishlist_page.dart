import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/constants/svg_icons.dart';
import 'package:sneakers/home.dart';
import 'package:sneakers/provider/cart_provider.dart';
import 'package:sneakers/view_tile/featured_grid_tile.dart';

import '../components/my_container.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';

class MyWishlist extends StatelessWidget {
  const MyWishlist({super.key});

  int get quantityState => 1;

  String get defaultSize => sizes[0];

  Color get defaultColor => productColor.color[0];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Wishlist',
            style: GoogleFonts.robotoFlex(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              height: 22.27 / 19,
              color: Color.fromRGBO(41, 41, 41, 1),
            ),
          ),
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHome(
                                      initialIndex: 3,
                                    )));
                      },
                      icon: SvgPicture.string(SvgIcons.cart1)),
                ),
              ],
            ),
          ],
        ),
        body: cartProvider.favourites.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Illustration.png'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'You have not added any Item to your wish list',
                      style: GoogleFonts.robotoFlex(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        height: 22.27 / 19.0,
                      ),
                    ),
                    MyContainerButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHome(
                                      initialIndex: 1,
                                    )));
                      },
                      text: 'Discover products',
                    )
                  ],
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2 / 3),
                itemCount: cartProvider.favourites.length,
                itemBuilder: (context, index) {
                  final product = cartProvider.favourites[index];
                  return FeaturedGridTile(
                      product: product,
                      onAddToCart: () {
                        cartProvider.addToCart(
                            product, quantityState, defaultSize, defaultColor);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                '${product.name} added to cart (Size: $defaultSize, Default color)'),
                            duration: const Duration(milliseconds: 1500),
                          ),
                        );
                      });
                },
              ));
  }
}
