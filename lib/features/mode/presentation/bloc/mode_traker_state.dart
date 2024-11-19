part of 'mode_traker_bloc.dart';

@immutable
sealed class ModeTrakerState {}

final class ModeTrakerInitial extends ModeTrakerState {}

final class SendMoodTrackerDataSuccess extends ModeTrakerState {
  final SendMoodResponse sendMoodResponse;
  SendMoodTrackerDataSuccess({required this.sendMoodResponse});
}

final class SendMoodTrackerDataLoading extends ModeTrakerState {}

final class SendMoodTrackerDataFailed extends ModeTrakerState {}

final class GetMoodsListSuccess extends ModeTrakerState {
  final List<SendMoodResponse> sendMoodResponse;
  GetMoodsListSuccess({required this.sendMoodResponse});
}

final class GetMoodsListDataLoading extends ModeTrakerState {}

final class GetMoodsListDataFailed extends ModeTrakerState {}
