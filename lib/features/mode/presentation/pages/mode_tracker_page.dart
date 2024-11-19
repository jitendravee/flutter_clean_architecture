import 'package:clean_architecture/features/mode/presentation/bloc/mode_traker_bloc.dart';
import 'package:clean_architecture/features/mode/presentation/pages/mood_response_detail.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture/features/mode/presentation/widgets/slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModeTrackerPage extends StatefulWidget {
  const ModeTrackerPage({super.key});

  @override
  State<ModeTrackerPage> createState() => _ModeTrackerPageState();
}

class _ModeTrackerPageState extends State<ModeTrackerPage> {
  final TextEditingController descriptionController = TextEditingController();

  String currentMoodLabel = '';
  void getCurrentLabel(String moodLabel) {
    setState(() {
      currentMoodLabel = moodLabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModeTrakerBloc, ModeTrakerState>(
      listener: (context, state) {
        if (state is SendMoodTrackerDataSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MoodResponseDetail(
                      sendMoodResponse: state.sendMoodResponse)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Select Your Mood"),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.purple, Colors.orange],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      'Track Your Mood Journey',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: [
                              Colors.yellow,
                              Colors.orange,
                              Colors.red,
                            ],
                          ).createShader(
                              const Rect.fromLTWH(0.0, 0.0, 300.0, 0.0)),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: MoodSlider(
                                sendCurrentMoodLabel: getCurrentLabel,
                                descriptionController: descriptionController,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<ModeTrakerBloc>().add(
                                      SendMoodTrackerData(
                                          description:
                                              descriptionController.text));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: const Text(
                                  "Sumit",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (state is SendMoodTrackerDataLoading)
                Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.purple),
                      ),
                    )),
            ],
          ),
        );
      },
    );
  }
}
