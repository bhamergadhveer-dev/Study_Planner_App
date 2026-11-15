import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../helpers.dart';

// SCREEN 5: SUBJECT DETAILS
// The back arrow appears by itself because this page was opened
// with Navigator.pushNamed (Topic 9).
class SubjectDetailsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text("Database Systems",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // 1) overall progress (pale gold card)
          colorCard(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Overall Progress",
                        style: TextStyle(fontSize: 12, color: AppColors.inkSoft)),
                    SizedBox(height: 3),
                    Text(
                      "70% complete",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.accent,
                  child: Text(
                    "70%",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            AppColors.accentLight,
          ),

          // 2) task breakdown: 4 completed, 2 pending (4 of 6 = 66%)
          sectionTitle("Task Breakdown"),
          card(
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Completed", style: TextStyle(fontSize: 13)),
                    Text("4", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 8),
                progressBar(66, AppColors.primary, AppColors.grayMid),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pending", style: TextStyle(fontSize: 13)),
                    Text("2", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),

          // 3) assignments (plain rows, no card, like the design)
          sectionTitle("Assignments"),
          taskRow("ER Diagram Submission", "Completed · Sep 10", true, SizedBox()),
          taskRow("Normalization Worksheet", "Due Sep 20", false, SizedBox()),
          taskRow("SQL Lab Report", "Due Sep 24", false, SizedBox()),

          // 4) notes
          SizedBox(height: 11),
          sectionTitle("Notes & Resources"),
          card(
            Text("📄 Lecture Slides — Week 5",
                style: TextStyle(fontSize: 13, color: AppColors.ink)),
          ),
        ],
      ),
      bottomNavigationBar: bottomBar(context, 1),
    );
  }
}