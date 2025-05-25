import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/core/my_custom_app_bar.dart';
import 'package:movies_app/data/fetch_movie.dart';
import 'package:movies_app/resources/app_colors.dart';
import 'package:movies_app/screens/home/widget/custom_drawer.dart';
import 'package:movies_app/screens/home/widget/horizontal_movie_section.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: CustomDrawer(),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 16),
        child: ListView(
          children: [
            Row(children: [CustomAppBar(showMenuIcon: true)]),
            Gap(30),
            _welcomeMessage(),
            Gap(25),
            HorizontalMovieSection(
              needRate: false,
              title: 'Now Playing',
              futureMovies: fetchTopRated(),
            ),
            HorizontalMovieSection(
              needRate: true,
              title: 'Popular Movies',
              futureMovies: fetchPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _welcomeMessage() {
  final userName =
      Supabase.instance.client.auth.currentUser?.userMetadata?['username'];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start, // علشان النص يبدأ من اليسار
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Welcome back ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: "$userName", // ← استبدله بـ username المتغير لو موجود
              style: TextStyle(
                color: Colors.amber,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: ' 👋'),
          ],
        ),
      ),
      const SizedBox(height: 8), // ← المسافة بين السطرين
      const Text(
        'Review or log film you’ve watched...',
        style: TextStyle(color: Colors.white70, fontSize: 14),
      ),
    ],
  );
}
