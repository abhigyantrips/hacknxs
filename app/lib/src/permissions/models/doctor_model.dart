// dart run build_runner build

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_model.freezed.dart';
part 'doctor_model.g.dart';

@freezed
class DoctorModel with _$DoctorModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DoctorModel({
    required String doctorName,
    required String doctorId,
    required String hospitals,
    required String specialisation,
    required int rating,
  }) = _DoctorModel;

  factory DoctorModel.fromJson(Map<String, Object?> json) =>
      _$DoctorModelFromJson(json);
}
