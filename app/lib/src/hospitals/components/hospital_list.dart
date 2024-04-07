import 'package:flutter/material.dart';

import 'package:app/src/hospitals/components/hospital_card.dart';
import 'package:app/src/hospitals/models/hospital_model.dart';

class HospitalList extends StatelessWidget {
  final List<HospitalModel>? hospitals;

  const HospitalList({super.key, required this.hospitals});

  @override
  Widget build(BuildContext context) {
    if (hospitals!.isEmpty) {
      return const Center(
        child: Text('There are no hospitals near you.'),
      );
    }

    return ListView.builder(
      itemCount: hospitals!.length,
      itemBuilder: (context, index) {
        return HospitalCard(hospital: hospitals![index]);
      },
    );
  }
}
