import 'package:flutter/material.dart';
import 'package:msgapp/screens/add_contact_screen.dart';
import 'package:msgapp/screens/profile_screen.dart';
import 'package:msgapp/screens/contact_chat_screen.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    List<String> userNameList = [
      'Swapnil Jadhav',
      'Pooja',
      'Ganesh Shinde',
      'Aarti More',
      'Amol',
      'Neha Kamble',
      'Pravin',
      'Komal',
      'Rahul Deshmukh',
      'Vaishnavi',
      'Sachin Raut',
      'Priya',
      'Nilesh',
      'Snehal Sawant',
      'Vikas',
      'Deepali Mane',
      'Sagar',
      'Mayuri Jagtap',
      'Mahesh',
      'Kajal',
    ];

    // Messages for each user
    Map<String, String> userMessages = {
      'Swapnil Jadhav': 'Last seen today at 8:30 AM',
      'Pooja': 'Online',
      'Ganesh Shinde': 'Missed voice call at 7:45 AM',
      'Aarti More': 'Typing...',
      'Amol': 'Last seen yesterday at 11:20 PM',
      'Neha Kamble': 'Missed video call today at 9:10 AM',
      'Pravin': 'Online',
      'Komal': 'Last seen 5 minutes ago',
      'Rahul Deshmukh': 'Last seen today at 1:25 PM',
      'Vaishnavi': 'Missed call at 10:02 AM',
      'Sachin Raut': 'Online',
      'Priya': 'Last seen 20 minutes ago',
      'Nilesh': 'Typing...',
      'Snehal Sawant': 'Missed video call yesterday',
      'Vikas': 'Last seen today at 6:55 AM',
      'Deepali Mane': 'Missed voice call just now',
      'Sagar': 'Last seen 2 hours ago',
      'Mayuri Jagtap': 'Online',
      'Mahesh': 'Last seen yesterday at 8:45 PM',
      'Kajal': 'Typing...',
    };

    // add to contact button working
    void add() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewContactScreen()),
      );
    }

    // profile button working
    void profile() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      //App Bar
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.black,
        leading: PopupMenuButton<String>(
          color: Colors.grey.shade900,

          // Read chats icon
          icon: Icon(
            Icons.checklist_rtl_outlined,
            color: Colors.deepPurpleAccent.shade100,
            size: width * 0.06,
          ),
          onSelected: (value) {
            if (value == 'read') {}
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              value: 'read',
              child: Text(
                'Read all',
                style: TextStyle(color: Colors.white70, fontSize: width * 0.04),
              ),
            ),
          ],
        ),

        // Name text
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: width * 0.08,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),

        // Add & Profile buttons
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add button
                IconButton(
                  onPressed: add,
                  icon: Icon(
                    Icons.add_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                ),

                // Profile button
                IconButton(
                  onPressed: profile,
                  icon: Icon(
                    Icons.manage_accounts_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //Search
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              width * 0.04,
              height * 0.015,
              width * 0.04,
              height * 0.01,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(color: Colors.white, fontSize: width * 0.045),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // Search icon
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: width * 0.06,
                    color: Colors.grey,
                  ),
                  // Search
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: width * 0.045,
                  ),
                ),
              ),
            ),
          ),

          // Chats
          Expanded(
            child: Scrollbar(
              radius: Radius.circular(width * 0.03),
              child: ListView.builder(
                itemCount: userNameList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ContactChatScreen(userName: userNameList[index]),
                        ),
                      );
                    },
                    // Profile photo
                    leading: Icon(
                      Icons.account_circle_rounded,
                      color: Colors.grey,
                      size: width * 0.155,
                    ),
                    // User names
                    title: Text(
                      userNameList[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    // User messages
                    subtitle: Text(
                      userMessages[userNameList[index]] ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Colors.grey,
                      ),
                    ),
                    // Arrow icon
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.deepPurpleAccent.shade100,
                      size: width * 0.05,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
