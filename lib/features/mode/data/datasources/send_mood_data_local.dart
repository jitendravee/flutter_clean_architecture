import 'dart:convert';

import 'package:clean_architecture/features/mode/data/model/send_mood_data_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class SendMoodDataLocal {
  void uploadLocalMoods({required SendMoodDataModel moods});
  Future<List<SendMoodDataModel>> fetchMoodLists();
}

class SendMoodDataLocalImpl implements SendMoodDataLocal {
  final FlutterSecureStorage secureStorage;

  static const String _moodsKey = 'moods_list';

  SendMoodDataLocalImpl(this.secureStorage);

  @override
  void uploadLocalMoods({required SendMoodDataModel moods}) async {
    final existingMoodsJson = await secureStorage.read(key: _moodsKey);
    List<SendMoodDataModel> moodsList = existingMoodsJson != null
        ? (json.decode(existingMoodsJson) as List)
            .map((item) => SendMoodDataModel.fromJson(item))
            .toList()
        : [];

    moodsList.add(moods);

    final updatedMoodsJson =
        json.encode(moodsList.map((mood) => mood.toJson()).toList());
    await secureStorage.write(key: _moodsKey, value: updatedMoodsJson);
  }

  @override
  Future<List<SendMoodDataModel>> fetchMoodLists() async {
    final moodsJson = await secureStorage.read(key: _moodsKey);

    if (moodsJson == null) {
      return [];
    }

    return (json.decode(moodsJson) as List)
        .map((item) => SendMoodDataModel.fromJson(item))
        .toList();
  }
}
