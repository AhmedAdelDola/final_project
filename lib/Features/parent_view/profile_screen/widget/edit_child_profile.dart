import 'dart:io';

import 'package:autism_app/Core/Utils/widgets/custom_button.dart';
import 'package:autism_app/Features/auth/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditeChildProfile extends StatefulWidget {
  const EditeChildProfile({Key? key}) : super(key: key);

  @override
  _EditeChildProfileState createState() => _EditeChildProfileState();
}

class _EditeChildProfileState extends State<EditeChildProfile> {
  File? _profileImage;
  final _fullNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _dobController = TextEditingController();
  String? _selectedGender;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Maria Profile',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Video intro button
            Container(
              margin: const EdgeInsets.only(bottom: 24.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade100),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextButton.icon(
                icon: const Icon(
                  Icons.videocam,
                  color: Colors.blue,
                ),
                label: const Text(
                  'record video intro for your child',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
                onPressed: () {
                  // Handle video recording
                },
              ),
            ),

            // Profile picture upload
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(bottom: 24.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: _profileImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.file(
                                _profileImage!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Icon(
                              Icons.person_outline,
                              size: 48,
                              color: Colors.grey[400],
                            ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Upload profile picture',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Full Name field
            const Text(
              'Full Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _fullNameController,
              hintText: 'xxxxxxxxxx',
            ),
            const SizedBox(height: 16),

            // Address field
            const Text(
              'Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _addressController,
              hintText: 'where do you live?',
            ),
            const SizedBox(height: 16),

            // Date of birth field
            const Text(
              'Date of birth',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _dobController,
              hintText: 'xx/xx/xxxx',
              onTap: () async {
                // Show date picker
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    _dobController.text =
                        "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // Gender selection
            const Text(
              'Gender',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _selectedGender == 'Male',
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedGender = value! ? 'Male' : null;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const Text('Male'),
                  ],
                ),
                const SizedBox(width: 32),
                Row(
                  children: [
                    Checkbox(
                      value: _selectedGender == 'Female',
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedGender = value! ? 'Female' : null;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const Text('Female'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Save button
            CustomButton(
              ontap: () {
                print('Full Name: ${_fullNameController.text}');
                print('Address: ${_addressController.text}');
                print('Date of Birth: ${_dobController.text}');
                print('Gender: $_selectedGender');
              },
              hight: 56,
              width: 337,
              txt: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
