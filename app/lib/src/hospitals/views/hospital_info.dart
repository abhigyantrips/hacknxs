import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:app/src/hospitals/models/hospital_model.dart';

class HospitalInfo extends StatelessWidget {
  const HospitalInfo({super.key, required this.hospital});

  final HospitalModel hospital;

  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: AppBar(
                backgroundColor: colorScheme.background.withOpacity(0.6),
                title: Image.asset(
                  'assets/splash-branding.png',
                  height: 68,
                ),
                centerTitle: true,
                elevation: 0.0,
                scrolledUnderElevation: 0.0,
              ),
            ),
          ),
        ),
        preferredSize: const Size(double.infinity, 65.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/hospital.jpg'),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 20, 14, 10),
              child: Text(
                hospital.hospitalName,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 20),
              child: Text(
                'Welcome to ${hospital.hospitalName}, where cutting-edge care meets compassionate service. Our dedicated team ensures premium treatment across specialties, prioritizing patient well-being and satisfaction. Trust us for excellence in healthcare.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.local_hospital, size: 24.0),
                      ),
                      Expanded(
                        child: Text(
                          hospital.address,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.people, size: 24.0),
                      ),
                      Text('${hospital.doctors.length.toString()} doctors'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                surfaceTintColor: Colors.green.shade400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              child: Text(
                                'Insurance is compatible!',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              child: Expanded(
                                child: Text(
                                  'Your insurance from Apollo Healthcare Ltd. can be utilized in this hospital.',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 16.0),
                        child: Icon(
                          Icons.military_tech,
                          size: 64,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
