import 'package:flutter/material.dart';
import 'package:msgapp/screens/call_screen.dart';
import 'package:msgapp/screens/contact_info_screen.dart';
import 'package:msgapp/screens/video_call_screen.dart';

class ContactChatScreen extends StatelessWidget {
  final String userName;

  const ContactChatScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    // Responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Back button working
    void back() {
      Navigator.pop(context);
    }

    // Call button working
    void voicecall() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallingScreen(userName: userName),
        ),
      );
    }

    // Video call button working
    void videocall() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoCallScreen(userName: userName),
        ),
      );
    }

    // User details button working
    void userinfo() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContactInfoScreen(userName: userName),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,

      // AppBar
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.black,

        // Back button
        leading: IconButton(
          onPressed: back,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white70,
            size: width * 0.06,
          ),
        ),

        // User Details button
        title: TextButton(
          onPressed: userinfo,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.01),
                child: Icon(
                  Icons.account_circle_rounded,
                  size: width * 0.11,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: width * 0.02),
              Expanded(
                child: Text(
                  userName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.045,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Video call and voice call buttons
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: videocall,
                icon: Icon(
                  Icons.videocam_outlined,
                  color: Colors.white,
                  size: width * 0.06,
                ),
              ),
              IconButton(
                onPressed: voicecall,
                icon: Icon(
                  Icons.add_ic_call_rounded,
                  color: Colors.white,
                  size: width * 0.06,
                ),
              ),
            ],
          ),
        ],
      ),

      // Chat Body
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(width * 0.025),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(width * 0.02),
                    margin: EdgeInsets.only(bottom: width * 0.025),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(width * 0.01),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_rounded,
                          size: width * 0.04,
                          color: Color(0xFFFFD279),
                        ),
                        SizedBox(width: width * 0.02),
                        Flexible(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Messages and calls are end-to-end encrypted. No one outside of this chat, not even MsgApp, can read or listen to them.',
                            style: TextStyle(
                              color: Color(0xFFFFD279),
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Messages to left
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: width * 0.75),
                      padding: EdgeInsets.symmetric(
                        vertical: width * 0.03,
                        horizontal: width * 0.045,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: width * 0.015,
                        horizontal: width * 0.025,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width * 0.05),
                          topRight: Radius.circular(width * 0.05),
                          bottomRight: Radius.circular(width * 0.05),
                        ),
                      ),
                      child: Text(
                        'Hello, Vishweshwar!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),

                // Messages to right
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: width * 0.75),
                      padding: EdgeInsets.symmetric(
                        vertical: width * 0.03,
                        horizontal: width * 0.045,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: width * 0.015,
                        horizontal: width * 0.025,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width * 0.05),
                          topRight: Radius.circular(width * 0.05),
                          bottomLeft: Radius.circular(width * 0.05),
                        ),
                      ),
                      child: Text(
                        'Hi, ${userName.split(" ")[0]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom bar
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.025,
              vertical: height * 0.015,
            ),
            color: Colors.black,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(width * 0.06),
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.045,
                      ),
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_voice_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
