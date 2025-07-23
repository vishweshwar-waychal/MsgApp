import 'package:flutter/material.dart';
import 'package:msgapp/screens/contact_chat_screen.dart';

class VideoCallScreen extends StatefulWidget {
  final String userName;

  const VideoCallScreen({super.key, required this.userName});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {

  bool isClickedVideo = false;
  bool isClickedAudio = false;
  bool isClickedSpeaker = false;

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
          onPressed: back,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: width * 0.06,
            color: Colors.white70,
          ),
        ),
        title: Text(
          widget.userName,
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.05,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: Text(
              'Online',
              style: TextStyle(
                color: Colors.deepPurpleAccent.shade100,
                fontSize: width * 0.035,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: height * 0.08),
                Icon(
                  Icons.account_circle_rounded,
                  size: width * 0.4,
                  color: Colors.grey,
                ),
                Text(
                  'Connecting...',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.05,
                  ),
                ),
              ],
            ),

            // Bottom Buttons
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Video Button
                  Container(
                    width: width * 0.18,
                    height: width * 0.18,
                    decoration: BoxDecoration(
                      color: isClickedVideo ? Colors.white : Colors.white30,
                      borderRadius: BorderRadius.circular(width * 0.09),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isClickedVideo = !isClickedVideo;
                        });
                      },
                      icon: Icon(
                        isClickedVideo ? Icons.videocam_rounded : Icons.videocam_off_rounded,
                        size: width * 0.1,
                        color: isClickedVideo ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.04),

                  // Mic Button
                  Container(
                    width: width * 0.18,
                    height: width * 0.18,
                    decoration: BoxDecoration(
                      color: isClickedAudio ? Colors.white : Colors.white30,
                      borderRadius: BorderRadius.circular(width * 0.09),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isClickedAudio = !isClickedAudio;
                        });
                      },
                      icon: Icon(
                        isClickedAudio ? Icons.mic_rounded : Icons.mic_off_rounded,
                        size: width * 0.1,
                        color: isClickedAudio ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.04),

                  // Speaker Button
                  Container(
                    width: width * 0.18,
                    height: width * 0.18,
                    decoration: BoxDecoration(
                      color: isClickedSpeaker ? Colors.white : Colors.white30,
                      borderRadius: BorderRadius.circular(width * 0.09),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isClickedSpeaker = !isClickedSpeaker;
                        });
                      },
                      icon: Icon(
                        Icons.volume_up_rounded,
                        size: width * 0.1,
                        color: isClickedSpeaker ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.04),

                  // End Call Button
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
          ],
        ),
      ),
    );
  }
}
