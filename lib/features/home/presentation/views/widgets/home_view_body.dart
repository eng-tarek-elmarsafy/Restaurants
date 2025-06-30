import 'package:flutter/material.dart';
import 'package:restaurants/constrains.dart';
import 'package:restaurants/features/home/presentation/views/widgets/restaurnt_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kBorderRadius),
      child: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 20,
            itemBuilder:
                (context, index) => const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: RestsurntItem(),
                ),
          ),
        ],
      ),
    );
  }
}
