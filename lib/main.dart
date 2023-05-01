import 'package:crudwithprovider/home.screen.dart';
import 'package:crudwithprovider/viewmodel/smartphone.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SmartphoneViewModel())
    ],
    child: const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  ));
}