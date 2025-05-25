import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/custom_text_field.dart';
import 'package:movies_app/core/my_custom_button.dart';
import 'package:movies_app/resources/app_colors.dart';
import 'package:movies_app/resources/app_router.dart';
import 'package:movies_app/resources/app_strings.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupContainer extends StatefulWidget {
  const SignupContainer({super.key});

  @override
  State<SignupContainer> createState() => _SignupContainerState();
}

class _SignupContainerState extends State<SignupContainer> {
  bool isObsecured = true;
  final supabase = Supabase.instance.client;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

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
            AppStrings.singup,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          Gap(8),
          Text(
            AppStrings.createAnAccount,
            style: TextStyle(color: Colors.white70),
          ),
          Gap(24),
          CustomTextField(
            onChanged: (usernameValue) {
              setState(() {
                usernameController.text = usernameValue;
              });
            },
            controller: usernameController,
            hint: 'Username',
            icon: Icons.person,
          ),
          Gap(16),
          CustomTextField(
            onChanged: (emailValue) {
              setState(() {
                emailController.text = emailValue;
              });
            },
            controller: emailController,
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
          Gap(24),
          MyCustomButton(
            text: AppStrings.singup,
            onPressed: () async {
              try {
                await supabase.auth.signUp(
                  data: {
                    'username': usernameController.text,
                    'password': passwordController.text,
                  },
                  email: emailController.text,
                  password: passwordController.text,
                );
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              } on AuthException catch (e) {
                if (e.code!.contains('user_already_exists')) {
                  AwesomeDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'User already exists',
                    btnOkOnPress: () {},
                    btnOkColor: AppColors.switchColor,
                  ).show();
                } else if (e.message.contains('Password should be at least')) {
                  AwesomeDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: 'Password should be at least 8 characters',
                    btnOkOnPress: () {},
                    btnOkColor: AppColors.switchColor,
                  ).show();
                } else {
                  AwesomeDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.rightSlide,
                    title: 'Error',
                    desc: e.message,
                    btnOkOnPress: () {},
                    btnOkColor: AppColors.switchColor,
                  );
                }
              }
            },
            height: 48,
            raduis: 30,
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap:
                () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.loginRoute,
                  (route) => false,
                ),
            child: Text.rich(
              TextSpan(
                text: AppStrings.alreadyHaveAnAccount,
                style: TextStyle(color: Colors.white70),
                children: [
                  TextSpan(
                    text: ' Login Page',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
