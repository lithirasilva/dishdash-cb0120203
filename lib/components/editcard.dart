import 'package:flutter/material.dart';

class EditCard extends StatefulWidget {
  final String initialName;
  final String initialEmail;
  final String initialPhone;
  final String initialLocation;
  final Function(String, String, String, String) onSave;
  final Color buttonColor; // Color for the buttons
  final TextStyle buttonTextStyle; // Text style for the buttons

  const EditCard({
    Key? key,
    required this.initialName,
    required this.initialEmail,
    required this.initialPhone,
    required this.initialLocation,
    required this.onSave,
    required this.buttonColor,
    required this.buttonTextStyle,
  }) : super(key: key);

  @override
  _EditCardState createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with the initial values provided by the widget
    nameController = TextEditingController(text: widget.initialName);
    emailController = TextEditingController(text: widget.initialEmail);
    phoneController = TextEditingController(text: widget.initialPhone);
    locationController = TextEditingController(text: widget.initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Profile'), // Dialog title
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Ensure the column only takes the necessary space
          children: [
            TextField(
              controller: nameController, // Controller for the name input field
              decoration:
                  InputDecoration(labelText: 'Name'), // Input decoration
            ),
            TextField(
              controller:
                  emailController, // Controller for the email input field
              decoration:
                  InputDecoration(labelText: 'Email'), // Input decoration
            ),
            TextField(
              controller:
                  phoneController, // Controller for the phone input field
              decoration:
                  InputDecoration(labelText: 'Phone'), // Input decoration
            ),
            TextField(
              controller:
                  locationController, // Controller for the location input field
              decoration:
                  InputDecoration(labelText: 'Location'), // Input decoration
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog on cancel
          },
          child: Text('Cancel'), // Cancel button text
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(
              nameController
                  .text, // Pass the updated name to the onSave callback
              emailController
                  .text, // Pass the updated email to the onSave callback
              phoneController
                  .text, // Pass the updated phone to the onSave callback
              locationController
                  .text, // Pass the updated location to the onSave callback
            );
            Navigator.of(context).pop(); // Close the dialog on save
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                widget.buttonColor, // Use the provided button color
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(120), // Rounded button corners
            ),
          ),
          child: Text(
            'Save',
            style: widget
                .buttonTextStyle, // Apply the provided text style to the button
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Dispose of the text controllers when the widget is disposed
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
