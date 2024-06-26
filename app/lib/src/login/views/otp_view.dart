import 'package:flutter/material.dart';

import 'package:app/src/navigation/views/navigation_view.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Image.asset(
                    'assets/aadhaar-logo.png',
                    fit: BoxFit.fill,
                    height: 128,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(64.0),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(24, 18, 24, 18),
                              labelText: 'One Time Password',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      IconButton.outlined(
                        icon: Icon(
                          Icons.navigate_next,
                          size: 48,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const NavigationView(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: Image.asset(
          'assets/splash-branding.png',
          height: 84,
        ),
      ),
    );
  }
}
