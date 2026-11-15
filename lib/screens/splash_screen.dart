import 'package:flutter/material.dart';
import '../app_colors.dart';

// SCREEN 1: SPLASH  (Topic 7 Container gradient + Topic 8 Stack)
// Tap anywhere to continue. (An automatic timer needs setState, which
// comes in a later topic.)
class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        // pushReplacementNamed = open Login with no way back (Topic 9)
        onTap: () => Navigator.pushReplacementNamed(context, "/login"),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          // green gradient: top = primary, bottom = darker green
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          // Stack = layers. Layer 1: logo. Layer 2: dots at the bottom.
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // logo box: see-through white with a thin border
                    Container(
                      width: 92,
                      height: 92,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(color: Colors.white54, width: 1),
                      ),
                      child: Text(
                        "S",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 23),
                    Text(
                      "StudyPlan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Plan smarter. Study better.",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              // the three dots, pinned near the bottom
              Positioned(
                bottom: 45,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 29,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 9,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 9,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}