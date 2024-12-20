import 'package:clean_architecture/core/error/Failure_error.dart';
import 'package:clean_architecture/features/mode/data/datasources/send_mood_data_local.dart';
import 'package:clean_architecture/features/mode/data/datasources/send_mood_data_source.dart';
import 'package:clean_architecture/features/mode/domain/entities/send_mood_response.dart';
import 'package:clean_architecture/features/mode/domain/repository/send_mood_repo.dart';
import 'package:fpdart/src/either.dart';

class SendMoodDataRepoImpl implements SendMoodRepo {
  final SendMoodDataSource sendMoodDataSource;
  final SendMoodDataLocalImpl sendMoodDataLocalImpl;
  SendMoodDataRepoImpl(this.sendMoodDataSource, this.sendMoodDataLocalImpl);
  @override
  Future<Either<FailureError, SendMoodResponse>> sendMoodTrackerData(
      {required String description}) async {
    try {
      final data =
          await sendMoodDataSource.uploadMood(description: description);
      if (data != null) {
        sendMoodDataLocalImpl.uploadLocalMoods(moods: data);
      }
      return right(data);
    } catch (e) {
      return left(FailureError(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureError, List<SendMoodResponse>>>
      getMoodsFromLocal() async {
    try {
      final data = await sendMoodDataLocalImpl.fetchMoodLists();
      return right(data);
    } catch (e) {
      return left(FailureError(message: e.toString()));
    }
  }
}
