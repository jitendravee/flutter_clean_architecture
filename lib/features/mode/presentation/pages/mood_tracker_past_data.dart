import 'package:flutter/material.dart';

class MoodTrackerPastData extends StatelessWidget {
  const MoodTrackerPastData({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pastData = [
      {"mood": "😊", "description": "Feeling great today!", "time": "10:00 AM"},
      {
        "mood": "😔",
        "description": "A bit down after the meeting.",
        "time": "1:30 PM"
      },
      {
        "mood": "😎",
        "description": "Chilling with friends!",
        "time": "7:00 PM"
      },
      {
        "mood": "🥱",
        "description": "Tired after a long day.",
        "time": "11:00 PM"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mood Tracker History',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(63, 63, 63, 0.8)),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.purple, Colors.orange],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: pastData.length,
          itemBuilder: (context, index) {
            final data = pastData[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple.shade100,
                  child: Text(
                    data["mood"]!,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                title: Text(
                  data["description"]!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  data["time"]!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                tileColor: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
