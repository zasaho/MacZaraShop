import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'package:zara_shop/api/post_api.dart';
import 'package:zara_shop/models/base_model.dart';
import 'package:zara_shop/utils/admob_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logger = Logger();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final dio = Dio();
    final client = RestClient(dio);
    client.getHome().then((BaseModel it) => logger.i(it)).catchError((onError){
      print(onError);
    });
   AdmobService.interstitial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         child: AdWidget(
            key: UniqueKey(), ad: AdmobService.createBannerAd()..load()),
      ),
    );
  }
}
