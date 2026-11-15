import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../helpers.dart';

// SCREEN 6: TASKS & ASSIGNMENTS
// The design doesn't show how to open "Add Task", so we put a small
// "+" icon in the top bar (actions, Topic 1).
class TasksScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text("Tasks & Assignments",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/add-task"),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // filter tags, spread across the width
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              colorPill("All", AppColors.primary, Colors.white),
              pill("Pending"),
              pill("Done"),
              pill("Overdue"),
            ],
          ),
          SizedBox(height: 14),

          // ----- Today -----
          sectionTitle("Today"),
          card(
            Column(
              children: [
                taskRow("Read Chapter 4 — OS", "Operating Systems", false, pill("6 PM")),
                Divider(color: AppColors.grayMid, height: 22),
                taskRow("Submit Lab Report", "Database Systems", true, pill("Done")),
              ],
            ),
          ),

          // ----- Tomorrow -----
          sectionTitle("Tomorrow"),
          card(
            Column(
              children: [
                taskRow("Wireframe Review", "UI / UX Design", false,
                    colorPill("High", AppColors.accent, Colors.white)),
                Divider(color: AppColors.grayMid, height: 22),
                taskRow("Practice Quiz 2", "Database Systems", false, pill("Med")),
              ],
            ),
          ),

          // ----- This Week -----
          sectionTitle("This Week"),
          card(
            taskRow("Network Topology Diagram", "Computer Networks", false, pill("Low")),
          ),
        ],
      ),
      // the design highlights "Schedule" (tab number 2) on this screen
      bottomNavigationBar: bottomBar(context, 2),
    );
  }
}