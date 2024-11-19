import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mode_traker_event.dart';
part 'mode_traker_state.dart';

class ModeTrakerBloc extends Bloc<ModeTrakerEvent, ModeTrakerState> {
  ModeTrakerBloc() : super(ModeTrakerInitial()) {
    on<ModeTrakerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
