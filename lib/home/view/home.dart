import 'package:anime_db/anime/view/anime.dart';
import 'package:anime_db/ui/bottom_navbar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget? body;
  Home({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: body,
    );
  }
}
