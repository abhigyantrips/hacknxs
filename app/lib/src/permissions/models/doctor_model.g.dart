// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorModelImpl _$$DoctorModelImplFromJson(Map<String, dynamic> json) =>
    _$DoctorModelImpl(
      doctorName: json['doctor_name'] as String,
      doctorId: json['doctor_id'] as String,
      hospitals: json['hospitals'] as String,
      specialisation: json['specialisation'] as String,
      rating: json['rating'] as int,
    );

Map<String, dynamic> _$$DoctorModelImplToJson(_$DoctorModelImpl instance) =>
    <String, dynamic>{
      'doctor_name': instance.doctorName,
      'doctor_id': instance.doctorId,
      'hospitals': instance.hospitals,
      'specialisation': instance.specialisation,
      'rating': instance.rating,
    };
