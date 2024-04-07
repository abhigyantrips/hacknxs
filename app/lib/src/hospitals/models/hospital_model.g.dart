// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HospitalModelImpl _$$HospitalModelImplFromJson(Map<String, dynamic> json) =>
    _$HospitalModelImpl(
      hospitalName: json['hospital_name'] as String,
      hospitalId: json['hospital_id'] as String,
      address: json['address'] as String,
      rating: (json['rating'] as num).toDouble(),
      doctors:
          (json['doctors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$HospitalModelImplToJson(_$HospitalModelImpl instance) =>
    <String, dynamic>{
      'hospital_name': instance.hospitalName,
      'hospital_id': instance.hospitalId,
      'address': instance.address,
      'rating': instance.rating,
      'doctors': instance.doctors,
    };
