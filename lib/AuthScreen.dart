import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int loginTab = 0;
  int signUpTab = 0;
  int seltin = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
              child: Assets.img.icons.logo.svg(width: 120),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Color(0xff376AED),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              seltin = loginTab;
                            });
                          },
                          child: Text('Login'.toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  color: seltin == loginTab
                                      ? Colors.white
                                      : Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              seltin = 1;
                            });
                          },
                          child: Text('sign up'.toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  color: seltin == 1
                                      ? Colors.white
                                      : Colors.white54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: SingleChildScrollView(
                          child: seltin == loginTab ? _Login() : _SignUp()),
                    ),
                  ))
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome back',
            style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 14,
        ),
        Text(
          'Sign in with your account',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        SizedBox(
          height: 19,
        ),
        const PasswordText(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: Text(
              'Login'.toUpperCase(),
            )),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Forgot your password ?'),
            SizedBox(
              width: 8,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Reset hear',
                  style: TextStyle(letterSpacing: 2),
                ))
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Center(
          child: Text('OR SIGN IN WITH'),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.google.image(width: 36, height: 36),
              SizedBox(
                width: 24,
              ),
              Assets.img.icons.facebook.image(width: 36, height: 36),
              SizedBox(
                width: 24,
              ),
              Assets.img.icons.twitter.image(width: 36, height: 36)
            ],
          ),
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome to blogclub',
            style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 14,
        ),
        Text(
          'please enter your information',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        TextField(
          decoration: InputDecoration(label: Text('Full Name')),
        ),
        SizedBox(
          height: 19,
        ),
        TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        SizedBox(
          height: 19,
        ),
        PasswordText(),
        SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 60)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: Text(
              'Sing up'.toUpperCase(),
            )),
        SizedBox(
          height: 16,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SizedBox(
        //       width: 8,
        //     ),
        //     // TextButton(
        //     //     onPressed: () {},
        //     //     child: Text(
        //     //       'Reset hear',
        //     //       style: TextStyle(letterSpacing: 2),
        //     //     ))
        //   ],
        // ),
        SizedBox(
          height: 12,
        ),
        Center(
          child: Text('OR SIGN UP WITH'),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.google.image(width: 36, height: 36),
              SizedBox(
                width: 24,
              ),
              Assets.img.icons.facebook.image(width: 36, height: 36),
              SizedBox(
                width: 24,
              ),
              Assets.img.icons.twitter.image(width: 36, height: 36)
            ],
          ),
        )
      ],
    );
  }
}

class PasswordText extends StatefulWidget {
  const PasswordText({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  bool obsc = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsc,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: Text('password'),
          suffixIcon: TextButton(
              onPressed: () {
                setState(() {
                  obsc = !obsc;
                });
              },
              child: Text(obsc ? 'Show' : 'Hide'))),
    );
  }
}
