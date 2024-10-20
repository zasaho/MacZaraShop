import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../category/category_page.dart';
import '../home/home_page.dart';
import '../setting/setting_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  List<Widget> widgets = [
    const HomePage(),
    const CategoryPage(),
    const SettingPage()
  ];
 // @override
 //  Future<void> initState()  {
 //    // TODO: implement initState
 //    super.initState();
 //    // Firebase.initializeApp();
 //   // FirebaseCrashlytics.instance.crash();
 //    //MobileAds.initialize(this);
 //
 // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zara Shop"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        backgroundColor: Colors.amber,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.deepPurple,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
      ),
      body: Center(
        child: widgets.elementAt(_currentIndex),
      ),
    );
  }

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
