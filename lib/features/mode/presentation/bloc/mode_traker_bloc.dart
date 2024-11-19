import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/mode/domain/entities/send_mood_response.dart';
import 'package:clean_architecture/features/mode/domain/usecases/send_mood_data.dart';
import 'package:meta/meta.dart';

part 'mode_traker_event.dart';
part 'mode_traker_state.dart';

class ModeTrakerBloc extends Bloc<ModeTrakerEvent, ModeTrakerState> {
  final SendMoodData _sendMoodData;
  ModeTrakerBloc({required SendMoodData sendMoodData})
      : _sendMoodData = sendMoodData,
        super(ModeTrakerInitial()) {
    on<SendMoodTrackerData>(_onSendMoodData);
  }

  Future<void> _onSendMoodData(
      SendMoodTrackerData event, Emitter<ModeTrakerState> emit) async {
    emit(SendMoodTrackerDataLoading());
    try {
      final res =
          await _sendMoodData(SendMoodParams(description: event.description));
      res.fold((l) => emit(SendMoodTrackerDataFailed()),
          (r) => emit(SendMoodTrackerDataSuccess(sendMoodResponse: r)));
    } catch (e) {}
  }
}
