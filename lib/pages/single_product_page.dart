import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/constants/svg_icons.dart';
import 'package:sneakers/view%20tile/featured_grid_tile.dart';

import '../components/add_to_cart_button.dart';
import '../components/favourite_icon.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../model/product.dart';
import '../provider/cart_provider.dart';
import 'cart_page.dart';

class MySingleProductPage extends StatefulWidget {
  const MySingleProductPage({
    super.key,
    required this.product,
    //required this.onAddToCart,
  });
  final Sneaker product;

  @override
  State<MySingleProductPage> createState() => _MySingleProductPageState();
}

class _MySingleProductPageState extends State<MySingleProductPage> {
  int quantityState = 0;

  void reduceQuantity() {
    setState(() {
      quantityState--;
    });
  }

  void addQuantity() {
    setState(() {
      quantityState++;
      print(quantityState);
    });
  }

  void productTotalPrice() {}
  int activeIndex = 0;
  int selectedSize = 0;
  int selectedColor = 0;

  // final VoidCallback onAddToCart;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    // final random = Random();
    // final allProducts = cartProvider.products;
    // allProducts.shuffle(random);
    // double itemTotal = cartProvider.products.price;

    final egoSneakers = cartProvider.products.take(4).toList();

    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            color: Color.fromRGBO(255, 253, 253, 1),
            height: 399,
            width: 390,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: const EdgeInsets.all(90),
                height: 240,
                width: 240,
                child: CachedNetworkImage(
                  imageUrl: widget.product.imageUrl,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.shop),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              //margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.category,
                    style: GoogleFonts.robotoFlex(
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: GoogleFonts.robotoFlex(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      MyFavourite()
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '₦${widget.product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.robotoFlex(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '100 sold',
                        style: GoogleFonts.robotoFlex(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(85, 85, 85, 1),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      SvgPicture.string(SvgIcons.star),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '4.5(32 reviews)',
                        style: GoogleFonts.robotoFlex(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(85, 85, 85, 1),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 358,
                    height: 18,
                    child: Text(
                      'Description',
                      style: GoogleFonts.robotoFlex(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(42, 42, 42, 1),
                          height: 17.58 / 15),
                    ),
                  ),
                  Text(
                    widget.product.description.toString(),
                    style: GoogleFonts.robotoFlex(
                      height: 17.58 / 15,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(85, 85, 85, 1),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 358,
                    height: 18,
                    child: Text(
                      'Size',
                      style: GoogleFonts.robotoFlex(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(42, 42, 42, 1),
                      ),
                    ),
                  ),
                  Container(
                    width: 358,
                    height: 26,
                    //margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        sizes.length,
                        (index) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(4),
                            onTap: () {
                              setState(() {
                                selectedSize = index;
                                print(selectedSize);
                              });
                            },
                            child: Container(
                              height: 26,
                              width: 40.86,
                              //margin: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ],
                                color: selectedSize == index
                                    ? Colors.blue
                                    : Color.fromRGBO(249, 249, 249, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                child: selectedSize == index
                                    ? Center(
                                        child: Text(
                                          sizes[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Text(
                                          sizes[index],
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(85, 85, 85, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),

                                          // child: sizes[index],
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 18,
                    width: 358,
                    child: Text(
                      'Colors',
                      style: GoogleFonts.robotoFlex(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(42, 42, 42, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    height: 24,
                    width: 358,
                    child: Row(
                      children:
                          List.generate(productColor.color.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedColor = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 12),
                            height: 24,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: productColor.color[index]),
                            child: selectedColor == index
                                ? Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 18,
                    width: 358,
                    child: Text(
                      'Quantity',
                      style: GoogleFonts.robotoFlex(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(42, 42, 42, 1),
                      ),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(249, 249, 249, 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 34,
                    width: 121,
                    child: Center(
                      child: Row(
                        children: [
                          //reduce quantity
                          IconButton(
                            iconSize: 10.67,
                            onPressed: reduceQuantity,
                            icon: Icon(
                              Icons.remove,
                              size: 16,
                            ),
                          ),
                          //quantity
                          Container(
                            color: Color.fromRGBO(0, 114, 198, 0.12),
                            width: 25,
                            height: 26,
                            child: Center(
                                child: Text(cartProvider.quantity.toString(),
                                    style: GoogleFonts.robotoFlex(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400))),
                          ),
                          //add quantity
                          IconButton(
                            iconSize: 10.67,
                            onPressed: cartProvider.increaseQuantity,
                            icon: Icon(Icons.add, size: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 189,
                height: 28,
                alignment: Alignment.centerLeft,
                child: Text(
                  "More from Ego",
                  style: GoogleFonts.robotoFlex(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 28.13 / 24,
                  ),
                ),
              ),
              // SizedBox(height: 10),
              cartProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                      ),
                      padding: const EdgeInsets.all(15),
                      itemCount: egoSneakers.length,
                      itemBuilder: (context, index) {
                        if (cartProvider.products.isEmpty) {
                          return null;
                        }
                        final product = egoSneakers[index];

                        return FeaturedGridTile(
                          product: product,
                          onAddToCart: () {
                            cartProvider.addToCart(product);
                          },
                        );
                      },
                    ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 390,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  height: 42,
                  width: 141,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 114, 198, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SvgPicture.string(SvgIcons.cartIcon),
                      ),
                      Spacer(),
                      AddToCart(
                        onAddToCart: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // bottomNavigationBar: Row(
      //   children: [
      //     //
      //   ],
      // ),
    );
  }
}

// RatingBarIndicator(
                  //   rating: 4.5,
                  //   itemCount: 5,
                  //   itemSize: 12.0,
                  //   direction: Axis.horizontal,
                  //   itemBuilder: (context, index) => Icon(
                  //     Icons.star,
                  //     color: Colors.amber,
                      
                  //   ),
                  // )