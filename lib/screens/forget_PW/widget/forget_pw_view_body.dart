import 'package:flutter/material.dart';
import 'package:movies_app/resources/app_colors.dart';
import 'package:movies_app/screens/forget_PW/widget/forget_pw_container.dart';

class ForgetPwViewBody extends StatelessWidget {
  const ForgetPwViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),

        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ForgetPwContainer()],
        ),
      ),
    );
  }
}
