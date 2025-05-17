import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/validation/password_validation.dart';

class FieldInput extends StatelessWidget {
  const FieldInput({
    super.key,
    required this.controller,
    required this.icon,
    required this.labelText,
    required this.hintText,
    required this.nullField,
    this.formatError,
  });

  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final String hintText;
  final String nullField;
  final String? formatError;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          filled: true,
          fillColor: Color(0xFFCBD6BE),
          prefixIcon: Icon(icon),
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
            return nullField;
          }else if(!isValidPassword(value)){
            return formatError;
          }else{
            return null;
          }
        },
      ),
    );
  }
}