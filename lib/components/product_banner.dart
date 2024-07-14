import 'package:flutter/material.dart';
import 'package:sneakers/model/product.dart';

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
    gradient: LinearGradient(
      colors: [Colors.red.shade200, Colors.red.shade400],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    contentBuilder: (product) => _buildProductContent1(product),
  ),
  'TO196059P': ProductBanner(
    gradient: LinearGradient(
      colors: [Colors.green.shade200, Colors.green.shade400],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    contentBuilder: (product) => _buildProductContent2(product),
  ),
  'TO198086P': ProductBanner(
    gradient: LinearGradient(
      colors: [Colors.purple.shade200, Colors.purple.shade400],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
    contentBuilder: (product) => _buildProductContent3(product),
  ),
  'TO198176P': ProductBanner(
    gradient: LinearGradient(
      colors: [Colors.orange.shade200, Colors.orange.shade400],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    contentBuilder: (product) => _buildProductContent4(product),
  ),
};

Widget _buildProductContent1(Sneaker product) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image.network(product.imageUrl, fit: BoxFit.cover)),
      Text(product.name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      Text('₦${product.price.toStringAsFixed(2)}',
          style: TextStyle(color: Colors.white)),
    ],
  );
}

Widget _buildProductContent2(Sneaker product) {
  return Row(
    children: [
      Expanded(child: Image.network(product.imageUrl, fit: BoxFit.cover)),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            Text('₦${product.price.toStringAsFixed(2)}',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    ],
  );
}

Widget _buildProductContent3(Sneaker product) {
  return Stack(
    children: [
      Positioned.fill(
          child: Image.network(product.imageUrl, fit: BoxFit.cover)),
      Positioned(
        bottom: 10,
        left: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 2, color: Colors.black)])),
            Text('₦${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 2, color: Colors.black)])),
          ],
        ),
      ),
    ],
  );
}

Widget _buildProductContent4(Sneaker product) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(product.name,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
      SizedBox(height: 10),
      Text('₦${product.price.toStringAsFixed(2)}',
          style: TextStyle(color: Colors.white, fontSize: 18)),
      SizedBox(height: 10),
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(product.imageUrl), fit: BoxFit.cover),
        ),
      ),
    ],
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
