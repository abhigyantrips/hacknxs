// dart run build_runner build

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
class RatingModel with _$RatingModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RatingModel({
    required String id,
    required String rating,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, Object?> json) =>
      _$RatingModelFromJson(json);
}
