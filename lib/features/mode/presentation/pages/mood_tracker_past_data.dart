import 'package:clean_architecture/features/mode/presentation/bloc/mode_traker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoodTrackerPastData extends StatefulWidget {
  const MoodTrackerPastData({super.key});

  @override
  State<MoodTrackerPastData> createState() => _MoodTrackerPastDataState();
}

class _MoodTrackerPastDataState extends State<MoodTrackerPastData> {
  @override
  void initState() {
    super.initState();
    context.read<ModeTrakerBloc>().add(GetMoodsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mood Tracker History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(63, 63, 63, 0.8),
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: BlocBuilder<ModeTrakerBloc, ModeTrakerState>(
        builder: (context, state) {
          if (state is GetMoodsListDataFailed) {
            return const Center(
              child: Text('Failed to load moods. Please try again later.'),
            );
          } else if (state is GetMoodsListSuccess) {
            final moodDataList = state.sendMoodResponse;

            if (moodDataList.isEmpty) {
              return const Center(
                child: Text('No mood history available.'),
              );
            }

            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.purple, Colors.orange],
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: moodDataList.length,
                itemBuilder: (context, index) {
                  final sendMoodResponse = moodDataList[index];
                  final moodData = sendMoodResponse.scoredLabels;

                  return Column(
                    children: [
                      Text(
                        'Mood History ${index + 1}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        itemCount: moodData.length,
                        itemBuilder: (context, subIndex) {
                          final data = moodData[subIndex];
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
                                  data.label.substring(0, 2).toUpperCase(),
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                              title: Text(
                                data.label,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                'Score: ${data.score.toStringAsFixed(2)}',
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
                    ],
                  );
                },
              ),
            );
          } else if (state is ModeTrakerInitial ||
              state is SendMoodTrackerDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Unexpected error.'),
            );
          }
        },
      ),
    );
  }
}
