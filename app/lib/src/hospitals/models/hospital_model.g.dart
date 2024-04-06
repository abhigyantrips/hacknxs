// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HospitalModelImpl _$$HospitalModelImplFromJson(Map<String, dynamic> json) =>
    _$HospitalModelImpl(
      hospitalName: json['hospital_name'] as String,
      hospitalId: json['hospital_id'] as String,
      doctors: (json['doctors'] as List<dynamic>?)
              ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HospitalModelImplToJson(_$HospitalModelImpl instance) =>
    <String, dynamic>{
      'hospital_name': instance.hospitalName,
      'hospital_id': instance.hospitalId,
      'doctors': instance.doctors,
    };
