import 'package:flutter/material.dart';
import 'app_colors.dart';

// =====================================================================
//  HELPER FUNCTIONS
//  Topic 4 reuses a Row "with a function". We do the same here:
//  each function RETURNS a widget, and we call it wherever we need it.
// =====================================================================

// ---------- card: white rounded box with a soft shadow (Topic 7) ----------
Widget card(Widget child) {
  return colorCard(child, Colors.white);
}

// same box, but we choose the color
Widget colorCard(Widget child, Color color) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 14), // space below the card
    padding: EdgeInsets.all(15), // space inside the card
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
      ],
    ),
    child: child,
  );
}

// ---------- pill: small rounded tag like "Exam" or "High" ----------
Widget pill(String text) {
  return colorPill(text, AppColors.grayMid, AppColors.ink); // grey pill
}

Widget colorPill(String text, Color bg, Color fg) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      text,
      style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.w600),
    ),
  );
}

// ---------- sectionTitle: bold heading above a group of cards ----------
Widget sectionTitle(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 11),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.ink,
      ),
    ),
  );
}

// ---------- progressBar: made from a Row of two Expanded boxes ----------
// percent = how much is filled (for example 70).
// Expanded(flex: 70) and Expanded(flex: 30) share the width 70% / 30%.
// ClipRRect (Topic 3) rounds the corners of the whole bar.
Widget progressBar(int percent, Color fill, Color track) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(11),
    child: Row(
      children: [
        Expanded(flex: percent, child: Container(height: 10, color: fill)),
        Expanded(flex: 100 - percent, child: Container(height: 10, color: track)),
      ],
    ),
  );
}

// ---------- buttons (Topic 5): full width, rounded ----------
Widget wideButton(String text, Color color, Function onTap) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget outlineButton(String text, Function onTap) {
  return SizedBox(
    width: double.infinity,
    child: OutlinedButton(
      onPressed: () {
        onTap();
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        backgroundColor: Colors.white,
        side: BorderSide(color: AppColors.primary),
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    ),
  );
}

// ---------- fieldStyle: one look for every text box (Topic 6) ----------
InputDecoration fieldStyle(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: AppColors.inkSoft, fontSize: 13),
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.all(14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(11),
      borderSide: BorderSide(color: AppColors.grayMid),
    ),
  );
}

// ---------- taskRow: checkbox + title + subject + a widget on the right ----------
// done = true gives a filled checkbox. "tag" can be a pill or SizedBox().
Widget taskRow(String title, String subject, bool done, Widget tag) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 9),
    child: Row(
      children: [
        // the checkbox is a small Container
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: done ? AppColors.primary : Colors.transparent, // if done: green
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.primary, width: 1.5),
          ),
        ),
        SizedBox(width: 11),
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
              Text(subject, style: TextStyle(fontSize: 11, color: AppColors.inkSoft)),
            ],
          ),
        ),
        tag,
      ],
    ),
  );
}

// ---------- bottomBar: Home / Subjects / Schedule / Profile ----------
// active = which tab is green (0, 1, 2 or 3)
Widget bottomBar(BuildContext context, int active) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(top: BorderSide(color: AppColors.grayMid, width: 1)),
    ),
    child: SafeArea( // keeps the bar above the phone's bottom edge
      top: false,
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            tabItem(context, 0, active),
            tabItem(context, 1, active),
            tabItem(context, 2, active),
            tabItem(context, 3, active),
          ],
        ),
      ),
    ),
  );
}

// One tab: a small rounded square and a label under it.
Widget tabItem(BuildContext context, int index, int active) {
  List<String> names = ["Home", "Subjects", "Schedule", "Profile"];
  List<String> routes = ["/home", "/subjects", "/schedule", "/profile"];
  bool isActive = (index == active);

  return Expanded(
    child: InkWell(
      // open that page and replace the current one (Topic 9)
      onTap: () => Navigator.pushReplacementNamed(context, routes[index]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : AppColors.grayMid,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          SizedBox(height: 3),
          Text(
            names[index],
            style: TextStyle(
              fontSize: 10,
              color: isActive ? AppColors.primary : AppColors.inkSoft,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}