import 'package:flutter/material.dart';
import 'package:restaurants/features/restaurant_details/presentation/views/widgets/item_tab_bar.dart';

class MenuTabsBar extends StatefulWidget {
  const MenuTabsBar({super.key, required this.onChang});
  final Function(int index) onChang;

  @override
  State<MenuTabsBar> createState() => _MenuTabsBarState();
}

class _MenuTabsBarState extends State<MenuTabsBar> {
  int crentIndex = 0;
  List<String> tabs = ['القائمة', 'التقييمات', 'المعلومات'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            tabs.asMap().entries.map((e) {
              var index = e.key;
              var r = e.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    crentIndex = index;
                    widget.onChang(crentIndex);
                  });
                },
                child: ItemTabBar(isActev: crentIndex == index, title: r),
              );
            }).toList(),
      ),
    );
  }
}
