import 'package:expenses_tracker_app/common_widget/round_textfeild.dart';
import 'package:expenses_tracker_app/view/login/signin_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/prinmary_button.dart';
import '../../common_widget/secondary_button.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

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
                  title: 'Email',
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
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 5,
                        decoration: BoxDecoration(
                          color: TColor.gray50,
                        )),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 5,
                        decoration: BoxDecoration(
                          color: TColor.gray50,
                        )),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 5,
                        decoration: BoxDecoration(
                          color: TColor.gray50,
                        )),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 5,
                        decoration: BoxDecoration(
                          color: TColor.gray50,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Use 8 or more characters with a mixeture of letters, \nnunmbers & symbols",
                    style: TextStyle(
                      color: TColor.gray50,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                title: "Get Started it's free",
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
                title: 'Sign in',
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninView()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
