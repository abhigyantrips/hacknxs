// dart run build_runner build

import 'package:flutter/foundation.dart';

import 'package:app/src/permissions/models/doctor_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hospital_model.freezed.dart';
part 'hospital_model.g.dart';

@freezed
class HospitalModel with _$HospitalModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HospitalModel({
    required String hospitalName,
    required String hospitalId,
    @Default([]) required List<DoctorModel> doctors,
  }) = _HospitalModel;

  factory HospitalModel.fromJson(Map<String, Object?> json) =>
      _$HospitalModelFromJson(json);
}
