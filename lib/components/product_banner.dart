import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneakers/model/product.dart';

import 'banner_addto_cart.dart';

class ProductBanner {
  final LinearGradient gradient;
  final Widget Function(Sneaker) contentBuilder;

  ProductBanner({
    required this.contentBuilder,
    required this.gradient,
  });
}

final Map<String, ProductBanner> productConfigs = {
  'TO196029P': ProductBanner(
    gradient: const LinearGradient(
      colors: [
        Color.fromRGBO(0, 114, 198, 0.8),
        Color.fromRGBO(0, 55, 96, 0.9)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    contentBuilder: (product) => buildProductContent1(product),
  ),
  'TO196059P': ProductBanner(
    gradient: const LinearGradient(
      colors: [Color.fromRGBO(41, 41, 41, 1), Color.fromRGBO(51, 51, 51, 1)],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    contentBuilder: (product) => buildProductContent2(product),
  ),
  'TO198086P': ProductBanner(
    gradient: const LinearGradient(
      colors: [Color.fromRGBO(0, 55, 96, 0.8), Color.fromRGBO(29, 41, 57, 1)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    contentBuilder: (product) => buildProductContent3(product),
  ),
  'TO198176P': ProductBanner(
    gradient: const LinearGradient(
      colors: [
        Color.fromRGBO(255, 165, 0, 0.6),
        Color.fromRGBO(255, 205, 0, 0.4)
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    contentBuilder: (product) => buildProductContent4(product),
  ),
};

Widget buildProductContent1(Sneaker product) {
  return Container(
    width: 358.w,
    height: 200.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 154.h,
          width: 154.w,
          child: CachedNetworkImage(
            imageUrl: product.imageUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.shop),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 69.h,
          width: 133.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.category,
                style: GoogleFonts.robotoFlex(
                  color: const Color.fromRGBO(234, 234, 234, 1),
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.robotoFlex(
                      color: const Color.fromRGBO(234, 234, 234, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 14.06 / 12,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '₦${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.robotoFlex(
                      color: const Color.fromRGBO(234, 234, 234, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 14.06 / 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              AddToCart1(
                onAddToCart1: () {},
                product: product,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildProductContent2(Sneaker product) {
  return Row(
    children: [
      // Expanded(child: Image.network(product.imageUrl, fit: BoxFit.cover)),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 87.h,
              width: 152.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: GoogleFonts.robotoFlex(
                        color: const Color.fromRGBO(234, 234, 234, 1),
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        height: 9.38 / 8),
                  ),
                  Text(
                    product.name,
                    style: GoogleFonts.robotoFlex(
                      color: const Color.fromRGBO(234, 234, 234, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 14.06 / 12,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '₦${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.robotoFlex(
                      color: const Color.fromRGBO(234, 234, 234, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 14.06 / 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AddToCart1(
                    onAddToCart1: () {},
                    product: product,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 154.h,
        width: 154.w,
        child: CachedNetworkImage(
          imageUrl: product.imageUrl,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.shop),
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}

Widget buildProductContent3(Sneaker product) {
  return SizedBox(
    width: 358.w,
    height: 200.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 154.h,
          width: 154.w,
          child: CachedNetworkImage(
            imageUrl: product.imageUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.shop),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 69.h,
          width: 133.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.category,
                style: GoogleFonts.robotoFlex(
                  color: const Color.fromRGBO(234, 234, 234, 1),
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.robotoFlex(
                      color: const Color.fromRGBO(234, 234, 234, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 14.06 / 12,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '₦${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.robotoFlex(
                      color: const Color.fromRGBO(234, 234, 234, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 14.06 / 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              AddToCart1(
                onAddToCart1: () {},
                product: product,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildProductContent4(Sneaker product) {
  return SizedBox(
    width: 358.w,
    height: 200.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 69.h,
          width: 133.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.category,
                style: GoogleFonts.robotoFlex(
                  color: const Color.fromRGBO(42, 42, 42, 1),
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.robotoFlex(
                      color: const Color.fromRGBO(42, 42, 42, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 14.06 / 12,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '₦${product.price.toStringAsFixed(2)}',
                    style: GoogleFonts.robotoFlex(
                      color: const Color.fromRGBO(42, 42, 42, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 14.06 / 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              AddToCart1(
                onAddToCart1: () {},
                product: product,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 154.h,
          width: 154.h,
          child: CachedNetworkImage(
            imageUrl: product.imageUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.shop),
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}

Widget buildDefaultContent(Sneaker product) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(product.name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white)),
      Text('₦${product.price.toStringAsFixed(2)}',
          style: const TextStyle(color: Colors.white)),
    ],
  );
}
