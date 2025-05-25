import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/resources/app_assets.dart';
import 'package:movies_app/resources/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final bool showMenuIcon; // ← متغير جديد

  const CustomAppBar({
    super.key,
    this.showMenuIcon = false,
  }); // ← القيمة الافتراضية false

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ✅ لو showMenuIcon true، اعرض زر المينيو
        if (showMenuIcon)
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu, color: AppColors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),

        Image.asset(width: 36.5, AppAssets.logo),
        const Gap(5),
        Text(
          'CINEPHILER',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.khand().fontFamily,
          ),
        ),
      ],
    );
  }
}
