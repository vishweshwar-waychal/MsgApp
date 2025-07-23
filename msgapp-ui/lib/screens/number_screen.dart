import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msgapp/common/next_screen_button.dart';
import 'package:msgapp/screens/otp_screen.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Next button working
    void next() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,

      // App Bar
      appBar: AppBar(
        backgroundColor: Colors.black,

        // Menu button
        actions: [
          PopupMenuButton<String>(
            color: Colors.grey.shade900,
            icon: Icon(
              Icons.more_vert_rounded,
              color: Colors.white70,
              size: width * 0.06,
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'help',
                child: Text(
                  'Help',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.035,
                  ),
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'help') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.grey.shade900,
                      title: Text(
                        'Help',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05,
                        ),
                      ),
                      content: Text(
                        'This is a help message.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: width * 0.035,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: width * 0.035,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
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
              child: Image.asset('lib/assets/images/user.png'),
            ),

            // Title
            Padding(
              padding: EdgeInsets.only(top: height * 0.03),
              child: Text(
                'Enter your phone number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: width * 0.065,
                  color: Colors.white,
                ),
              ),
            ),

            // Description
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.08,
                vertical: height * 0.025,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'MsgApp will need to verify your phone number. Carrier charges may apply. ',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'What is my number?',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Number Input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.14),
              child: TextField(
                // Input & style
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: width * 0.05,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],

                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width * 0.02),
                  ),

                  // Country code menu
                  prefixIcon: CountryCodePicker(
                    textStyle: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.grey,
                    ),
                    onChanged: (code) {},
                    initialSelection: '+91',
                    margin: EdgeInsets.symmetric(horizontal: width * 0.015),
                    comparator: (a, b) => b.name!.compareTo(a.name!),
                  ),

                  // Hint text
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Phone number',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: width * 0.04,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ),

            // Send Button
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.03,
                left: width * 0.08,
                right: width * 0.08,
              ),
              child: CustomButton(title: 'Next', onPressed: next),
            ),
          ],
        ),
      ),
    );
  }
}
