import 'package:clean_architecture/features/mode/data/model/send_mood_data_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract interface class SendMoodDataSource {
  Future<SendMoodDataModel> uploadMood({required String description});
}

class SendMoodDataSourceImpl implements SendMoodDataSource {
  final String _baseUrl =
      'https://api.nlpcloud.io/v1/distilbert-base-uncased-emotion/sentiment';
  final String _token = '627084c794168f0a10c56eae96f9d02d2cb703cd';

  @override
  Future<SendMoodDataModel> uploadMood({required String description}) async {
    try {
      final headers = {
        'user-agent': 'Dart/3.5 (dart:io)',
        'content-type': 'application/json; charset=utf-8',
        'accept-encoding': 'gzip',
        'authorization': 'Token $_token',
      };

      final body = jsonEncode({'text': description});

      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SendMoodDataModel.fromJson(data);
      } else {
        throw Exception(
            'Failed to upload mood. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred while uploading mood: $e');
    }
  }
}
