import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:app/src/documents/views/documents_view.dart';
import 'package:app/src/hospitals/views/hospitals_view.dart';
import 'package:app/src/navigation/components/keep_alive_page.dart';
import 'package:app/src/permissions/views/permissions_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final List<Widget> _views = <Widget>[
    KeepAlivePage(
      child: EventsView(),
    ),
    KeepAlivePage(
      child: HospitalsView(),
    ),
    KeepAlivePage(
      child: PermissionsView(),
    ),
  ];
  PageController _pageController = PageController(initialPage: 1);
  int _selectedIndex = 1;

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
                title: Image.asset(
                  'assets/splash-branding.png',
                  height: 68,
                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  )
                ],
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
            icon: Icon(Icons.local_hospital_outlined),
            label: 'Hospitals',
            selectedIcon: Icon(Icons.local_hospital),
          ),
          NavigationDestination(
            icon: Icon(Icons.key_outlined),
            label: 'Permissions',
            selectedIcon: Icon(Icons.key),
          ),
        ],
        elevation: 0.0,
      ),
    );
  }
}
