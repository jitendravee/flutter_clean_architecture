import 'package:flutter/material.dart';

class MoodSlider extends StatefulWidget {
  final Function(String) sendCurrentMoodLabel;
  final TextEditingController descriptionController;
  const MoodSlider(
      {super.key,
      required this.descriptionController,
      required this.sendCurrentMoodLabel});

  @override
  State<MoodSlider> createState() => _MoodSliderState();
}

class _MoodSliderState extends State<MoodSlider> {
  double currentSliderValue = 2;
  final List<String> moodEmojis = ["😔", "😕", "😐", "😊", "😄"];
  final List<String> moodLabels = ["Sad", "Meh", "Neutral", "Happy", "Excited"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "How are you feeling today?",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            moodEmojis[currentSliderValue.toInt()],
            style: const TextStyle(fontSize: 50),
          ),
          const SizedBox(height: 10),
          Text(
            moodLabels[currentSliderValue.toInt()],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 20),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.blue,
              inactiveTrackColor: Colors.blue.withOpacity(0.3),
              trackHeight: 4.0,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
              thumbColor: Colors.blue,
              overlayColor: Colors.blue.withOpacity(0.2),
            ),
            child: Slider(
              value: currentSliderValue,
              min: 0,
              max: moodEmojis.length - 1.0,
              divisions: moodEmojis.length - 1,
              onChanged: (double value) {
                setState(() {
                  currentSliderValue = value;
                  widget.sendCurrentMoodLabel(
                      moodLabels[currentSliderValue.toInt()]);
                });
              },
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: widget.descriptionController,
            decoration: InputDecoration(
              labelText: "Describe your mood",
              hintText: "What made you feel this way?",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
