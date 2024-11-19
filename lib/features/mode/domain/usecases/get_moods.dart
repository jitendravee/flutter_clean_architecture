import 'package:clean_architecture/core/error/Failure_error.dart';
import 'package:clean_architecture/core/usecases/usercase.dart';
import 'package:clean_architecture/features/mode/domain/entities/send_mood_response.dart';
import 'package:clean_architecture/features/mode/domain/repository/send_mood_repo.dart';
import 'package:fpdart/src/either.dart';

final class GetMoods implements Usercase<List<SendMoodResponse>, NoParams> {
  final SendMoodRepo sendMoodRepo;
  GetMoods({required this.sendMoodRepo});

  @override
  Future<Either<FailureError, List<SendMoodResponse>>> call(
      NoParams params) async {
    return await sendMoodRepo.getMoodsFromLocal();
  }
}
