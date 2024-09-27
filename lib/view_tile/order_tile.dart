import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderTile extends StatelessWidget {
  MyOrderTile({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Container(
        height: 112,
        width: 358,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade200),
          color: const Color.fromRGBO(249, 249, 249, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: item['imageUrl'] as String,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(item['name']),
          subtitle: Text(
            'Size: ${item['size']?.toString() ?? 'N/A'}, Color: ${item['color']?.toString() ?? 'N/A'}',
            style: GoogleFonts.robotoFlex(),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${item['price']?.toString() ?? 'N/A'}',
                style: GoogleFonts.robotoFlex(fontWeight: FontWeight.bold),
              ),
              Text(
                'Qty: ${item['quantity']?.toString() ?? 'N/A'}',
                style: GoogleFonts.robotoFlex(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
