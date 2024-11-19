part of 'mode_traker_bloc.dart';

@immutable
sealed class ModeTrakerEvent {}

final class SendMoodTrackerData extends ModeTrakerEvent {
  final String description;
  SendMoodTrackerData({required this.description});
}

final class GetMoodsListEvent extends ModeTrakerEvent {}
