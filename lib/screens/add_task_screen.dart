import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../helpers.dart';

// SCREEN 7: ADD NEW TASK  (Topic 6 Form + validator)
// The formKey sits above the class, exactly like in your notes.
final taskFormKey = GlobalKey<FormState>();

class AddTaskScreen extends StatelessWidget {
  // A function: the small grey label above each box
  Widget label(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(text, style: TextStyle(fontSize: 11, color: AppColors.inkSoft)),
    );
  }

  // A function: a box that looks like a dropdown (text + ▾)
  Widget selectBox(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: AppColors.grayMid, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(fontSize: 13, color: AppColors.inkSoft)),
          Text("▾", style: TextStyle(color: AppColors.inkSoft)),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        // the ✕ button goes back (Navigator.pop, Topic 9)
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        title: Text("Add New Task",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: Form(
        key: taskFormKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            label("Task Title"),
            TextFormField(
              decoration: fieldStyle("e.g. Finish SQL assignment"),
              // validator: an error message, or null when it is fine
              validator: (v) => v!.isEmpty ? "Enter a task title" : null,
            ),
            SizedBox(height: 12),

            label("Subject"),
            selectBox("Database Systems"),

            label("Due Date"),
            selectBox("📅 Sep 24, 2026"),

            label("Priority"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                colorPill("High", AppColors.primary, Colors.white),
                pill("Medium"),
                pill("Low"),
              ],
            ),
            SizedBox(height: 14),

            label("Notes"),
            TextFormField(
              maxLines: 3,
              decoration: fieldStyle("Add extra details..."),
            ),
            SizedBox(height: 14),

            // validate() on the button, like the sign-up screen in the notes
            wideButton("Save Task", AppColors.primary, () {
              if (taskFormKey.currentState!.validate()) {
                print("Task saved"); // saving for real comes later
                Navigator.pop(context);
              }
            }),
          ],
        ),
      ),
      // no bottom bar here, same as the design
    );
  }
}