import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/my_container.dart';
import '../home.dart';
import '../view_tile/order_tile.dart';

class MyCompletedOrders extends StatelessWidget {
  MyCompletedOrders({super.key});

  final _myBox = Hive.box('orderBox');

  List<Map<String, dynamic>> getOrderItems() {
    final orders = _myBox.get('orders');
    if (orders != null && orders is Map) {
      final items = orders['items'];
      if (items != null && items is List) {
        return items.map((item) {
          if (item is Map) {
            return Map<String, dynamic>.from(item);
          }

          return <String, dynamic>{};
        }).toList();
      }
    }
    // if (orders != null && orders['items'] != null) {
    //   return List<Map<String, dynamic>>.from(orders['items']);
    // }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final orderItems = getOrderItems();
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MyHome()),
          );
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Order History',
                style: GoogleFonts.robotoFlex(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  height: 22.27 / 19,
                  color: const Color.fromRGBO(41, 41, 41, 1),
                ),
              ),
            ),
            body: orderItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/order.png'),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'No completed Order yet',
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
                                    builder: (context) => const MyHome(
                                          initialIndex: 1,
                                        )));
                          },
                          text: 'Discover products',
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: orderItems.length,
                    itemBuilder: (context, index) {
                      print(_myBox.get('orders'));
                      return MyOrderTile(
                        item: orderItems[index],
                      );
                    })));
  }
}
