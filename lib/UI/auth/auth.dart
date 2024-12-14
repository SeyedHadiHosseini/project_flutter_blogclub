import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_two_blogclub/gen/assets.gen.dart';
import 'package:project_two_blogclub/UI/Svg/svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signupTab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
        color: themeData.colorScheme.surface,
        fontSize: 18,
        fontWeight: FontWeight.w700);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: SvgPicture.string(
                  svgLogo,
                  width: 120,
                )),
            Expanded(
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    color: themeData.colorScheme.onBackground,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedTabIndex = loginTab;
                                });
                              },
                              child: Text(
                                'Login'.toUpperCase(),
                                style: tabTextStyle.apply(
                                    color: selectedTabIndex == loginTab
                                        ? Colors.white
                                        : Colors.white54),
                              )),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signupTab;
                              });
                            },
                            child: Text(
                              'Sign Up'.toUpperCase(),
                              style: tabTextStyle.apply(
                                color: selectedTabIndex == signupTab ? Colors.white: Colors.white54
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                            child: selectedTabIndex == loginTab? _Login(
                                themeData: themeData,
                                tabTextStyle: tabTextStyle) : _SignUp(themeData: themeData, tabTextStyle: tabTextStyle),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    required this.themeData,
    required this.tabTextStyle,
  });

  final ThemeData themeData;
  final TextStyle tabTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: themeData.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          cursorColor: themeData.colorScheme.onBackground,
          decoration: InputDecoration(
            label: Text(
              'Username',
              style: themeData.textTheme.titleMedium,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.colorScheme.onBackground),
              // Change this to your desired color
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        PasswordTextField(themeData: themeData),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(themeData.colorScheme.onBackground),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: () {},
          child: Text(
            'Login',
            style: tabTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forgot your password?'),
            TextButton(
              onPressed: () {},
              child: Text('Reset Here',style: TextStyle(color: themeData.colorScheme.onBackground),),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            'OR SIGN IN WITH',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(height: 46, width: 46),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(height: 36, width: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(height: 46, width: 46),
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    required this.themeData,
    required this.tabTextStyle,
  });

  final ThemeData themeData;
  final TextStyle tabTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome To Blog Club',
          style: themeData.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Please enter your information',
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          cursorColor: themeData.colorScheme.onBackground,
          decoration: InputDecoration(
            label: Text(
              'Full Name',
              style: themeData.textTheme.titleMedium,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.colorScheme.onBackground),
              // Change this to your desired color
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          cursorColor: themeData.colorScheme.onBackground,
          decoration: InputDecoration(
            label: Text(
              'Username',
              style: themeData.textTheme.titleMedium,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.colorScheme.onBackground),
              // Change this to your desired color
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        PasswordTextField(themeData: themeData),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(themeData.colorScheme.onBackground),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, 60),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: () {},
          child: Text(
            'Sign up',
            style: tabTextStyle,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Center(
          child: Text(
            'OR SIGN UP WITH',
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(height: 46, width: 46),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(height: 36, width: 36),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(height: 46, width: 46),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: widget.themeData.colorScheme.onBackground,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        focusColor: widget.themeData.colorScheme.onBackground,
        label: Text(
          'Password',
          style: widget.themeData.textTheme.titleMedium,
        ),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'Show' : 'Hide',
            style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: widget.themeData.colorScheme.onBackground),
          // Change this to your desired color
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
