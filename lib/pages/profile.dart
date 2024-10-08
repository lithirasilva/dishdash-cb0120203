import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import to use File
import '../components/editcard.dart'; // Import the EditCard widget

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Dummy user data (replace with actual data from your app's state management or API)
  String userName = 'John Doe';
  String userEmail = 'johndoe@example.com';
  String userPhone = '+1 (555) 123-4567';
  String userLocation = '123 Main St, City, Sri Lanka'; // Replace with actual user location
  String userImageUrl = 'images/dp.jpg'; // Replace with actual image URL
  XFile? _image; // To store the selected image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface, // Background color of the page
      appBar: AppBar(
        title: const Text('Profile'), // Title of the app bar
        automaticallyImplyLeading: false, // Remove back icon
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding around the child widget
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the child widget
              children: [
                CircleAvatar(
                  radius: 60, // Radius of the circular avatar
                  backgroundImage: _image != null 
                    ? FileImage(File(_image!.path)) 
                    : AssetImage(userImageUrl) as ImageProvider<Object>, // Use AssetImage for the default image
                ),
              ],
            ),
          ),
          // Button to edit profile picture
          Center(
            child: ElevatedButton(
              onPressed: _pickImage, // Trigger the image picker
              child: const Text('Edit Profile Picture'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding around the child widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
              children: [
                const Text(
                  'Name:', // Label for the user's name
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userName, // Display the user's name
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 12.0), // Space between the widgets
                const Text(
                  'Email:', // Label for the user's email
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userEmail, // Display the user's email
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 12.0), // Space between the widgets
                const Text(
                  'Phone:', // Label for the user's phone number
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userPhone, // Display the user's phone number
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 12.0), // Space between the widgets
                const Text(
                  'Location:', // Label for the user's location
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userLocation, // Display the user's location
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0), // Space between the widgets
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding around the child widget
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Space the children evenly
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showEditProfileDialog(context); // Show the edit profile dialog
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.surface, // Button text color
                    backgroundColor: Theme.of(context).colorScheme.secondary, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Padding inside the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(120), // Rounded corners for the button
                    ),
                  ),
                  child: Text(
                    'Edit', // Button text
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface, // Button text color
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add logout functionality
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.surface, // Button text color
                    backgroundColor: Theme.of(context).colorScheme.secondary, // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12), // Padding inside the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(120), // Rounded corners for the button
                    ),
                  ),
                  child: Text(
                    'Logout', // Button text
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface, // Button text color
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

  // Method to show the edit profile dialog
  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditCard(
          initialName: userName, // Initial user name
          initialEmail: userEmail, // Initial user email
          initialPhone: userPhone, // Initial user phone number
          initialLocation: userLocation, // Initial user location
          onSave: (String newName, String newEmail, String newPhone, String newLocation) {
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

  // Method to pick an image
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    image ??= await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image; // Update the state with the selected image
    });
  }
}
