import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/custom_text_field.dart';
import 'package:movies_app/core/my_custom_button.dart';
import 'package:movies_app/resources/app_colors.dart';
import 'package:movies_app/resources/app_router.dart';
import 'package:movies_app/resources/app_strings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  bool isObsecured = true;

  final supabase = Supabase.instance.client;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            AppStrings.login,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          Gap(8),
          Text(
            AppStrings.pleaseSignIn,
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
            icon: Icons.email,
          ),
          Gap(16),
          CustomTextField(
            onChanged: (passwordValue) {
              setState(() {
                passwordController.text = passwordValue;
              });
            },
            controller: passwordController,
            onTap: () {
              setState(() {
                isObsecured = !isObsecured;
              });
            },
            hint: 'Password',
            suffixIcon: true,
            icon: Icons.lock_outlined,
            isObscured: isObsecured,
          ),
          Gap(16),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap:
                  () => Navigator.pushNamed(
                    context,
                    AppRoutes.forgetPasswordRoute,
                  ),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Gap(24),
          MyCustomButton(
            text: AppStrings.login,
            onPressed: () async {
              try {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  return AwesomeDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.topSlide,
                    title: 'Error',
                    desc: 'Please enter email and password',
                    btnOkOnPress: () {},
                    btnOkColor: AppColors.switchColor,
                  ).show();
                } else {
                  await supabase.auth.signInWithPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    // ignore: use_build_context_synchronously
                    context,
                    AppRoutes.mainRoute,
                    (route) => false,
                  );
                }
              } on AuthException catch (e) {
                if (e.code == 'invalid_credentials') {
                  AwesomeDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.topSlide,
                    title: 'Error',
                    desc: 'Username or password is incorrect',
                    btnOkOnPress: () {},
                    btnOkColor: AppColors.switchColor,
                  ).show();
                } else {
                  AwesomeDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.topSlide,
                    title: 'Error',
                    desc: e.message,
                    btnOkOnPress: () {},
                    btnOkColor: AppColors.switchColor,
                  ).show();
                }
              }
            },
            height: 48,
            raduis: 30,
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.singupRoute),
            child: Text.rich(
              TextSpan(
                text: AppStrings.dontHaveAnAccount,
                style: TextStyle(color: Colors.white70),
                children: [
                  TextSpan(
                    text: AppStrings.singup,
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: ' first.'),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
