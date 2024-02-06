import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'all_screen/home_view.dart';
import 'service/supa_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
    url: SupaService().url,
    anonKey: SupaService().anonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'SupaNote',
      home: const HomeView(),
    );
  }
}
