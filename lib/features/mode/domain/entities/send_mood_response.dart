class SendMoodResponse {
  final List<SentimentLabel> scoredLabels;
  SendMoodResponse({required this.scoredLabels});
}

class SentimentLabel {
  final String label;
  final double score;
  SentimentLabel({required this.label, required this.score});
}
