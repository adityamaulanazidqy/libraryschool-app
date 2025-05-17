import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libraryschool_aplication/screens/auth_screens/register_screen.dart';
import 'package:libraryschool_aplication/screens/home_screen.dart';
import 'package:libraryschool_aplication/widgets/custom_button.dart';
import 'package:libraryschool_aplication/widgets/custom_field.dart';
import 'helpers/validation/email_validation.dart';
import 'helpers/validation/password_validation.dart';
import 'logic/authentication/login_logic.dart';

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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7F8571), Color(0xFF4A5433)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2, // Seberapa jauh bayangan menyebar dari container
                          blurRadius: 5, // Tingkat keburaman bayangan,
                          offset: Offset(0, 3), // Posisi bayangan secara horizontal dan vertikal
                        )
                      ],
                      color: Color(0xFFB5D966),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Sign In Page",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "LIBRARY",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            letterSpacing: 16,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "SCHOOL",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            letterSpacing: 16,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "a place to borrow books",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  FieldInput(
                    controller: emailController,
                    icon: Icons.email,
                    labelText: "Email",
                    hintText: "Input your email",
                    nullField: "Email is required",
                    formatError: "Invalid email format",
                  ),

                  SizedBox(height: 20),

                  FieldInput(
                    icon: Icons.password,
                    controller: passwordController,
                    labelText: "Password",
                    hintText: "Create a password",
                    nullField: 'Password is required',
                    formatError: 'Invalid password format',
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Login",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                    ),
                  ),

                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "You don't have account?",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),

                      SizedBox(width: 4),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
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
        ),
      ),
    );
  }
}

