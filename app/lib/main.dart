import 'package:flutter/material.dart';

import 'package:app/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(List<String> args) async {
  runApp(const ProviderScope(child: HealthSync()));
}
