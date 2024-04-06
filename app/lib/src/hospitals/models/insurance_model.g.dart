// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsuranceModelImpl _$$InsuranceModelImplFromJson(Map<String, dynamic> json) =>
    _$InsuranceModelImpl(
      provider: json['provider'] as String,
      hospitals: (json['hospitals'] as List<dynamic>?)
              ?.map((e) => HospitalModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InsuranceModelImplToJson(
        _$InsuranceModelImpl instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'hospitals': instance.hospitals,
    };
