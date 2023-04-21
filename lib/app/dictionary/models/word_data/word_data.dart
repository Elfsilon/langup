import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langup/core/utils/firestore_converter.dart';

part 'word_data.freezed.dart';
part 'word_data.g.dart';

@freezed
class WordData with _$WordData {
  const factory WordData({
    required String word,
    required String translation,
  }) = _WordData;

  factory WordData.fromJson(DocumentSnapshot<Map<String, dynamic>> json) =>
      _$WordDataFromJson(FirestoreConverter.snapshotToMap(json));
}
