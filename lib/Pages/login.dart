import 'package:flutter/material.dart';
import 'package:kwatajob/components/button.dart';
import 'package:kwatajob/components/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.work_outline, size: 64, color: Colors.black),
              const SizedBox(height: 12),
              const Text(
                "KwataJob",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Connecte-toi pour continuer",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 40),
              CustomTextField(label: "Email", controller: email),
              const SizedBox(height: 16),
              CustomTextField(
                label: "Password",
                controller: password,
                obscureText: true,
              ),
              const SizedBox(height: 28),
              CustomButton(label: "Login", onPressed: () {}),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Pas encore de compte ? S'inscrire",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}