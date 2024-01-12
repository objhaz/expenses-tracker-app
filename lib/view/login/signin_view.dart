import 'package:expenses_tracker_app/common_widget/round_textfeild.dart';
import 'package:expenses_tracker_app/view/login/signup_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/prinmary_button.dart';
import '../../common_widget/secondary_button.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  bool isRemeber = false;
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
              RoundTextfield(
                  title: 'Login',
                  controller: txtemail,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 15,
              ),
              RoundTextfield(
                title: 'Password',
                controller: txtpassword,
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isRemeber = !isRemeber;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isRemeber
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          size: 25,
                          color: TColor.gray50,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(fontSize: 14, color: TColor.gray50),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password',
                      style: TextStyle(fontSize: 14, color: TColor.gray50),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              PrimaryButton(
                title: "Sign in",
                onpressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const SocialLoginScreen()));
                  //
                },
              ),
              const Spacer(),
              Text(
                "Do you already have an account?",
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
                title: 'Sign up',
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
