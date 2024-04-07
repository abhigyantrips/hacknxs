// dart run build_runner build

import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_model.freezed.dart';
part 'insurance_model.g.dart';

@freezed
class InsuranceModel with _$InsuranceModel {
  const factory InsuranceModel({
    required String provider,
    @Default([]) List<String> hospitals,
  }) = _InsuranceModel;

  factory InsuranceModel.fromJson(Map<String, Object?> json) =>
      _$InsuranceModelFromJson(json);
}
