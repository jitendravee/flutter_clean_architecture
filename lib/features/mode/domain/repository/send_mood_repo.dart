import 'package:clean_architecture/core/error/Failure_error.dart';
import 'package:clean_architecture/features/mode/domain/entities/send_mood_response.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SendMoodRepo {
  Future<Either<FailureError, SendMoodResponse>> sendMoodTrackerData(
      {required String description});
}
