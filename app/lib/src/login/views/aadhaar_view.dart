import 'package:flutter/material.dart';

import 'package:app/src/login/views/otp_view.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class AadhaarView extends StatefulWidget {
  const AadhaarView({super.key});

  @override
  State<AadhaarView> createState() => _AadhaarViewState();
}

class _AadhaarViewState extends State<AadhaarView> {
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
                              labelText: 'Aadhaar Number',
                            ),
                            inputFormatters: [
                              CreditCardNumberInputFormatter(
                                  useSeparators: true)
                            ],
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
                              builder: (context) => const OTPView(),
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
