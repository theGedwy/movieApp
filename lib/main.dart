import 'package:flutter/material.dart';
import 'package:movies_app/app/app.dart';
import 'package:movies_app/resources/supabase_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseConstant.supabaseUrl,
    anonKey: SupabaseConstant.supabaseKey,
  );

  runApp(MyApp());
}
