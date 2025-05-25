import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:movies_app/resources/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final username = user?.userMetadata!['username'] ?? 'Unknown';
    final email = user?.email ?? 'Unknown';

    return Drawer(
      backgroundColor: const Color(0xFF001F2D), // لون الخلفية الداكن
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),

          // 🟡 الصورة والاسم
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.amber),
                ),
                SizedBox(height: 10),
                Text(
                  username,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // 🔘 عناصر القائمة
          drawerItem(
            icon: Icons.movie,
            text: "Movies",
            onTap: () {
              print(Supabase.instance.client.auth.currentUser?.userMetadata);
            },
          ),
          drawerItem(icon: Icons.calendar_today, text: "Logger", onTap: () {}),
          drawerItem(icon: Icons.menu_book, text: "Reviews", onTap: () {}),
          drawerItem(
            icon: Icons.favorite_border,
            text: "Wishlist",
            onTap: () {},
          ),
          drawerItem(icon: Icons.list_alt, text: "Lists", onTap: () {}),

          const Spacer(),

          // ⛔ تسجيل الخروج
          drawerItem(
            icon: Icons.logout,
            text: "Logout",
            onTap: () async {
              EasyLoading.show(
                status: 'Logging out...',
                indicator: CircularProgressIndicator(color: Colors.amber),
              );
              await Supabase.instance.client.auth.signOut();
              EasyLoading.dismiss();
              Navigator.pushNamedAndRemoveUntil(
                // ignore: use_build_context_synchronously
                context,
                AppRoutes.loginRoute,
                (route) => false,
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget drawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
