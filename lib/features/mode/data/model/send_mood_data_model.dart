import 'package:clean_architecture/features/mode/domain/entities/send_mood_response.dart';

class SendMoodDataModel extends SendMoodResponse {
  SendMoodDataModel({required List<SentimentLabelModel> scoredLabels})
      : super(scoredLabels: scoredLabels);

  factory SendMoodDataModel.fromJson(Map<String, dynamic> json) {
    return SendMoodDataModel(
      scoredLabels: (json['scored_labels'] as List)
          .map((label) => SentimentLabelModel.fromJson(label))
          .toList(),
    );
  }
}

class SentimentLabelModel extends SentimentLabel {
  SentimentLabelModel({required super.label, required super.score});

  factory SentimentLabelModel.fromJson(Map<String, dynamic> json) {
    return SentimentLabelModel(
      label: json['label'],
      score: (json['score'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'score': score,
    };
  }
}
