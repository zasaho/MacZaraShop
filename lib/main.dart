import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:zara_shop/pages/about/about_page.dart';
import 'package:zara_shop/pages/category/category_page.dart';
import 'package:zara_shop/pages/dashboard/dashboard_page.dart';
import 'package:zara_shop/pages/home/home_page.dart';
import 'package:zara_shop/pages/setting/binding/bind_setting.dart';
import 'package:zara_shop/pages/setting/setting_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(GetMaterialApp(
    getPages: [
      GetPage(name: '/dashboard',page: ()=> DashboardPage()),
      GetPage(name: '/home',page: ()=> HomePage()),
      GetPage(name: '/category',page: ()=> CategoryPage()),
      GetPage(name: '/settings',page: ()=> SettingPage(),binding: BindSetting()),
      GetPage(name: '/about',page: ()=> AboutPage()),

    ],
   initialRoute: '/dashboard',
   // home: DashboardPage(),
  ));
}

