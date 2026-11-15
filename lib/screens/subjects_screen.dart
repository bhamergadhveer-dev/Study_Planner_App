import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../helpers.dart';

// SCREEN 4: SUBJECTS
class SubjectsScreen extends StatelessWidget {
  // A function: one subject card. Only the values change between cards.
  Widget subjectItem(BuildContext context, String initials, String name,
      String info, String percent, Color squareColor, Color pillBg, Color pillFg) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/subject-details"),
      child: card(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // colored square with the initials
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: squareColor,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 11),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ink,
                      ),
                    ),
                    Text(info, style: TextStyle(fontSize: 11, color: AppColors.inkSoft)),
                  ],
                ),
              ],
            ),
            colorPill(percent, pillBg, pillFg),
          ],
        ),
      ),
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
        title: Text("My Subjects",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(decoration: fieldStyle("🔍  Search subjects")),
          SizedBox(height: 14),

          subjectItem(context, "DB", "Database Systems", "6 tasks · 2 exams", "70%",
              AppColors.primary, AppColors.primary, Colors.white),
          subjectItem(context, "UX", "UI / UX Design", "4 tasks · 1 exam", "45%",
              AppColors.accent, AppColors.accent, Colors.white),
          subjectItem(context, "OS", "Operating Systems", "3 tasks · 1 exam", "30%",
              AppColors.subjectGreen, AppColors.grayMid, AppColors.ink),
          subjectItem(context, "CN", "Computer Networks", "5 tasks · 0 exams", "15%",
              AppColors.subjectGold, AppColors.grayMid, AppColors.ink),

          SizedBox(height: 4),
          // the design has no "add subject" page, so we only print for now
          wideButton("+ Add Subject", AppColors.accent, () => print("Add subject")),
        ],
      ),
      bottomNavigationBar: bottomBar(context, 1),
    );
  }
}