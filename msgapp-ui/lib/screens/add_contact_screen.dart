import 'package:flutter/material.dart';

class NewContactScreen extends StatelessWidget {
  const NewContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Options info
    final List<Map<String, dynamic>> userList = [
      {'icon': Icons.person_add_rounded, 'text': 'New contact'},
      {'icon': Icons.group_rounded, 'text': 'New group'},
      {'icon': Icons.groups_rounded, 'text': 'New community'},
      {'icon': Icons.campaign_rounded, 'text': 'New broadcast'},
    ];

    // Back button working
    void back() {
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Back icon
        leading: IconButton(
          onPressed: back,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white70,
            size: width * 0.06,
          ),
        ),
        // New chat text
        title: Text(
          'New chat',
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Options List
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final item = userList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.005,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.015,
                      horizontal: width * 0.035,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    child: Row(
                      children: [
                        // Icon
                        Icon(
                          item['icon'],
                          color: Colors.deepPurpleAccent.shade100,
                          size: width * 0.06,
                        ),
                        // Gap between options
                        SizedBox(width: width * 0.04),
                        // Options names
                        Text(
                          item['text'],
                          style: TextStyle(
                            color: Colors.white,
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
