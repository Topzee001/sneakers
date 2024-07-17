import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/services/product_service.dart';

import '../brand/brands.dart';

import '../components/product_banner.dart';
import '../model/product.dart';
import '../product_container.dart';
import '../provider/cart_provider.dart';
import '../view tile/featured_grid_tile.dart';
import '../view tile/special_grid_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  List<Sneaker> specificProducts = [];
  bool showAllProducts = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchSpecificProducts();
  }

  Future<void> _fetchSpecificProducts() async {
    final products = await _apiService.fetchSpecificProducts();
    setState(() {
      specificProducts = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    // List<Sneaker> specialOffers = [];
    // List<Sneaker> featureSneakers = [];

    // if (!cartProvider.isLoading) {
    final specialOffers = cartProvider.products.take(4).toList();
    final featureSneakers = cartProvider.products.skip(4).toList();
    final initialFeatureSneakers =
        showAllProducts ? featureSneakers : featureSneakers.take(6).toList();
    // }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("AG-Ezenard", style: GoogleFonts.aclonica(fontSize: 25)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search_sharp),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Container(
                      width: 49,
                      height: 48,
                      decoration: BoxDecoration(
                          color: Color(0xFFE89705),
                          border:
                              Border.all(color: Color(0xFFFFA500), width: 2.0),
                          borderRadius: BorderRadius.circular(46.13)),
                      child: Center(
                        child: Text(
                          "AD",
                          style: GoogleFonts.robotoFlex(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            height: 22.27 / 19.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4.0),
                      width: 305,
                      height: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 305.0, // Width set to 305px
                            height: 18.0,
                            child: Text(
                              'Good afternoon👋🏾',
                              style: GoogleFonts.robotoFlex(
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  height: 17.58 / 15),
                            ),
                          ),
                          Container(
                            width: 305.0, // Width set to 305px
                            height: 18.0,
                            child: Text(
                              'Ada Dennis',
                              style: GoogleFonts.robotoFlex(
                                  color: Color.fromRGBO(42, 42, 42, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  height: 22.27 / 19),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //TODO: add carousel widget
              _buildBannerCarousel(),

//TODO: add brands widget
              const MyBrands(),
              const SizedBox(
                height: 20,
              ),
              //TODO: special offer products

              //TODO: create special offer products
              Container(
                height: 621,
                width: 390,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 189,
                      height: 28,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Our Special Offers",
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
                            itemCount: specialOffers.length,
                            itemBuilder: (context, index) {
                              if (cartProvider.products.isEmpty) {
                                return null;
                              }
                              final product = specialOffers[index];

                              return GridViewTile(
                                product: product,
                                onAddToCart: () {
                                  cartProvider.addToCart(product);
                                },
                              );
                            },
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              //create featured products
              Container(
                width: 189,
                height: 28,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured Sneakers",
                  style: GoogleFonts.robotoFlex(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    height: 28.13 / 24,
                  ),
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: initialFeatureSneakers.length,
                padding: EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  final product = featureSneakers[index];
                  return FeaturedGridTile(
                      product: product,
                      onAddToCart: () {
                        cartProvider.addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to cart'),
                            duration: const Duration(milliseconds: 1000),
                          ),
                        );
                      });
                },
              ),
              if (featureSneakers.length > 6 && !showAllProducts)
                Center(
                  child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                        child: Container(
                          height: 42,
                          width: 104,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 114, 198, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                              child: Text(
                            'View more',
                            style: GoogleFonts.robotoFlex(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 17.58 / 15,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          )),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          showAllProducts = true;
                        });
                      }),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBannerCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
      items: specificProducts.map((product) {
        final config = productConfigs[product.id];
        return Builder(
          builder: (BuildContext context) {
            return MyProductContainer(
              gradient: config?.gradient ??
                  LinearGradient(
                    colors: [
                      Color(0xFF0072C6).withOpacity(0.8),
                      Color(0xFF003760).withOpacity(0.9),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
              content: config?.contentBuilder(product) ??
                  _buildDefaultContent(product),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildDefaultContent(Sneaker product) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(product.name,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        Text('₦${product.price.toStringAsFixed(2)}',
            style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
