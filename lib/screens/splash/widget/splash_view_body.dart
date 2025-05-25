import 'package:flutter/material.dart';
import 'package:movies_app/core/my_custom_button.dart';
import 'package:movies_app/resources/app_assets.dart';
import 'package:movies_app/resources/app_colors.dart';
import 'package:movies_app/resources/app_router.dart';
import 'package:movies_app/resources/app_strings.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: AppColors.primaryColor,
        child: Stack(
          children: [
            Image.asset(
              width: double.infinity,
              fit: BoxFit.fill,
              AppAssets.banner,
            ),
            Positioned(
              right: 0,
              left: 0,
              top: MediaQuery.of(context).size.height / 5.2,
              child: Image.asset(AppAssets.logo),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: MediaQuery.of(context).size.height / 1.5,
              child: Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                AppStrings.splashQuote,
              ),
            ),
            Positioned(
              right: 60,
              left: 60,
              top: MediaQuery.of(context).size.height / 1.25,
              child: MyCustomButton(
                height: 40,
                onPressed:
                    () => Navigator.pushNamed(context, AppRoutes.loginRoute),
                text: 'Get Started',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
