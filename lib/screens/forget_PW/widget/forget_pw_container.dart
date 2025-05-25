import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/custom_text_field.dart';
import 'package:movies_app/core/my_custom_button.dart';
import 'package:movies_app/resources/app_strings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgetPwContainer extends StatefulWidget {
  const ForgetPwContainer({super.key});

  @override
  State<ForgetPwContainer> createState() => _ForgetPwContainerState();
}

class _ForgetPwContainerState extends State<ForgetPwContainer> {
  bool isObsecured = true;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color(0xFF2C3E50), // لون غامق في الأعلى
              Color(0xFF4CA1AF), // لون أفتح في الأسفل
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.forgetPw,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            Gap(8),
            Text(
              AppStrings.subForgetPw,
              style: TextStyle(color: Colors.white70),
            ),
            Gap(24),
            CustomTextField(
              controller: emailController,
              onChanged: (emailValue) {
                setState(() {
                  emailController.text = emailValue;
                });
              },
              hint: 'Email',
              icon: Icons.email_outlined,
            ),
            Gap(19),
            MyCustomButton(
              text: AppStrings.continueText,
              onPressed: () async {
                await Supabase.instance.client.auth.resetPasswordForEmail(
                  emailController.text,
                );
              },
              height: 48,
              raduis: 30,
            ),
            Gap(50),
          ],
        ),
      ),
    );
  }
}
