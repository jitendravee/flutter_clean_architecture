import 'package:clean_architecture/features/mode/data/datasources/send_mood_data_local.dart';
import 'package:clean_architecture/features/mode/data/datasources/send_mood_data_source.dart';
import 'package:clean_architecture/features/mode/data/repository/send_mood_data_repo_impl.dart';
import 'package:clean_architecture/features/mode/domain/repository/send_mood_repo.dart';
import 'package:clean_architecture/features/mode/domain/usecases/get_moods.dart';
import 'package:clean_architecture/features/mode/domain/usecases/send_mood_data.dart';
import 'package:clean_architecture/features/mode/presentation/bloc/mode_traker_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
Future<void> init_dependencies() async {
  serviceLocator.registerLazySingleton(() => const FlutterSecureStorage());

  _initMood();
}

void _initMood() {
  serviceLocator.registerFactory(
    () => SendMoodDataLocalImpl(
      serviceLocator<FlutterSecureStorage>(),
    ),
  );

  // Register SendMoodDataSourceImpl as an implementation of SendMoodDataSource
  serviceLocator
      .registerFactory<SendMoodDataSource>(() => SendMoodDataSourceImpl());

  // Register repository
  serviceLocator.registerFactory<SendMoodRepo>(
      () => SendMoodDataRepoImpl(serviceLocator(), serviceLocator()));

  // Register use cases
  serviceLocator.registerFactory(() => SendMoodData(serviceLocator()));
  serviceLocator
      .registerFactory(() => GetMoods(sendMoodRepo: serviceLocator()));

  // Register Bloc
  serviceLocator.registerFactory(() => ModeTrakerBloc(
      getMoods: serviceLocator(), sendMoodData: serviceLocator()));
}
