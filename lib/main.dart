import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradefolioo/services/app_routes.dart';

void main(List<String> args) {
  runApp(TradeFolioo());
}

class TradeFolioo extends StatelessWidget {
  const TradeFolioo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TradeFolioo',
      
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}
