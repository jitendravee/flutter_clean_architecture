import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/usecases/usercase.dart';
import 'package:clean_architecture/features/mode/domain/entities/send_mood_response.dart';
import 'package:clean_architecture/features/mode/domain/usecases/get_moods.dart';
import 'package:clean_architecture/features/mode/domain/usecases/send_mood_data.dart';
import 'package:meta/meta.dart';

part 'mode_traker_event.dart';
part 'mode_traker_state.dart';

class ModeTrakerBloc extends Bloc<ModeTrakerEvent, ModeTrakerState> {
  final SendMoodData _sendMoodData;
  final GetMoods _getMoods;
  ModeTrakerBloc(
      {required GetMoods getMoods, required SendMoodData sendMoodData})
      : _getMoods = getMoods,
        _sendMoodData = sendMoodData,
        super(ModeTrakerInitial()) {
    on<SendMoodTrackerData>(_onSendMoodData);
    on<GetMoodsListEvent>(_getMoodsList);
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

  Future<void> _getMoodsList(
      GetMoodsListEvent event, Emitter<ModeTrakerState> emit) async {
    try {
      final res = await _getMoods(NoParams());
      res.fold((l) => emit(GetMoodsListDataFailed()),
          (r) => emit(GetMoodsListSuccess(sendMoodResponse: r)));
    } catch (e) {
      emit(GetMoodsListDataFailed());
    }
  }
}
