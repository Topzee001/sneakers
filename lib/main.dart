import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/home.dart';

import 'provider/cart_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('orderBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider()..fetchSneakers(),
      child: ScreenUtilInit(
        designSize: const Size(430, 923),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: MyHome(),
          );
        },
      ),
    );
  }
}
