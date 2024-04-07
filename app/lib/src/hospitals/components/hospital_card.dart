import 'package:flutter/material.dart';

import 'package:app/src/hospitals/models/hospital_model.dart';
import 'package:app/src/hospitals/views/hospital_info.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HospitalCard extends StatefulWidget {
  const HospitalCard({super.key, required this.hospital});

  final HospitalModel hospital;

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => HospitalInfo(hospital: widget.hospital)),
            ),
          );
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(0),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.hospital.hospitalName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 0.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 4.0),
                              child: Icon(Icons.local_hospital, size: 18.0),
                            ),
                            Expanded(
                              child: Text(
                                widget.hospital.address,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 4.0),
                              child: Icon(Icons.people, size: 18.0),
                            ),
                            Text(
                                '${widget.hospital.doctors.length.toString()} doctors'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  RatingBarIndicator(
                    rating: widget.hospital.rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.green.shade900,
                    ),
                    itemCount: 5,
                    itemSize: 24.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
