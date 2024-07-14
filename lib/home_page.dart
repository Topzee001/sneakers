import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/services/product_service.dart';

import 'brand/brands.dart';

import 'components/product_banner.dart';
import 'model/product.dart';
import 'product_container.dart';
import 'provider/cart_provider.dart';
import 'view tile/special_grid_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  List<Sneaker> specificProducts = [];

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
              // _buildBannerCarousel(),

//TODO: add brands widget
              const MyBrands(),
              const SizedBox(
                height: 20,
              ),
              //TODO: special offer products
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
                    height:
                        28.13 / 24, // line-height as a multiplier of font size
                  ),
                ),
              ),
              SizedBox(height: 10),
              //TODO: create special offer products
              cartProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                    height: 600,
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2/3,
                        ),
                        padding: const EdgeInsets.all(15),
                        itemCount: cartProvider.products.length,
                        itemBuilder: (context, index) {
                          if (cartProvider.products.isEmpty) {
                            return null;
                          }
                          final product = cartProvider.products[index];
                          // int actualIndex =
                          //     cartProvider.products.length - 4 + index;
                    
                          // if (actualIndex >= 0 &&
                          //     actualIndex < cartProvider.products.length) {
                          //   Sneaker product = cartProvider.products[actualIndex];
                    
                          return GridViewTile(
                            product: product,
                            onAddToCart: () {
                              cartProvider.addToCart(product);
                            },
                          );
                        }
                        // return null;
                    
                        ),
                  ),
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
                    colors: [Colors.grey.shade200, Colors.grey.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
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
