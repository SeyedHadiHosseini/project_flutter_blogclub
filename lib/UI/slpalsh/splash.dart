import 'package:flutter/material.dart';
import 'package:project_two_blogclub/UI/onboarding/onboarding.dart';
import 'package:project_two_blogclub/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_two_blogclub/UI/Svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
   
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Assets.img.background.splash.image(fit: BoxFit.cover)),
          Center(
            // به دلیل قدیمی بودن روش تدریس شده از Doc استفاده شد
            child: SvgPicture.string(svgLogo,width: 100,)
          ),
        ],
      ),
    );
  }
}
