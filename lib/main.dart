import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libraryschool_aplication/screens/auth_screens/register_screen.dart';
import 'package:libraryschool_aplication/screens/home_screen.dart';
import 'package:libraryschool_aplication/widgets/custom_button.dart';
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

                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Password is required';
                        if (!isValidPassword(value)) return 'Min 6 chars, include upper, lower, number & symbol';
                        return null;
                      }
                  ),
                  SizedBox(height: 26),
                  
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                        text: 'Login',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var status = LoginLogic.submit(
                              email: emailController.text,
                              password: passwordController.text,
                            );

                            if (await status){
                              await Fluttertoast.showToast(
                                  msg: 'Success login',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Color(0xFF7C4D1F),
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );

                              if (!mounted) return;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage())
                              );
                            } else {
                              await Fluttertoast.showToast(
                                  msg: 'Failed login',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Color(0xFF7C4D1F),
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                        }
                      }
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