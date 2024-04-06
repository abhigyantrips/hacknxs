// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:app/home_page/views/home_page.dart';

class NavigationView extends StatefulWidget {
  const NavigationView(
      {super.key, required void Function(dynamic index) onTabChange});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final List<Widget> _views = <Widget>[
    const Center(
      child: Text("placeholder"),
    ),
    HomePage(),
  ];
  PageController _pageController = PageController(initialPage: 1);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: AppBar(
                backgroundColor: colorScheme.background.withOpacity(0.6),
                title: Image.asset(
                  colorScheme.brightness == Brightness.dark
                      ? 'assets/noticeboard/logo-dark.png'
                      : 'assets/noticeboard/logo-light.png',
                  width: 160,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    icon: Icon(
                      Icons.tune,
                      weight: 200,
                      color: colorScheme.onBackground,
                    ),
                  ),
                ],
                elevation: 0.0,
                scrolledUnderElevation: 0.0,
              ),
            ),
          ),
        ),
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
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: ((index) {
              _pageController.jumpToPage(index);
            }),
            destinations: <NavigationDestination>[
              NavigationDestination(
                icon: Icon(Icons.edit_document),
                label: 'Issued',
                selectedIcon: Icon(Icons.edit_document),
              ),
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
                selectedIcon: Icon(Icons.home),
              ),
              NavigationDestination(
                icon: Icon(Icons.menu),
                label: 'Menu',
                selectedIcon: Icon(Icons.menu),
              ),
            ],
            elevation: 0.0,
            backgroundColor: colorScheme.background.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
