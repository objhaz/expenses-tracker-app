import 'package:expenses_tracker_app/view/login/signup_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/secondary_button.dart';

class SocialLoginScreen extends StatefulWidget {
  const SocialLoginScreen({super.key});

  @override
  State<SocialLoginScreen> createState() => _SocialLoginScreenState();
}

class _SocialLoginScreenState extends State<SocialLoginScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
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
              InkWell(
                onTap: () {},
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/img/apple_btn.png'),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/apple.png',
                        width: 20,
                        height: 25,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Sign up with Apple",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/img/google_btn.png'),
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/google.png',
                        width: 20,
                        height: 25,
                        color: TColor.gray,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Sign up with Google",
                        style: TextStyle(
                            color: TColor.gray,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/img/fb_btn.png'),
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.35),
                        blurRadius: 15,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/fb.png',
                        width: 20,
                        height: 25,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Sign up with Facebook",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Or",
                style: TextStyle(
                  color: TColor.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              SecondaryButton(
                title: 'sign up with E-mail',
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupView()));
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.",
                style: TextStyle(
                  color: TColor.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
