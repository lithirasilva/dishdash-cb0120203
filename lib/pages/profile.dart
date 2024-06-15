import 'package:flutter/material.dart';
import '../components/editcard.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Dummy user data (replace with actual data from your app's state management or API)
  String userName = 'John Doe';
  String userEmail = 'johndoe@example.com';
  String userPhone = '+1 (555) 123-4567';
  String userLocation =
      '123 Main St, City, Sri Lanka'; // Replace with actual user location
  String userImageUrl = 'images/dp.jpg'; // Replace with actual image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false, // Remove back icon
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(userImageUrl),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userName,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 12.0),
                const Text(
                  'Email:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userEmail,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 12.0),
                const Text(
                  'Phone:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userPhone,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 12.0),
                const Text(
                  'Location:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userLocation,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showEditProfileDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    backgroundColor:
                        Theme.of(context).colorScheme.secondary, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(120),
                    ),
                  ),
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add logout functionality
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.surface,
                    backgroundColor:
                        Theme.of(context).colorScheme.secondary, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(120),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditCard(
          initialName: userName,
          initialEmail: userEmail,
          initialPhone: userPhone,
          initialLocation: userLocation,
          onSave: (String newName, String newEmail, String newPhone,
              String newLocation) {
            setState(() {
              // Update user data with new values
              userName = newName;
              userEmail = newEmail;
              userPhone = newPhone;
              userLocation = newLocation;
            });
          },
          buttonColor: Colors.blue, // Pass the desired button color
          buttonTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.surface, // Button text color
          ),
        );
      },
    );
  }
}
