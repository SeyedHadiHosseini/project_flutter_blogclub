import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_two_blogclub/UI/SearchScrean/logic/provider.dart';
import 'package:project_two_blogclub/UI/SearchScrean/searchscreen.dart';
import 'package:project_two_blogclub/UI/article/article.dart';
import 'package:project_two_blogclub/UI/home/home.dart';
import 'package:project_two_blogclub/UI/porofile/profile.dart';
import 'package:project_two_blogclub/gen/fonts.gen.dart';
// 2. Import necessary packages in your Dart file
import 'package:provider/provider.dart';
void main() {
  // برای سفید کردن بار ها
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(
    // 4. Wrap your app with a Provider
      ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp()));
}

const primaryTextColor = Color(0xff0D253C);
const secondaryTextColor = Color(0xff2D4379);
const primaryColor = Color(0xff376AED);
const double bottomNavigationHeight = 65;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.white,
            shadowColor: Colors.grey,
            backgroundColor: Colors.white,
            foregroundColor: primaryColor,
            titleSpacing: 32),
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.avenir),
            ),
          ),
        ),
        textTheme: const TextTheme(
            titleMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 18),
            titleSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            headlineMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 24,
                color: primaryTextColor,
                fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 20,
                color: primaryTextColor,
                fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
            bodyLarge: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 14),
            bodyMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
                fontSize: 12),
            bodySmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                color: Color(0xff7B8BB2),
                fontSize: 10)),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: const ColorScheme.light(
          onPrimary: primaryColor,
          surface: Colors.white,
          onSurface: primaryColor,
          background: Color(0xffFBFCFF),
          onBackground: primaryColor,
        ),
        useMaterial3: true,
      ),
      // home: const Stack(
      //   children: [
      //     Positioned.fill(child: HomePageScreen()),
      //     Positioned(right: 0, left: 0, bottom: 0, child: _BottomNavigation())
      //   ],
      // ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _profileKey
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTapNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTapNavigatorState.canPop()) {
      currentSelectedTapNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  _navigator(_homeKey, homeIndex, const HomePageScreen()),
                  _navigator(_articleKey, articleIndex, const ArticleScreen()),
                  _navigator(_searchKey, searchIndex,  const SimpleScreen()),
                  _navigator(_profileKey, menuIndex, const ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onSelectedTapScreenChange: (int index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    // مقدار index قبلی رو باید نگه داری کنیم
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedScreenIndex != index, child: child)));
  }

  Widget _buildPage(Widget page) {
    return Scaffold(
      body: page,
    );
  }
}



class _BottomNavigation extends StatelessWidget {
  final Function(int index) onSelectedTapScreenChange;
  final int selectedIndex;

  const _BottomNavigation(
      {Key? key,
      required this.onSelectedTapScreenChange,
      required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff9B8487).withOpacity(0.3),
                )
              ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _BottomNavigationItem(
                        isActive: selectedIndex == homeIndex,
                        onTap: () {
                          onSelectedTapScreenChange(homeIndex);
                        },
                        iconFileName: 'Home.png',
                        activeIconFileName: 'Home.png',
                        title: 'Home'),
                    _BottomNavigationItem(
                        isActive: selectedIndex == articleIndex,
                        onTap: () {
                          onSelectedTapScreenChange(articleIndex);
                        },
                        iconFileName: 'Articles.png',
                        activeIconFileName: 'Articles.png',
                        title: 'Articles'),
                    Expanded(
                      child: Container(),
                    ),
                    _BottomNavigationItem(
                        isActive: selectedIndex == searchIndex,
                        onTap: () {
                          onSelectedTapScreenChange(searchIndex);
                        },
                        iconFileName: 'Search.png',
                        activeIconFileName: 'Search.png',
                        title: 'Search'),
                    _BottomNavigationItem(
                        isActive: selectedIndex == menuIndex,
                        onTap: () {
                          onSelectedTapScreenChange(menuIndex);
                        },
                        iconFileName: 'Menu.png',
                        activeIconFileName: 'Menu.png',
                        title: 'Menu'),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 85,
              width: 65,
              alignment: Alignment.topCenter,
              child: Container(
                height: bottomNavigationHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376ADE),
                    border: Border.all(color: Colors.white, width: 3)),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final bool isActive;
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final Function() onTap;

  const _BottomNavigationItem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTap,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/$iconFileName'),
            Text(
              title,
              style: themeData.textTheme.bodySmall!.apply(
                  color: isActive
                      ? themeData.colorScheme.onBackground
                      : themeData.textTheme.bodySmall!.color),
            )
          ],
        ),
      ),
    );
  }
}
