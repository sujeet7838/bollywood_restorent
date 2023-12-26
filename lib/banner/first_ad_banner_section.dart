import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/widgets/slide_banner.dart';
import 'package:bollybood_restorent/widgets/welcome_slide_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SlideBannerNoNotifier extends ChangeNotifier {
  int currentSlideBannerNo = 0;

  void updateCurrentSlideBannerNo(int slideBannerNo) {
    currentSlideBannerNo = slideBannerNo;
    notifyListeners();
  }
}

final ChangeNotifierProvider<SlideBannerNoNotifier> slideBannerNoProvider =
    ChangeNotifierProvider<SlideBannerNoNotifier>(
  (ChangeNotifierProviderRef<SlideBannerNoNotifier> ref) =>
      SlideBannerNoNotifier(),
);

class FirstAdBannerSection extends ConsumerWidget {
  const FirstAdBannerSection({
    Key? key,
  }) : super(key: key);
// final DeviceSizeConfig deviceSizeConfig;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    int currentSlideBannerNo =
        ref.watch(slideBannerNoProvider).currentSlideBannerNo;
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            //width: 220,
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 16.0, left: 0.0, right: 0.0),
            decoration: BoxDecoration(
                // color: const Color(0xff000000),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CarouselSlider(
                  items: <Widget>[
                    SlideBanner(
                      //deviceSizeConfig: deviceSizeConfig,
                      imageUrl: 'assets/bannere_logo.png',
                    ),
                    SlideBanner(
                      //  deviceSizeConfig: deviceSizeConfig,
                      imageUrl: 'assets/bannere_logo.png',
                    ),
                    // SlideBanner(
                    //   // deviceSizeConfig: deviceSizeConfig,
                    //   imageUrl: 'assets/bannere_logo.png',
                    // ),
                    // SlideBanner(
                    //   // deviceSizeConfig: deviceSizeConfig,
                    //   imageUrl: 'assets/bannere_logo.png',
                    // ),
                    // SlideBanner(
                    //   //deviceSizeConfig: deviceSizeConfig,
                    //   imageUrl: 'assets/bannere_logo.png',
                    // ),
                  ],
                  options: CarouselOptions(
                    height: deviceSizeConfig.blockSizeVertical * 19.0,
                    initialPage: currentSlideBannerNo,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      ref
                          .read(slideBannerNoProvider.notifier)
                          .updateCurrentSlideBannerNo(index);
                    },
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      WelcomeSlideIndicator(
                        deviceSizeConfig: deviceSizeConfig,
                        isActive: currentSlideBannerNo == 0 ? true : false,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      WelcomeSlideIndicator(
                        deviceSizeConfig: deviceSizeConfig,
                        isActive: currentSlideBannerNo == 1 ? true : false,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      // WelcomeSlideIndicator(
                      //   deviceSizeConfig: deviceSizeConfig,
                      //   isActive: currentSlideBannerNo == 2 ? true : false,
                      // ),
                      // const SizedBox(
                      //   width: 5.0,
                      // ),
                      // WelcomeSlideIndicator(
                      //   deviceSizeConfig: deviceSizeConfig,
                      //   isActive: currentSlideBannerNo == 3 ? true : false,
                      // ),
                      // const SizedBox(
                      //   width: 5.0,
                      // ),
                      // WelcomeSlideIndicator(
                      //   deviceSizeConfig: deviceSizeConfig,
                      //   isActive: currentSlideBannerNo == 4 ? true : false,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
