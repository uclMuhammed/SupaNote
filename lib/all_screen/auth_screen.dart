import 'package:flutter/material.dart';
import 'package:supaflutter/all_screen/sing_in.dart';
import 'package:supaflutter/all_screen/sing_up.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  void toggle() => setState(() => isLogin = !isLogin);
  @override
  Widget build(BuildContext context) => isLogin
      ? SingIn(onClickedSingUp: toggle)
      : SingUp(onClickedSingIn: toggle);
}
