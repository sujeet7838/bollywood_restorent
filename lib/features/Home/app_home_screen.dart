import 'package:bollybood_restorent/Commons/colors.dart';
import 'package:bollybood_restorent/features/Home/home.dart';
import 'package:bollybood_restorent/features/cart/cartview.dart';
import 'package:bollybood_restorent/features/category_view/categories_view.dart';
import 'package:bollybood_restorent/features/notification/NofificationScreen.dart';
import 'package:bollybood_restorent/features/profile/profile.dart';
import 'package:bollybood_restorent/utils/device_size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewIndexNotifier extends ChangeNotifier {
  int currentViewIndex = 0;

  void updateCurrentViewIndex(int viewIndex) {
    currentViewIndex = viewIndex;
    notifyListeners();
  }
}

final ChangeNotifierProvider<ViewIndexNotifier> viewIndexProvider =
    ChangeNotifierProvider<ViewIndexNotifier>(
  (ChangeNotifierProviderRef<ViewIndexNotifier> ref) => ViewIndexNotifier(),
);

class AppHomeScreen extends ConsumerWidget {
  const AppHomeScreen({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);

    int currentViewIndex = ref.watch(viewIndexProvider).currentViewIndex;

    final PageController viewController = PageController(
      initialPage: currentViewIndex,
    );

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: viewController,
          onPageChanged: (int viewIndex) {
            ref
                .read(viewIndexProvider.notifier)
                .updateCurrentViewIndex(viewIndex);
          },
          children: const <Widget>[
            homeScreen(),
            // CategoriesView(),
            CartView(),
            NofificationScreen(),
            ProfileScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentViewIndex,
        onTap: (int itemIndex) {
          ref
              .read(viewIndexProvider.notifier)
              .updateCurrentViewIndex(itemIndex);

          viewController.animateToPage(
            itemIndex,
            duration: const Duration(milliseconds: 750),
            curve: Curves.easeOutQuint,
          );
        },
        backgroundColor: colorScaffold,
        selectedItemColor: const Color(0XFFD5A353),
        unselectedItemColor: const Color(0XFF616161),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/home-category.png"),
              //color: Color(0XFF616161),
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle),
            label: 'Appointments',
          ),
        ],
      ),
    );
  }
}
