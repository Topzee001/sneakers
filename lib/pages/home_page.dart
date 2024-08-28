import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/constants/colors.dart';
import 'package:sneakers/home.dart';
import 'package:sneakers/services/product_service.dart';

import '../brand/brands.dart';

import '../components/product_banner.dart';
import '../constants/sizes.dart';
import '../model/product.dart';
import '../product_container.dart';
import '../provider/cart_provider.dart';
import '../view_tile/featured_grid_tile.dart';
import '../view_tile/special_grid_tile.dart';

class MyHomePage extends StatefulWidget {
  // final Sneaker product;
  const MyHomePage({
    super.key,
    //required this.product,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  List<Sneaker> specificProducts = [];
  bool showAllProducts = false;

  int get quantityState => 1;

  String get defaultSize => sizes[0];

  Color get defaultColor => productColor.color[0];

  int _currentCarouselIndex = 0;

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
        title: Text("AG-Topzee", style: GoogleFonts.aclonica(fontSize: 25)),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.search_sharp),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHome(
                        initialIndex: 4,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.history),
              ),
            ],
          ),
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
                      width: 49.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          color: Color(0xFFE89705),
                          border: Border.all(
                              color: Color(0xFFFFA500), width: 2.0.w),
                          borderRadius: BorderRadius.circular(46.13.r)),
                      child: Center(
                        child: Text(
                          "AD",
                          style: GoogleFonts.robotoFlex(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w500,
                            height: 22.27 / 19.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4.0.w),
                      width: 305.w,
                      height: 40.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 305.0.w, // Width set to 305px
                            height: 18.0.h,
                            child: Text(
                              'Good afternoon👋🏾',
                              style: GoogleFonts.robotoFlex(
                                  color: Color.fromRGBO(112, 112, 112, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                  height: 17.58 / 15),
                            ),
                          ),
                          Container(
                            width: 305.0.w, // Width set to 305px
                            height: 18.0.h,
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
                height: 621.h,
                //width: 390.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 189.w,
                      height: 28.h,
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: FittedBox(
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
                      ),
                    ),
                    // SizedBox(height: 10),
                    cartProvider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2 / 3,
                              ),
                              itemCount: specialOffers.length,
                              itemBuilder: (context, index) {
                                if (cartProvider.products.isEmpty) {
                                  return null;
                                }
                                final product = specialOffers[index];

                                return GridViewTile(
                                  product: product,
                                  onAddToCart: () {
                                    cartProvider.addToCart(
                                        product,
                                        quantityState,
                                        defaultSize,
                                        defaultColor);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            '${product.name} added to cart (Size: $defaultSize, Default color)'),
                                        duration:
                                            const Duration(milliseconds: 1500),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
              // const SizedBox(height: 5),
              //create featured products
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: 189,
                  height: 28,
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: FittedBox(
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
                //padding: EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  final product = featureSneakers[index];
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
                    },
                  );
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
        height: 200.h,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
      items: specificProducts.map((product) {
        final config = productConfigs[product.uniqueId];
        print(
            'Processing product: ${product.uniqueId}, Config found: ${config != null}');
        return Builder(
          builder: (BuildContext context) {
            return MyProductContainer(
              product: product,
              gradient: config?.gradient ??
                  LinearGradient(
                    colors: [
                      Color(0xFF0072C6).withOpacity(0.8),
                      Color(0xFF003760).withOpacity(0.9),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
              content: config != null
                  ? config.contentBuilder(product)
                  : buildDefaultContent(product),
            );
          },
        );
      }).toList(),
    );
  }
}
