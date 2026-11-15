import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../helpers.dart';

// SCREEN 8: STUDY SCHEDULE
// The calendar is 3 Rows. Each Row has 7 equal boxes (Expanded).
class ScheduleScreen extends StatelessWidget {
  // A function: one calendar cell.
  // type 0 = normal day, 1 = letter (S M T...), 2 = today, 3 = day with a task
  Widget cell(String text, int type) {
    Color bg = Colors.transparent;
    Color fg = AppColors.inkSoft;
    FontWeight weight = FontWeight.normal;

    if (type == 1) {
      fg = AppColors.ink;
      weight = FontWeight.bold;
    }
    if (type == 2) {
      bg = AppColors.primary;
      fg = Colors.white;
      weight = FontWeight.bold;
    }
    if (type == 3) {
      bg = AppColors.accentLight;
      fg = AppColors.accent;
      weight = FontWeight.bold;
    }

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(text, style: TextStyle(fontSize: 12, color: fg, fontWeight: weight)),
      ),
    );
  }

  // A function: one study block (time on the left, tag on the right)
  Widget studyBlock(String time, String tag, Color bg, Color fg) {
    return card(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: TextStyle(fontSize: 13, color: AppColors.ink)),
          colorPill(tag, bg, fg),
        ],
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
        title: Text("Study Schedule",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // calendar card
          card(
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("September 2026",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text("‹ ›",
                        style: TextStyle(fontSize: 16, color: AppColors.primary)),
                  ],
                ),
                SizedBox(height: 11),
                // row 1: day letters
                Row(children: [
                  cell("S", 1), cell("M", 1), cell("T", 1), cell("W", 1),
                  cell("T", 1), cell("F", 1), cell("S", 1),
                ]),
                // row 2: 14 to 20 (16 and 18 have tasks)
                Row(children: [
                  cell("14", 0), cell("15", 0), cell("16", 3), cell("17", 0),
                  cell("18", 3), cell("19", 0), cell("20", 0),
                ]),
                // row 3: 21 to 27 (22 is today, 24 has a task)
                Row(children: [
                  cell("21", 0), cell("22", 2), cell("23", 0), cell("24", 3),
                  cell("25", 0), cell("26", 0), cell("27", 0),
                ]),
              ],
            ),
          ),

          // the plan for the selected day
          sectionTitle("Mon, Sep 22"),
          studyBlock("8:00 – 9:30 AM", "DB Study", AppColors.primary, Colors.white),
          studyBlock("11:00 – 12:00 PM", "UI/UX Sketch", AppColors.accent, Colors.white),
          studyBlock("4:00 – 5:00 PM", "Networks Reading", AppColors.grayMid, AppColors.ink),

          SizedBox(height: 2),
          outlineButton("+ Add Study Block", () => print("Add study block")),
        ],
      ),
      bottomNavigationBar: bottomBar(context, 2),
    );
  }
}