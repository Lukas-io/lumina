import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      padding: EdgeInsets.only( left: 0.0),
      labelPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      isScrollable: true,
      tabs: [
        Tab(
          text: "Trending",
        ),
        Tab(
          text: "New",
        ),
        Tab(
          text: "Movies",
        ),
        Tab(
          text: "Tv Shows",
        ),
        Tab(
          text: "Cartoons",
        ),
      ],
    );
  }
}
