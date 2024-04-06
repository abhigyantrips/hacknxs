// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:app/nav_bar/views/navbar_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationView(
        onTabChange: ,
      ),
    );
  }
}
