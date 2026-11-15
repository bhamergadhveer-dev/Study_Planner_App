import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../helpers.dart';

// SCREEN 3: HOME  (Topic 1 AppBar, Topic 4 Row/Column, Topic 7 Container)
class HomeScreen extends StatelessWidget {
  // A function: one "Upcoming" card. Tapping it opens Tasks.
  Widget upcomingCard(BuildContext context, String title, String time,
      String tag, Color tagColor) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/tasks"),
      child: card(
        Row(
          children: [
            // Expanded: the text takes the free space, the pill sits at the end
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.ink,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(time, style: TextStyle(fontSize: 11, color: AppColors.inkSoft)),
                ],
              ),
            ),
            colorPill(tag, tagColor, Colors.white),
          ],
        ),
      ),
    );
  }

  // A function: one small subject card with a progress bar.
  Widget subjectBox(BuildContext context, String name, int percent, Color color) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/subject-details"),
      child: card(
        Column(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.ink,
              ),
            ),
            SizedBox(height: 8),
            progressBar(percent, color, AppColors.grayMid),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,

      // white top bar: greeting on the left, bell on the right (actions)
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.ink,
        elevation: 0,
        scrolledUnderElevation: 0, // bar keeps its color when the page scrolls
        centerTitle: false,
        title: Text(
          "Hi, BHAMER 👋",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/exams"),
            icon: Text("🔔", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // 1) green progress card
          colorCard(
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Today's Progress",
                            style: TextStyle(fontSize: 12, color: Colors.white70)),
                        SizedBox(height: 3),
                        Text(
                          "3 of 5 tasks done",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white24,
                      child: Text(
                        "60%",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 11),
                progressBar(60, Colors.white, Colors.white30),
              ],
            ),
            AppColors.primary,
          ),

          // 2) upcoming
          sectionTitle("Upcoming"),
          upcomingCard(context, "Database Systems — Quiz 2", "Tomorrow, 10:00 AM",
              "Exam", AppColors.accent),
          upcomingCard(context, "UI/UX — Wireframe Submission", "Fri, 11:59 PM",
              "Task", AppColors.primary),

          // 3) my subjects: two cards side by side
          sectionTitle("My Subjects"),
          Row(
            children: [
              Expanded(child: subjectBox(context, "Database", 70, AppColors.primary)),
              SizedBox(width: 12),
              Expanded(child: subjectBox(context, "UI / UX", 45, AppColors.accent)),
            ],
          ),
        ],
      ),

      bottomNavigationBar: bottomBar(context, 0),
    );
  }
}