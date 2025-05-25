import 'package:flutter/material.dart';
import 'package:movies_app/core/my_custom_app_bar.dart';
import 'package:movies_app/resources/app_colors.dart';
import 'package:movies_app/screens/login/widget/login_container.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
          child: Stack(
            children: [
              CustomAppBar(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 26.0),
                  child: LoginContainer(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
