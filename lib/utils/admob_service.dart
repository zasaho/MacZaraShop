import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobService {
  static String get bannerAdUnitId =>
      Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/9214589741'
          : 'ca-app-pub-3940256099942544/9214589741';

  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd() {
    BannerAd ad = new BannerAd(
        size: AdSize.banner,
        adUnitId: bannerAdUnitId,
        listener: BannerAdListener(
            onAdClosed: (Ad ad) => print('Ad Closed'),
            onAdLoaded: (Ad ad) => print('Ad Loaded'),
            onAdFailedToLoad: (Ad ad, LoadAdError) {}),
        request: AdRequest());
    return ad;
  }

  static interstitial() {
    InterstitialAd.load(adUnitId: 'ca-app-pub-3940256099942544/1033173712', request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad){
            //ad.fullScreenContentCallback!;
            ad.show();
            ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                onAdShowedFullScreenContent: (ad) {});
          },
          onAdFailedToLoad: (LoadAdError error) {
            print("Interstitial failed to load:$error");
          },));


  }
}
