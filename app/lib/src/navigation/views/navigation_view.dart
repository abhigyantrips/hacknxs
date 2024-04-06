import 'dart:ui';

import 'package:flutter/material.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final List<Widget> _views = <Widget>[
    const Center(
      child: Text('Documents View'),
    ),
    const Center(
      child: Text('Permissions View'),
    ),
    const Center(
      child: Text('Hospitals View'),
    ),
  ];
  PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: AppBar(
                backgroundColor: colorScheme.background.withOpacity(0.6),
                title: Text(
                  'HealthSync',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
      body: PageView(
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        onPageChanged: ((index) {
          setState(() {
            _selectedIndex = index;
          });
        }),
        children: _views,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: ((index) {
          _pageController.jumpToPage(index);
        }),
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            label: 'Documents',
            selectedIcon: Icon(Icons.description),
          ),
          NavigationDestination(
            icon: Icon(Icons.key_outlined),
            label: 'Permissions',
            selectedIcon: Icon(Icons.key),
          ),
          NavigationDestination(
            icon: Icon(Icons.local_hospital_outlined),
            label: 'Hospitals',
            selectedIcon: Icon(Icons.local_hospital),
          ),
        ],
        elevation: 0.0,
        backgroundColor: colorScheme.background.withOpacity(0.6),
      ),
    );
  }
}
