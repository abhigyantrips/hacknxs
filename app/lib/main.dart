import 'package:flutter/material.dart';

void main() {
  runApp(const HealthSync());
}

class HealthSync extends StatelessWidget {
  const HealthSync({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthSync',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Center(child: Text('LESGO')),
    );
  }
}
