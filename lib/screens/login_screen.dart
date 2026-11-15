import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../helpers.dart';

// SCREEN 2: LOGIN  (Topic 6 TextField + Topic 5 Buttons)
class LoginScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ListView scrolls, so the keyboard never covers the boxes.
      // The big top padding pushes the content toward the middle.
      body: ListView(
        padding: EdgeInsets.only(left: 22, right: 22, top: 140),
        children: [
          // logo + titles (Column centers its children)
          Column(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary,
                child: Text(
                  "S",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 11),
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
              SizedBox(height: 3),
              Text(
                "Log in to continue studying",
                style: TextStyle(fontSize: 13, color: AppColors.inkSoft),
              ),
            ],
          ),
          SizedBox(height: 22),

          // the two boxes (fieldStyle is in helpers.dart)
          TextField(
            decoration: fieldStyle("Email address"),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 12),
          TextField(
            decoration: fieldStyle("Password"),
            obscureText: true, // dots instead of letters
          ),
          SizedBox(height: 10),

          // "Forgot password?" on the right side
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Forgot password?",
                style: TextStyle(fontSize: 12, color: AppColors.primary),
              ),
            ],
          ),
          SizedBox(height: 17),

          // Log In replaces this page with Home (no way back)
          wideButton("Log In", AppColors.primary,
              () => Navigator.pushReplacementNamed(context, "/home")),
          SizedBox(height: 17),

          // "or" with a line on each side
          Row(
            children: [
              Expanded(child: Container(height: 1, color: AppColors.grayMid)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  "or",
                  style: TextStyle(fontSize: 11, color: AppColors.inkSoft),
                ),
              ),
              Expanded(child: Container(height: 1, color: AppColors.grayMid)),
            ],
          ),
          SizedBox(height: 17),

          // the design has no sign-up page, so we only print for now
          outlineButton("Sign Up", () => print("Sign up tapped")),
        ],
      ),
    );
  }
}