import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:smile_chat/features/home/presentation/widgets/nav_bar_item.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      // controller: _controller,
      screens: NavBarItem.screens,
      items: NavBarItem.navBarItems,
      resizeToAvoidBottomInset: true,
      padding: const EdgeInsets.only(top: 8),

      animationSettings: const NavBarAnimationSettings(
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          curve: Curves.fastOutSlowIn,
          animateTabTransition: true,
          duration: Duration(milliseconds: 100),
        ),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
