import 'package:flutter/material.dart';
import 'package:msgapp/screens/number_screen.dart';
import 'package:msgapp/common/next_screen_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Agree & continue button working
    void agree() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NumberScreen()),
        (route) => false,
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,

      // App bar
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

      // Logo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Center(
                child: SizedBox(
                  width: width * 0.35,
                  height: width * 0.35,
                  child: Image.asset('lib/assets/images/logo_new.png'),
                ),
              ),
            ),

            //Coloured text span
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                      fontSize: width * 0.075,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Msg',
                    style: TextStyle(
                      fontSize: width * 0.075,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent.shade100,
                    ),
                  ),
                  TextSpan(
                    text: 'App',
                    style: TextStyle(
                      fontSize: width * 0.075,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
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
                      text: 'Read our ',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy. ',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: 'Tab "Agree & continue" to accept the ',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms of Service.',
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Button
            Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: CustomButton(
                title: 'Agree and continue',
                onPressed: agree,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
