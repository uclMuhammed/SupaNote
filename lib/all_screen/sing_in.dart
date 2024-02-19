import 'package:flutter/material.dart';
import 'package:supaflutter/core/decoration/decoration.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key, required this.onClickedSingUp});
  final VoidCallback onClickedSingUp;
  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome",
            style: myTitleTextStyle(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: key,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height / 10, horizontal: width / 8),
            child: Column(
              children: [
                Container(
                  decoration: myBoxDecoration(Colors.white12, 25, 25, 25, 150,
                      Offset(0, 0), Colors.white10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Sing In',
                          style: myTitleTextStyle(),
                        ),
                        SizedBox(
                          height: height / 25,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration:
                              textFormFieldDecoration("", "Email Adress"),
                          style: myFormTextStyle(),
                        ),
                        SizedBox(
                          height: height / 25,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.name,
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          decoration: textFormFieldDecoration("", "Password"),
                          style: myFormTextStyle(),
                        ),
                        SizedBox(
                          height: height / 10,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: myBoxDecoration(
                                  Colors.deepPurple,
                                  200,
                                  200,
                                  200,
                                  200,
                                  Offset(-2, 5),
                                  Colors.black54),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_forward),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Join Us?",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
