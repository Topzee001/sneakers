
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/constants/svg_icons.dart';
import 'package:sneakers/view_tile/featured_grid_tile.dart';

import '../components/add_to_cart_button.dart';
import '../components/favourite_icon.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../model/product.dart';
import '../provider/cart_provider.dart';

class MySingleProductPage extends StatefulWidget {
  const MySingleProductPage({
    super.key,
    required this.product,
    required this.sneakerId,
    //required this.onAddToCart,
  });
  final Sneaker product;
  final String sneakerId;

  @override
  State<MySingleProductPage> createState() => _MySingleProductPageState();
}

class _MySingleProductPageState extends State<MySingleProductPage> {
  int quantityState = 1;
  int activeIndex = 0;
  int selectedSize = 0;
  int selectedColor = 0;

  void reduceQuantity() {
    if (quantityState > 1) {
      setState(() {
        quantityState--;
      });
    }
  }

  void addQuantity() {
    setState(() {
      quantityState++;
      print(quantityState);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final sneaker = cartProvider.getSneakerById(widget.sneakerId);

    // final random = Random();
    // final allProducts = cartProvider.products;
    // allProducts.shuffle(random);
    // double itemTotal = cartProvider.products.price;
    if (sneaker == null) {
      return const Scaffold(
        body: Center(child: Text('Sneaker not found')),
      );
    }

    final egoSneakers = cartProvider.products.take(4).toList();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  color: const Color.fromRGBO(255, 253, 253, 1),
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
                        errorWidget: (context, url, error) => const Icon(Icons.shop),
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
                            MyFavourite(
                              sneaker: widget.product,
                              //                 onTap: () {
                              //   cartProvider.toggleFavourite(widget.product);
                              // },
                            )
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
                                color: const Color.fromRGBO(85, 85, 85, 1),
                              ),
                            ),
                            const SizedBox(
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
                                color: const Color.fromRGBO(85, 85, 85, 1),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 358,
                          height: 18,
                          child: Text(
                            'Description',
                            style: GoogleFonts.robotoFlex(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(42, 42, 42, 1),
                                height: 17.58 / 15),
                          ),
                        ),
                        Text(
                          widget.product.description.toString(),
                          style: GoogleFonts.robotoFlex(
                            height: 17.58 / 15,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(85, 85, 85, 1),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 358,
                          height: 18,
                          child: Text(
                            'Size',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(42, 42, 42, 1),
                            ),
                          ),
                        ),
                        SizedBox(
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
                                            color:
                                                Colors.white.withOpacity(0.1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3))
                                      ],
                                      color: selectedSize == index
                                          ? Colors.blue
                                          : const Color.fromRGBO(249, 249, 249, 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 4),
                                      child: selectedSize == index
                                          ? Center(
                                              child: Text(
                                                sizes[index],
                                                style: const TextStyle(
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
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        85, 85, 85, 1),
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
                        const SizedBox(height: 3),
                        SizedBox(
                          height: 18,
                          width: 358,
                          child: Text(
                            'Colors',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(42, 42, 42, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          height: 24,
                          width: 358,
                          child: Row(
                            children: List.generate(productColor.color.length,
                                (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedColor = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  height: 24,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: productColor.color[index]),
                                  child: selectedColor == index
                                      ? const Center(
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 18,
                          width: 358,
                          child: Text(
                            'Quantity',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(42, 42, 42, 1),
                            ),
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(249, 249, 249, 1),
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
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 16,
                                  ),
                                ),
                                //quantity
                                Container(
                                  color: const Color.fromRGBO(0, 114, 198, 0.12),
                                  width: 25,
                                  height: 26,
                                  child: Center(
                                      child: Text(quantityState.toString(),
                                          style: GoogleFonts.robotoFlex(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400))),
                                ),
                                //add quantity
                                IconButton(
                                  iconSize: 10.67,
                                  onPressed: addQuantity,
                                  icon: const Icon(Icons.add, size: 16),
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
                      margin: const EdgeInsets.only(left: 20),
                      width: 189,
                      height: 28,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "More from Ego",
                        style: GoogleFonts.robotoFlex(
                          color: const Color.fromRGBO(0, 0, 0, 1),
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
                            physics: const NeverScrollableScrollPhysics(),
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
                                  final selectedSizeValue = sizes[selectedSize];
                                  final selectedColorValue =
                                      productColor.color[selectedColor];
                                  cartProvider.addToCart(product, quantityState,
                                      selectedSizeValue, selectedColorValue);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          '${widget.product.name} added to cart'),
                                      duration:
                                          const Duration(milliseconds: 1000),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 390,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total price',
                      style: GoogleFonts.robotoFlex(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(157, 157, 157, 1),
                      ),
                    ),
                    //Text('₦ ${widget.product.price.toStringAsFixed(2)}'),
                    Text(
                        //'₦ ${(widget.product.price * quantityState).toStringAsFixed(2)}',
                        '₦ ${cartProvider.updateSingleProductTotalPrice(sneaker.id, quantityState).toStringAsFixed(2)}')
                  ],
                ),
                //Spacer(),
                AddToCart(
                  onAddToCart: () {
                    final selectedSizeValue = sizes[selectedSize];
                    final selectedColorValue =
                        productColor.color[selectedColor];
                    cartProvider.addToCart(sneaker, quantityState,
                        selectedSizeValue, selectedColorValue);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${widget.product.name} added to cart'),
                        duration: const Duration(milliseconds: 1000),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
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