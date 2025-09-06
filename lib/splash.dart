// ignore_for_file: unused_element

import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/main.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((Value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const MainScreen(); // onBoarding();
        // Stack(
        //   children: [
        //     const Positioned.fill(child: HomeScreen()),
        //     Positioned(
        //         right: 0, left: 0, bottom: 0, child: _BottomnNavigation())
        //   ],
        // );
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
            child: Assets.img.background.splash.image(fit: BoxFit.cover)),
        Center(
          child: Assets.img.icons.logo.svg(width: 100),
        )
      ]),
    );
  }
}

class _BottomnNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNaviItem(
                      iconFileName: 'Home.png',
                      activeIconFileName: 'Home.png',
                      title: 'Home',
                    ),
                    BottomNaviItem(
                        iconFileName: 'Articles.png',
                        activeIconFileName: 'Articles.png',
                        title: 'Articles'),
                    SizedBox(
                      width: 8,
                    ),
                    BottomNaviItem(
                        iconFileName: 'Search.png',
                        activeIconFileName: 'Search.png',
                        title: 'Search'),
                    BottomNaviItem(
                        iconFileName: 'Menu.png',
                        activeIconFileName: 'Menu.png',
                        title: 'Menu'),
                  ],
                ),
                height: 65,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: const Color(0xFF9B8487).withOpacity(0.3))
                ], color: Colors.white),
              )),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              width: 65,
              height: 85,
              child: Container(
                child: Image.asset('assets/img/icons/plus.png'),
                height: 65,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376AED)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNaviItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  const BottomNaviItem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w700,
              color: Color(0xff7B8BB2),
              fontSize: 10),
        )
      ],
    );
  }
}
