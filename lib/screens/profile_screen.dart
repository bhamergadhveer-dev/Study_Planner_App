import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../helpers.dart';

// SCREEN 10: PROFILE  (CircleAvatar, Row/Column, Container bars)
class ProfileScreen extends StatelessWidget {
  // A function: one bar of the chart. A taller bar = more study hours.
  Widget bar(double height, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
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
        title: Text("Profile",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // avatar + name (a Column centers its children)
          Column(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: AppColors.primary,
                child: Text(
                  "B",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 11),
              Text(
                "BHAMER",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
              SizedBox(height: 2),
              Text("BSCS · Semester 5",
                  style: TextStyle(fontSize: 12, color: AppColors.inkSoft)),
            ],
          ),
          SizedBox(height: 17),

          // two stat cards side by side
          Row(
            children: [
              Expanded(
                child: card(
                  Column(
                    children: [
                      Text("82%",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary)),
                      Text("Weekly Goal",
                          style: TextStyle(fontSize: 11, color: AppColors.inkSoft)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: card(
                  Column(
                    children: [
                      Text("14",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.accent)),
                      Text("Day Streak",
                          style: TextStyle(fontSize: 11, color: AppColors.inkSoft)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // bar chart: 7 Containers, bottoms lined up (CrossAxisAlignment.end)
          sectionTitle("Weekly Study Hours"),
          card(
            SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  bar(32, AppColors.grayMid),
                  bar(56, AppColors.primary),
                  bar(44, AppColors.grayMid),
                  bar(68, AppColors.accent),
                  bar(28, AppColors.grayMid),
                  bar(48, AppColors.primary),
                  bar(16, AppColors.grayMid),
                ],
              ),
            ),
          ),

          // settings (no page in the design)
          card(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("⚙️ Settings", style: TextStyle(fontSize: 13)),
                Text("›", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),

          // log out: replace this page with Login (no way back)
          InkWell(
            onTap: () => Navigator.pushReplacementNamed(context, "/login"),
            child: card(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("🚪 Log Out", style: TextStyle(fontSize: 13)),
                  Text("›", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomBar(context, 3),
    );
  }
}