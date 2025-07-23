import 'package:flutter/material.dart';
import 'package:msgapp/screens/call_screen.dart';
import 'package:msgapp/screens/video_call_screen.dart';

class ContactInfoScreen extends StatelessWidget {
  final String userName;

  const ContactInfoScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    // Responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // User options list
    final List<Map<String, dynamic>> userInfoList = [
      {
        'icon': Icons.info_outline_rounded,
        'text': 'Busy',
        'color': Colors.white,
      },
      {
        'icon': Icons.photo_size_select_actual_rounded,
        'text': 'Media, links and docs',
      },
      {
        'icon': Icons.notifications_none_rounded,
        'text': 'Notifications',
        'color': Colors.white,
      },
      {
        'icon': Icons.save_alt_rounded,
        'text': 'Save to Photos',
        'color': Colors.white,
      },
      {
        'icon': Icons.lock_person_rounded,
        'text': 'Lock chat',
        'color': Colors.white,
      },
      {
        'icon': Icons.privacy_tip_rounded,
        'text': 'Advanced chat privacy',
        'color': Colors.white,
      },
      {
        'icon': Icons.enhanced_encryption_rounded,
        'text': 'Encryption',
        'color': Colors.white,
      },
      {
        'icon': Icons.ios_share_rounded,
        'text': 'Share contact',
        'color': Colors.deepPurpleAccent.shade100,
      },
      {
        'icon': Icons.favorite_border_rounded,
        'text': 'Add to Favourite',
        'color': Colors.deepPurpleAccent.shade100,
      },
      {
        'icon': Icons.delete_outline_rounded,
        'text': 'Clear chat',
        'color': Colors.redAccent,
      },
      {
        'icon': Icons.block_rounded,
        'text': 'Block $userName',
        'color': Colors.redAccent,
      },
      {
        'icon': Icons.report_rounded,
        'text': 'Report $userName',
        'color': Colors.redAccent,
      },
    ];

    // Back button
    void back() {
      Navigator.pop(context);
    }

    // Voice call button working
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

    return Scaffold(
      backgroundColor: Colors.black,

      // App bar
      appBar: AppBar(
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
        // Contact info text
        title: Text(
          'Contact info',
          style: TextStyle(color: Colors.white, fontSize: width * 0.055),
        ),

        // Edit icon
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: Icon(
              Icons.edit_rounded,
              size: width * 0.06,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // Body
      body: Column(
        children: [
          // Profile photo
          Icon(
            Icons.account_circle_rounded,
            size: width * 0.3,
            color: Colors.grey,
          ),
          SizedBox(height: height * 0.015),

          // Contact name
          Text(
            userName,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.07,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.008),

          // Contact number
          Text(
            '+91 65 * * *   * * * 96',
            style: TextStyle(color: Colors.grey, fontSize: width * 0.05),
          ),
          SizedBox(height: height * 0.02),

          // Voice call and Video call buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: voicecall,
                      icon: Icon(
                        Icons.call_outlined,
                        size: width * 0.07,
                        color: Colors.deepPurpleAccent.shade100,
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: videocall,
                      icon: Icon(
                        Icons.videocam_outlined,
                        size: width * 0.08,
                        color: Colors.deepPurpleAccent.shade100,
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),

          // Options list
          Expanded(
            child: ListView.builder(
              itemCount: userInfoList.length,
              itemBuilder: (context, index) {
                final item = userInfoList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.005,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.014,
                      horizontal: width * 0.035,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          item['icon'],
                          color: item['color'] ?? Colors.white,
                          size: width * 0.06,
                        ),
                        SizedBox(width: width * 0.04),
                        Text(
                          item['text'],
                          style: TextStyle(
                            color: item['color'] ?? Colors.white,
                            fontSize: width * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
