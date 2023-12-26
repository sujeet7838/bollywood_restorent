import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/features/sign_in_screen/sign_in_screen.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:bollybood_restorent/welcome_screen/widgets/welcome_slide.dart';
import 'package:bollybood_restorent/welcome_screen/widgets/welcome_slide_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeSlideNoNotifier extends ChangeNotifier {
  int currentSlideNo = 0;

  void updateCurrentSlideNo(int slideNo) {
    currentSlideNo = slideNo;
    notifyListeners();
  }
}

final ChangeNotifierProvider<WelcomeSlideNoNotifier> welcomeSlideNoProvider =
    ChangeNotifierProvider<WelcomeSlideNoNotifier>(
  (ChangeNotifierProviderRef<WelcomeSlideNoNotifier> ref) =>
      WelcomeSlideNoNotifier(),
);

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);

    int currentSlideNo = ref.watch(welcomeSlideNoProvider).currentSlideNo;
    final PageController pageViewController = PageController(
      initialPage: currentSlideNo,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: pageViewController,
                onPageChanged: (int slideNo) {
                  ref
                      .read(welcomeSlideNoProvider.notifier)
                      .updateCurrentSlideNo(slideNo);
                },
                children: <Widget>[
                  WelcomeSlide(
                    deviceSizeConfig: deviceSizeConfig,
                    imageUrl: 'assets/images/groomely_graphic_01.png',
                    // imageUrl: 'assets/images/groomely_graphic_01.svg',
                    slideTitle: 'Welcome to Groomely',
                    slideText:
                        'Come fall in love with yourself at Groomely. Let us spoil you with our premium services because you deserve the best care.',
                  ),
                  WelcomeSlide(
                    deviceSizeConfig: deviceSizeConfig,
                    imageUrl: 'assets/images/groomely_graphic_02.png',
                    // imageUrl: 'assets/images/groomely_graphic_02.svg',
                    slideTitle: 'Book and Schedule',
                    slideText:
                        "It's time to get glowy! Book your favorite stylist and get the look you've always wanted with Groomely.",
                  ),
                  WelcomeSlide(
                    deviceSizeConfig: deviceSizeConfig,
                    imageUrl: 'assets/images/groomely_graphic_03.png',
                    // imageUrl: 'assets/images/groomely_graphic_03.svg',
                    slideTitle: "Let's Get Started",
                    // slideText:
                    //     'Relax, you are in the right place. We are so excited to have you here. Our exceptional grooming service is just one click away.',
                    slideText:
                        'Exceptional grooming service, just a click away. Schedule your appointment today that fits your busy lifestyle.',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: deviceSizeConfig.blockSizeVertical * 7.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WelcomeSlideIndicator(
                    deviceSizeConfig: deviceSizeConfig,
                    isActive: currentSlideNo == 0 ? true : false,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  WelcomeSlideIndicator(
                    deviceSizeConfig: deviceSizeConfig,
                    isActive: currentSlideNo == 1 ? true : false,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  WelcomeSlideIndicator(
                    deviceSizeConfig: deviceSizeConfig,
                    isActive: currentSlideNo == 2 ? true : false,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: deviceSizeConfig.blockSizeVertical * 15.0,
              // color: Colors.amber,
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 16.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (currentSlideNo == 2) {
                        // Navigator.of(context).pushNamedAndRemoveUntil(
                        //   SignInScreen,
                        //   (Route<dynamic> route) => false,
                        // );
                      } else {
                        int updatedSlideNo =
                            currentSlideNo == 2 ? 2 : currentSlideNo + 1;

                        ref
                            .read(welcomeSlideNoProvider.notifier)
                            .updateCurrentSlideNo(updatedSlideNo);

                        pageViewController.animateToPage(
                          updatedSlideNo,
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.easeOutQuint,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimaryBlack,
                      foregroundColor: Colors.white,
                      elevation: 0.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        deviceSizeConfig.blockSizeVertical * 6.5,
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.25,
                      ),
                    ),
                    child: currentSlideNo == 2
                        ? const Text('Get Started')
                        : const Text(
                            'Continue',
                          ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //   signInScreen,
                      //   (Route<dynamic> route) => false,
                      // );
                    },
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            decoration: TextDecoration.underline,
                            color: colorPrimaryBlack,
                            fontSize: 15.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
