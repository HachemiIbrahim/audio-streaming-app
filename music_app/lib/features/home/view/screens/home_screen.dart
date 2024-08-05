import 'package:flutter/material.dart';
import 'package:music_app/core/theme/pallete.dart';
import 'package:music_app/features/home/view/screens/library_screen.dart';
import 'package:music_app/features/home/view/screens/song_screen.dart';
import 'package:music_app/features/home/view/widget/audio_slab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final pages = const [
    SongScreen(),
    LibraryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            bottom: 0,
            child: AudioSlab(),
          ),
          pages[selectedIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 0
                  ? 'assets/images/home_filled.png'
                  : 'assets/images/home_unfilled.png',
              color: selectedIndex == 0
                  ? Pallete.whiteColor
                  : Pallete.inactiveBottomBarItemColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/library.png',
              color: selectedIndex == 1
                  ? Pallete.whiteColor
                  : Pallete.inactiveBottomBarItemColor,
            ),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
