import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final customOrange = const Color(0xFFF1B363);

    final Map<String, String>? args = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    final String? registeredEmail = args?['email'];
    final String? registeredPassword = args?['password'];

    return Scaffold(
      backgroundColor: customOrange,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Spotlight',
                style: GoogleFonts.doHyeon(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField('Email', _emailController),
              const SizedBox(height: 20),
              _buildTextField('Password', _passwordController, obscureText: true),
              const SizedBox(height: 20),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_emailController.text == registeredEmail &&
                      _passwordController.text == registeredPassword) {
                    Navigator.pushReplacementNamed(context, '/');
                  } else {
                    setState(() {
                      _errorMessage = 'Wrong credentials!';
                      _emailController.clear();
                      _passwordController.clear();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                ),
                child: Text(
                  'Log in',
                  style: GoogleFonts.doHyeon(fontSize: 20, color: customOrange),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/create_user');
                },
                child: Text(
                  'Create a user',
                  style: GoogleFonts.doHyeon(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.doHyeon(fontSize: 16, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
    );
  }
}
