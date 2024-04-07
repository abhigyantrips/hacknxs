// dart run build_runner build

import 'package:flutter/foundation.dart';

import 'package:app/src/documents/models/file_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_model.freezed.dart';
part 'document_model.g.dart';

@freezed
class DocumentModel with _$DocumentModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DocumentModel({
    required String message,
    @Default([]) List<FileModel> files,
  }) = _DocumentModel;

  factory DocumentModel.fromJson(Map<String, Object?> json) =>
      _$DocumentModelFromJson(json);
}
