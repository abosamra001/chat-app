import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _email, _password;

  final _formKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      Navigator.of(context).pop();
      Navigator.pushNamed(context, 'ChatPage', arguments: _email);
    } on FirebaseAuthException catch (e) {
      String? exText;
      switch (e.code) {
        case 'email-already-in-use':
          exText = 'Try another email this one is already in use';
          break;
        case 'invalid-email':
          exText = 'The email is invalid try another one';
          break;
        case 'weak-password':
          exText = 'the password is too short must be 6 digits';
          break;
      }
      Navigator.of(context).pop();
      showSnackBar(context, exText!);
    }
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
              Color.fromARGB(255, 179, 203, 243),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create Account',
                      style: GoogleFonts.lobster(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextField(
                      onChanged: (_) {},
                      label: 'Username',
                      prefixIcon: const Icon(Icons.person),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      onChanged: (_) {},
                      label: 'Mobile',
                      prefixIcon: const Icon(Icons.phone),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      onChanged: (value) => _email = value,
                      label: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      onChanged: (value) => _password = value,
                      label: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await registerUser();
                        }
                      },
                      childText: 'Sign Up',
                      backgroungColor: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Divider(
                            height: 20,
                            thickness: 2,
                            color: Colors.white,
                            endIndent: 5,
                          ),
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            height: 80,
                            thickness: 2,
                            color: Colors.white,
                            indent: 5,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.only(left: 80),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/facebook_logo.png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'Sign Up With Facebook',
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 64, 80, 181),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        padding: const EdgeInsets.only(left: 80),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/google_logo.png',
                              width: 30,
                              height: 30,
                            ),
                            Text(
                              'Sign Up With Google',
                              style: GoogleFonts.lato(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
