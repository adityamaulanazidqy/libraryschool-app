import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helpers/validation/email_validation.dart';
import 'helpers/validation/password_validation.dart';
import 'logic/authentication/login_logic.dart';
import 'logic/authentication/register_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library School',
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.login, size: 50, color: Color(0xFFF0BD4A)),
                  SizedBox(height: 10),
                  Text(
                    'Hello Again!',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7C4D1F),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Login to your account',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Input your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Email is required';
                        if (!isValidEmail(value)) return 'Invalid email format';
                        return null;
                      }
                  ),
                  SizedBox(height: 15),

                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Input your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Password is required';
                        if (!isValidPassword(value)) return 'Min 6 chars, include upper, lower, number & symbol';
                        return null;
                      }
                  ),
                  SizedBox(height: 26),
                  
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginUser(emailController.text, passwordController.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: Color(0xFFF0BD4A),
                        ),
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                  ),
                  SizedBox(height: 15),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        'Don\'t have an account? Register',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(Icons.person_add_alt_1_rounded, size: 80, color: Color(0xFFF0BD4A)),
                const SizedBox(height: 10),
                Text(
                  'Create Account',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C4D1F),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter username';
                      if (value.length < 3) return 'Username must be at least 3 characters';
                      return null;
                    }
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Email is required';
                      if (!isValidEmail(value)) return 'Invalid email format';
                      return null;
                    }
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Password is required';
                      if (!isValidPassword(value)) return 'Minimum input 6 chars';
                      return null;
                    }
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerUser(
                            usernameController.text,
                            emailController.text,
                            passController.text
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Color(0xFFF0BD4A),
                    ),
                    child: Text(
                      'Register',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Already have an account? Login',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}