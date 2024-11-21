import 'package:clean_architecture/features/mode/data/datasources/send_mood_data_local.dart';
import 'package:clean_architecture/features/mode/data/datasources/send_mood_data_source.dart';
import 'package:clean_architecture/features/mode/data/repository/send_mood_data_repo_impl.dart';
import 'package:clean_architecture/features/mode/domain/usecases/get_moods.dart';
import 'package:clean_architecture/features/mode/domain/usecases/send_mood_data.dart';
import 'package:clean_architecture/features/mode/presentation/bloc/mode_traker_bloc.dart';
import 'package:clean_architecture/features/mode/presentation/pages/mood_tracker_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => ModeTrakerBloc(
              getMoods: GetMoods(
                  sendMoodRepo: SendMoodDataRepoImpl(SendMoodDataSourceImpl(),
                      SendMoodDataLocalImpl(const FlutterSecureStorage()))),
              sendMoodData: SendMoodData(SendMoodDataRepoImpl(
                  SendMoodDataSourceImpl(),
                  SendMoodDataLocalImpl(const FlutterSecureStorage()))))),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canada Inc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoodTrackerHomePage(),
    );
  }
}
