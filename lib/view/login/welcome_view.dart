import 'package:expenses_tracker_app/common_widget/prinmary_button.dart';
import 'package:expenses_tracker_app/common_widget/secondary_button.dart';
import 'package:expenses_tracker_app/view/login/socail_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extension.dart';

class WelcomeYou extends StatefulWidget {
  const WelcomeYou({super.key});

  @override
  State<WelcomeYou> createState() => _WelcomeYouState();
}

class _WelcomeYouState extends State<WelcomeYou> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/img/welcome_screen.png',
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/app_logo.png',
                    width: media.width * 0.5,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(),
                  Text(
                    "Congue malesuada in ac justo, a tristique\nleo massa. Arcu leo leo urna risus.",
                    style: TextStyle(
                      color: TColor.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    title: 'Get Started',
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SocialLoginScreen()));
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SecondaryButton(
                    title: 'I have an account',
                    onpressed: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
