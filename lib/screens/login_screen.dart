import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import '/widgets/custom_textfield.dart';
import '/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email, _password;

  final _formKey = GlobalKey<FormState>();

  Future<void> logIn() async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _email!,
      password: _password!,
    );
    Navigator.of(context).pop();
  }

  void showSnackBar(context, String exText) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(exText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 126, 229),
              Color.fromARGB(255, 149, 190, 254),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset(
              'assets/images/scholar.png',
            ),
            Text(
              'Scholar Chat',
              style: GoogleFonts.lobster(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      onChanged: (value) {
                        _email = value;
                      },
                      label: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      onChanged: (value) {
                        _password = value;
                      },
                      label: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await logIn();
                            Navigator.pushNamed(context, 'ChatPage')
                                .then((_) => FirebaseAuth.instance.signOut());
                          } on FirebaseAuthException catch (e) {
                            showSnackBar(context, e.code);
                          }
                        }
                      },
                      childText: 'Sign in',
                      backgroungColor: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('don\'t have an account?  '),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              'SignUpPage',
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
