import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msgapp/common/next_screen_button.dart';
import 'package:msgapp/common/resend_otp_button.dart';
import 'package:msgapp/screens/main_chat_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Declaring timer & it's value
  late Timer timer;
  int remaining = 120;

  // /----- Timer workings
  @override
  void initState() {
    super.initState();
    start();
  }

  void start() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          remaining--;
        });
      }
    });
  }

  String timing(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }
  // Timer workings -----/

  @override
  Widget build(BuildContext context) {
    // Responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Verify button workings
    void verify() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ChatHomeScreen()),
        (route) => false,
      );
    }

    // Back button & Resend otp button workings
    void resendotp() {
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Colors.black,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.black,

        // Back icon
        leading: IconButton(
          onPressed: resendotp,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white70,
            size: width * 0.06,
          ),
        ),

        // Title
        title: Text(
          'Verify phone number',
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.055,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            SizedBox(
              width: width * 0.25,
              height: width * 0.25,
              child: Image.asset('lib/assets/images/security.png'),
            ),

            // Info
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.04,
                bottom: height * 0.015,
              ),
              child: Text(
                '4-digits Code sent to your phone number.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: width * 0.038),
              ),
            ),

            // OTP input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.25),
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.06,
                  letterSpacing: width * 0.05,
                  fontWeight: FontWeight.w500,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: '* * * *',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.045,
                    letterSpacing: width * 0.02,
                  ),
                ),
              ),
            ),

            // Timer
            Padding(
              padding: EdgeInsets.only(top: height * 0.025),
              child: Text(
                'Code expires in ${timing(remaining)}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: width * 0.04),
              ),
            ),

            // Resend otp Button
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.015,
                bottom: height * 0.03,
              ),
              child: CustomButton2(title: 'Resend OTP', onPressed: resendotp),
            ),

            // Verify Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: CustomButton(title: 'Verify', onPressed: verify),
            ),
          ],
        ),
      ),
    );
  }
}
