import 'package:flutter/material.dart';
import 'package:smartgas/colors/colors.dart';

class TextForm extends StatelessWidget {
  double size;
  final String hintText;
  final Color color;
  final Color fillColor;
  final TextEditingController controller;
  final bool isPassword;
  
  TextForm({ Key? key ,this.size = 16,required this.hintText,this.color = AppColors.loginColor ,this.fillColor = AppColors.loginFillColor,required this.controller,this.isPassword = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            //fillColor: Color(0xFFECCB45),
            fillColor: fillColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          ),
        );
  }
}