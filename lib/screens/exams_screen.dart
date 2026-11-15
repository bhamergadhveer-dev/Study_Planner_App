import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../helpers.dart';

// SCREEN 9: EXAMS & NOTIFICATIONS
class ExamsScreen extends StatelessWidget {
  // A function: one exam card (title + place on the left, countdown on the right)
  Widget examCard(String title, String details, String days, Color titleColor,
      Color cardColor, Color pillBg, Color pillFg) {
    return colorCard(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
              SizedBox(height: 2),
              Text(details, style: TextStyle(fontSize: 11, color: AppColors.inkSoft)),
            ],
          ),
          colorPill(days, pillBg, pillFg),
        ],
      ),
      cardColor,
    );
  }

  // A function: one notification card
  Widget notification(String text) {
    return card(
      Text(text, style: TextStyle(fontSize: 13, color: AppColors.ink)),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text("Exams & Notifications",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          sectionTitle("Upcoming Exams"),
          // the next exam is highlighted (pale gold card)
          examCard("Database Systems — Quiz 2", "Sep 23, 10:00 AM · Room 204",
              "2 days", AppColors.accent, AppColors.accentLight,
              AppColors.accent, Colors.white),
          examCard("Operating Systems — Midterm", "Oct 2, 9:00 AM · Room 110",
              "11 days", AppColors.ink, Colors.white,
              AppColors.grayMid, AppColors.ink),

          sectionTitle("Notifications"),
          notification("🔔 Reminder: SQL Lab Report due tomorrow"),
          notification("📌 New study block added for Wed"),
          notification("✅ You completed 3 tasks today — nice work!"),
        ],
      ),
      // the design highlights "Schedule" on this screen too
      bottomNavigationBar: bottomBar(context, 2),
    );
  }
}