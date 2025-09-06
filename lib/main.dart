// ignore_for_file: empty_constructor_bodies
import 'package:blogclub/article.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/onBording.dart';
import 'package:blogclub/profile.dart';
import 'package:blogclub/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color.fromARGB(255, 0, 0, 0)),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamily = 'Avenir';
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        snackBarTheme: const SnackBarThemeData(backgroundColor: primaryColor),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: WidgetStateProperty.all(const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.avenir,
        )))),
        colorScheme: const ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            onSurface: primaryTextColor,
            background: Color(0xffFBFCFF),
            surface: Colors.white),
        textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            titleLarge: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: primaryTextColor),
            headlineMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: primaryTextColor),
            headlineSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: primaryTextColor),
            bodySmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                color: Color(0xff7B8BB2),
                fontSize: 10),
            titleSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primaryTextColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
            bodyMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
                fontSize: 12)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        primarySwatch: Colors.blue,
      ),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(right: 0, left: 0, bottom: 0, child: _BottomnNavigation())
      //   ],
      // ),
      home: const SplashScreen(),
    );
  }
}

int home = 0;
int artcle = 1;
int search = 2;
int menu = 3;

// ignore: camel_case_types
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List _history = [];
  Future<bool> onWillPopali() async {
    final NavigatorState curSTNS = map[seltab]!.currentState!;
    if (curSTNS.canPop()) {
      curSTNS.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        seltab = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  GlobalKey<NavigatorState> _home = GlobalKey();
  GlobalKey<NavigatorState> _article = GlobalKey();
  GlobalKey<NavigatorState> _search = GlobalKey();
  GlobalKey<NavigatorState> _profile = GlobalKey();
  late final map = {
    home: _home,
    artcle: _article,
    search: _search,
    menu: _profile
  };
  int seltab = home;
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: onWillPopali,
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: seltab,
              children: [
                _navigator(_home, home, const HomeScreen()),
                _navigator(_article, artcle, const ArticleScreen()),
                _navigator(_search, search, Search()),
                _navigator(_profile, menu, const ProfileScreen())
                // HomeScreen(),
                // articleScreen(),
                // Search(),
                // profileScreen(),
              ],
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: _BottomnNavigation(
                selin: seltab,
                ontap: (int ind) {
                  setState(() {
                    _history.remove(seltab);
                    _history.add(seltab);
                    seltab = ind;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int ind, Widget child) {
    return key.currentState == null && seltab != ind
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) =>
                    Offstage(offstage: seltab != ind, child: child)));
  }
}

int count = 1;

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Search $count',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
              onPressed: () {
                count++;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Search(),
                ));
              },
              child: const Text('Click me'))
        ],
      ),
    );
  }
}

class _BottomnNavigation extends StatelessWidget {
  final Function(int ind) ontap;
  final int selin;

  const _BottomnNavigation({
    Key? key,
    required this.ontap,
    required this.selin,
  }) : super(key: key);
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNaviItem(
                        isActive: selin == 0,
                        iconFileName: 'Home.png',
                        activeIconFileName: 'Home.png',
                        title: 'Home',
                        ontap: () {
                          ontap(home);
                        }),
                    BottomNaviItem(
                        isActive: selin == 1,
                        iconFileName: 'Articles.png',
                        activeIconFileName: 'Articles.png',
                        title: 'Articles',
                        ontap: () {
                          ontap(artcle);
                        }),
                    Expanded(child: Container()),
                    BottomNaviItem(
                        isActive: selin == 2,
                        iconFileName: 'Search.png',
                        activeIconFileName: 'Search.png',
                        title: 'Search',
                        ontap: () {
                          ontap(search);
                        }),
                    BottomNaviItem(
                        isActive: selin == 3,
                        iconFileName: 'Menu.png',
                        activeIconFileName: 'Menu.png',
                        title: 'Menu',
                        ontap: () {
                          ontap(menu);
                        }),
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
            child: InkWell(
              borderRadius: BorderRadius.circular(32.5),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const OnBoarding())),
              child: Container(
                alignment: Alignment.topCenter,
                width: 65,
                height: 85,
                child: Container(
                  child: Image.asset(
                    'assets/img/icons/plus.png',
                  ),
                  height: 65,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4),
                      borderRadius: BorderRadius.circular(32.5),
                      color: const Color(0xff376AED)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNaviItem extends StatelessWidget {
  final bool isActive;
  final Function() ontap;
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  const BottomNaviItem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.ontap,
      required this.isActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icons(),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w700,
                  color: isActive ? Colors.black : const Color(0xff7B8BB2),
                  fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  Image icons() {
    return isActive
        ? Image.asset(
            'assets/img/icons/$iconFileName',
            color: Colors.blue,
          )
        : Image.asset(
            'assets/img/icons/$iconFileName',
          );
  }
}
