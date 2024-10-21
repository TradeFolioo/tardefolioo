import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:tradefolioo/controllers/auth_controller.dart';
import 'package:tradefolioo/services/app_routes.dart';

void main(List<String> args) {
  final talker = TalkerFlutter.init();
  runZonedGuarded(
    () => runApp(TradeFolioo(talker: talker)),
    (Object error, StackTrace stack) {
      talker.handle(error, stack, 'Uncaught app exception');
    },
  );
}

class TradeFolioo extends StatelessWidget {
  final Talker talker;
  const TradeFolioo({super.key, required this.talker});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController(),)
      ],
      child: GetMaterialApp(
        title: 'TradeFolioo',
        
        getPages: AppRoutes.routes,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}
