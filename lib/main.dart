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

                  SizedBox(height: 50),

                  Text(
                    "LIBRARY",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      letterSpacing: 20,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "SCHOOL",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      letterSpacing: 20,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "a place to borrow books",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  SizedBox(height: 40),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFAEBD9D),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Input your email",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                        filled: true,
                        fillColor: Color(0xFFCBD6BE),
                        prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),

                        errorStyle: TextStyle(
                            fontSize: 12,
                            height: 2,
                            color: Colors.white
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!isValidEmail(value)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFAEBD9D),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Create a password",
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                        filled: true,
                        fillColor: Color(0xFFCBD6BE),
                        prefixIcon: Icon(Icons.password),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        errorStyle: TextStyle(
                            fontSize: 12,
                            height: 2,
                            color: Colors.white
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Password is required';
                        }else if(!isValidPassword(value)){
                          return 'Invalid password format';
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Login",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var status = LoginLogic.submit(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
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