import 'package:flutter/material.dart';

import 'package:app/src/login/views/aadhaar_view.dart';
import 'package:app/themes.dart';

class HealthSync extends StatelessWidget {
  const HealthSync({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealthSync',
      theme: lightTheme,
      home: const AadhaarView(),
    );
  }
}
