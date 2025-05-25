import 'package:flutter/material.dart';
import 'package:movies_app/core/my_custom_app_bar.dart';
import 'package:movies_app/resources/app_assets.dart';
import 'package:movies_app/screens/signup/widget/singup_container.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: .9,
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.signupBackground),
              ),
            ),
          ),
          Positioned(left: 16, top: 50, child: CustomAppBar()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 26),
              child: SignupContainer(),
            ),
          ),
        ],
      ),
    );
  }
}
