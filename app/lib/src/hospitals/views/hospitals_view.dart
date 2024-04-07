import 'package:flutter/material.dart';

import 'package:app/src/hospitals/components/hospital_list.dart';
import 'package:app/src/hospitals/controllers/hospitals_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HospitalsView extends ConsumerWidget {
  const HospitalsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hospitals = ref.watch(hospitalsProvider);

    return hospitals.when(
      data: (data) => HospitalList(hospitals: data),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) {
        print(error.toString());
        return Center(
          child: Text('Contributors could not be fetched.'),
        );
      },
    );
  }
}
