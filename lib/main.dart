import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supaflutter/all_screen/auth_screen.dart';
import 'package:supaflutter/all_screen/splash_screen.dart';
import 'package:supaflutter/core/utils/utils.dart';
import 'service/supa_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
      url: SupaService().url,
      anonKey: SupaService().anonKey,
      postgrestOptions: const PostgrestClientOptions(),
      realtimeClientOptions: const RealtimeClientOptions(eventsPerSecond: 10));
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'SupaNote',
      home: StreamBuilder(
          stream: Supabase.instance.client.auth.onAuthStateChange,
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: SplashScreen()),
              );
            } else if (snapshots.hasError) {
              return const Scaffold(
                body: Center(child: Text('Something Went Wrong!')),
              );
            } else {
              return const AuthScreen();
            }
          }),
    );
  }
}
