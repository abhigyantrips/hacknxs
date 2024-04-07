import 'dart:convert';

import 'package:app/src/hospitals/models/hospital_model.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hospitals_controller.g.dart';

@riverpod
class Hospitals extends _$Hospitals {
  @override
  Future<List<HospitalModel>> build() async {
    return await getHospitals();
  }

  Future<List<HospitalModel>> getHospitals() async {
    var url = Uri.parse(
      'https://api.alphaspiderman.dev/info/hospital',
    );

    Response response = await get(url);

    if (response.statusCode == 200) {
      return List<HospitalModel>.from(json
          .decode(response.body.toString())
          .map((x) => HospitalModel.fromJson(x)));
    } else {
      return [];
    }
  }
}
