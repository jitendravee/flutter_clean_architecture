import 'package:clean_architecture/core/error/Failure_error.dart';
import 'package:clean_architecture/core/usecases/usercase.dart';
import 'package:clean_architecture/features/mode/domain/entities/send_mood_response.dart';
import 'package:clean_architecture/features/mode/domain/repository/send_mood_repo.dart';
import 'package:fpdart/fpdart.dart';

final class SendMoodData implements Usercase<SendMoodResponse, SendMoodParams> {
  final SendMoodRepo sendMoodRepo;
  SendMoodData(this.sendMoodRepo);
  @override
  Future<Either<FailureError, SendMoodResponse>> call(
      SendMoodParams params) async {
    return await sendMoodRepo.sendMoodTrackerData(
        description: params.description);
  }
}

final class SendMoodParams {
  final String description;
  SendMoodParams({required this.description});
}
