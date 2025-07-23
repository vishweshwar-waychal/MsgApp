import 'package:flutter/material.dart';
import 'package:msgapp/screens/contact_chat_screen.dart';

class CallingScreen extends StatefulWidget {
  final String userName;

  const CallingScreen({super.key, required this.userName});

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {

  bool isClickedMic = false;
  bool isClickedSpeaker = false;
  bool isclickedRecord = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    void back() {
      Navigator.pop(
        context,
        MaterialPageRoute(builder: (context) => ContactChatScreen(userName: '')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: width * 0.06,
            color: Colors.white70,
          ),
          onPressed: back,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User Icon
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Center(
                child: Icon(
                  Icons.account_circle_rounded,
                  size: width * 0.4,
                  color: Colors.grey,
                ),
              ),
            ),
            // Username
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Text(
                widget.userName,
                style: TextStyle(color: Colors.white, fontSize: width * 0.07),
              ),
            ),
            // Calling...
            Padding(
              padding: EdgeInsets.all(width * 0.015),
              child: Center(
                child: Text(
                  'Calling...',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.05,
                  ),
                ),
              ),
            ),
            // Grid of buttons
            Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: width * 0.05,
                mainAxisSpacing: height * 0.015,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isClickedMic = !isClickedMic;
                      });
                    },
                    icon: Icon(
                      isClickedMic ? Icons.mic_rounded : Icons.mic_off_rounded,
                      size: width * 0.09,
                      color: Colors.white60,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.dialpad_rounded,
                      size: width * 0.09,
                      color: Colors.white60,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isClickedSpeaker = !isClickedSpeaker;
                      });
                    },
                    icon: Icon(
                      Icons.volume_up_rounded,
                      size: width * 0.09,
                      color: isClickedSpeaker ? Colors.deepPurpleAccent : Colors.white60,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_ic_call_rounded,
                      size: width * 0.09,
                      color: Colors.white60,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isclickedRecord = !isclickedRecord;
                      });
                    },
                    icon: Icon(
                      isclickedRecord ? Icons.radio_button_on_rounded : Icons.radio_button_off_rounded,
                      size: width * 0.09,
                      color: Colors.white60,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person_rounded,
                      size: width * 0.09,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
            // End call button
            Container(
              width: width * 0.18,
              height: width * 0.18,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(width * 0.09),
              ),
              child: IconButton(
                onPressed: back,
                icon: Icon(
                  Icons.call_end_rounded,
                  size: width * 0.1,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
