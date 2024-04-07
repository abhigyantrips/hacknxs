// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insurance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InsuranceModel _$InsuranceModelFromJson(Map<String, dynamic> json) {
  return _InsuranceModel.fromJson(json);
}

/// @nodoc
mixin _$InsuranceModel {
  String get provider => throw _privateConstructorUsedError;
  List<String> get hospitals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsuranceModelCopyWith<InsuranceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsuranceModelCopyWith<$Res> {
  factory $InsuranceModelCopyWith(
          InsuranceModel value, $Res Function(InsuranceModel) then) =
      _$InsuranceModelCopyWithImpl<$Res, InsuranceModel>;
  @useResult
  $Res call({String provider, List<String> hospitals});
}

/// @nodoc
class _$InsuranceModelCopyWithImpl<$Res, $Val extends InsuranceModel>
    implements $InsuranceModelCopyWith<$Res> {
  _$InsuranceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? hospitals = null,
  }) {
    return _then(_value.copyWith(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      hospitals: null == hospitals
          ? _value.hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsuranceModelImplCopyWith<$Res>
    implements $InsuranceModelCopyWith<$Res> {
  factory _$$InsuranceModelImplCopyWith(_$InsuranceModelImpl value,
          $Res Function(_$InsuranceModelImpl) then) =
      __$$InsuranceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String provider, List<String> hospitals});
}

/// @nodoc
class __$$InsuranceModelImplCopyWithImpl<$Res>
    extends _$InsuranceModelCopyWithImpl<$Res, _$InsuranceModelImpl>
    implements _$$InsuranceModelImplCopyWith<$Res> {
  __$$InsuranceModelImplCopyWithImpl(
      _$InsuranceModelImpl _value, $Res Function(_$InsuranceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? hospitals = null,
  }) {
    return _then(_$InsuranceModelImpl(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      hospitals: null == hospitals
          ? _value._hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsuranceModelImpl
    with DiagnosticableTreeMixin
    implements _InsuranceModel {
  const _$InsuranceModelImpl(
      {required this.provider, final List<String> hospitals = const []})
      : _hospitals = hospitals;

  factory _$InsuranceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsuranceModelImplFromJson(json);

  @override
  final String provider;
  final List<String> _hospitals;
  @override
  @JsonKey()
  List<String> get hospitals {
    if (_hospitals is EqualUnmodifiableListView) return _hospitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hospitals);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InsuranceModel(provider: $provider, hospitals: $hospitals)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InsuranceModel'))
      ..add(DiagnosticsProperty('provider', provider))
      ..add(DiagnosticsProperty('hospitals', hospitals));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsuranceModelImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            const DeepCollectionEquality()
                .equals(other._hospitals, _hospitals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, provider, const DeepCollectionEquality().hash(_hospitals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsuranceModelImplCopyWith<_$InsuranceModelImpl> get copyWith =>
      __$$InsuranceModelImplCopyWithImpl<_$InsuranceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsuranceModelImplToJson(
      this,
    );
  }
}

abstract class _InsuranceModel implements InsuranceModel {
  const factory _InsuranceModel(
      {required final String provider,
      final List<String> hospitals}) = _$InsuranceModelImpl;

  factory _InsuranceModel.fromJson(Map<String, dynamic> json) =
      _$InsuranceModelImpl.fromJson;

  @override
  String get provider;
  @override
  List<String> get hospitals;
  @override
  @JsonKey(ignore: true)
  _$$InsuranceModelImplCopyWith<_$InsuranceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
