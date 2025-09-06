import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/core/style/app_style.dart';
import 'package:restaurants/features/home/domain/entities/icon_item_entity.dart';

class NavigationNavBar extends StatefulWidget {
  const NavigationNavBar({super.key, required this.onTabChange});
  final ValueChanged<int> onTabChange;
  @override
  State<NavigationNavBar> createState() => _NavigationNavBarState();
}

class _NavigationNavBarState extends State<NavigationNavBar> {
  List<IconItemEntity> iconItemList = [
    IconItemEntity(icon: Icons.home, title: 'الرئيسيه'),
    IconItemEntity(icon: Icons.shopping_cart, title: 'السلة'),
    IconItemEntity(icon: Icons.history_edu_outlined, title: 'الطلبات'),
    IconItemEntity(icon: Icons.account_box_rounded, title: 'الحساب'),
  ];
  int selectedIndex = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return GNav(
      selectedIndex: selectedIndex,
      onTabChange: (value) {
        widget.onTabChange(value);
      },
      tabs:
          iconItemList.map((e) {
            return iconItem(e);
          }).toList(),
    );
  }

  GButton iconItem(IconItemEntity iconItem) {
    return GButton(
      margin: const EdgeInsets.all(16),
      icon: iconItem.icon,
      iconColor: kSecondaryColor,
      iconActiveColor: kPrimaryColor,
      backgroundColor: kSecondaryColor,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(4),
        bottomRight: Radius.circular(4),
        topLeft: Radius.circular(24),
        bottomLeft: Radius.circular(24),
      ),
      text: iconItem.title,
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 4),
      textStyle: AppStyle.subtitleStyle,
      activeBorder: Border.all(color: kNeutralColor),
      onPressed: () {},
    );
  }
}
