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
    nameController = TextEditingController(text: widget.initialName);
    emailController = TextEditingController(text: widget.initialEmail);
    phoneController = TextEditingController(text: widget.initialPhone);
    locationController = TextEditingController(text: widget.initialLocation);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Profile'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(
              nameController.text,
              emailController.text,
              phoneController.text,
              locationController.text,
            );
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.buttonColor, // Use provided button color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(120),
            ),
          ),
          child: Text(
            'Save',
            style: widget.buttonTextStyle, // Apply provided text style
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    super.dispose();
  }
}
