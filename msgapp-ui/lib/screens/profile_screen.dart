import 'package:flutter/material.dart';
import 'package:msgapp/screens/number_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    // Responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;

    // Back button working
    void back() {
      Navigator.pop(context);
    }

    // Log out button working
    void logout() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const NumberScreen()),
        (route) => false,
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Back icon button
        leading: IconButton(
          onPressed: back,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white70,
            size: width * 0.06,
          ),
        ),
        // Profile text
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.055,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Body
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              children: [
                SizedBox(height: width * 0.1),

                // Profile photo
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: width * 0.25,
                        height: width * 0.25,
                        child: Image.asset('lib/assets/images/user.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: width * 0.05),

                // Name Field
                ListTile(
                  leading: Icon(
                    Icons.person_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                  title: Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: width * 0.035,
                    ),
                  ),
                  subtitle: Text(
                    'Vishweshwar Waychal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.045,
                    ),
                  ),
                  trailing: Icon(
                    Icons.edit_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                  onTap: () {},
                ),
                SizedBox(height: width * 0.05),

                // Bio Field
                ListTile(
                  leading: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                  title: Text(
                    'Bio',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: width * 0.035,
                    ),
                  ),
                  subtitle: Text(
                    'Flutter app developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.045,
                    ),
                  ),
                  trailing: Icon(
                    Icons.edit_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                  onTap: () {},
                ),
                SizedBox(height: width * 0.05),

                // Theme appearance
                SwitchListTile(
                  value: isDark,
                  onChanged: (val) {
                    setState(() {
                      isDark = val;
                    });
                  },

                  // Switch working
                  activeColor: Colors.deepPurpleAccent.shade100,
                  inactiveTrackColor: Colors.transparent,
                  inactiveThumbColor: Colors.white,

                  // Appearance text
                  title: Text(
                    'Appearance',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: width * 0.035,
                    ),
                  ),

                  // Text change effect
                  subtitle: Text(
                    isDark ? 'Dark Mode' : 'Light Mode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.045,
                    ),
                  ),

                  // Icon change effect
                  secondary: Icon(
                    isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                    size: width * 0.06,
                  ),
                ),
              ],
            ),
          ),

          // Logout button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: width * 0.04,
            ),
            child: ListTile(
              onTap: logout,
              tileColor: Colors.transparent,
              leading: Icon(
                Icons.logout_rounded,
                color: Colors.redAccent,
                size: width * 0.06,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: width * 0.05,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
