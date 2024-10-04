import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'Sophia');
  final TextEditingController _phoneController = TextEditingController(text: '9876543210');
  final TextEditingController _emailController = TextEditingController(text: 'Sophiadeny@gmail.com');
  final TextEditingController _weightController = TextEditingController(text: '55');
  final TextEditingController _heightController = TextEditingController(text: '170');
  final TextEditingController _ageController = TextEditingController(text: '21');
  bool isKg = true;
  bool isCm = true;
  String gender = 'Female';
   File? _image;
  final picker = ImagePicker();
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Show options to get image from camera or gallery
  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: _image == null ? const Icon(Icons.person, size: 50) : Image.file(_image!),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () {
                        showOptions();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                filled:  true,
                fillColor: const Color(0xffF5F5F5),
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                filled:  true,
                fillColor: const Color(0xffF5F5F5),
                labelText: 'Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email address',
                filled:  true,
                fillColor: const Color(0xffF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 55.0,
              width: double.infinity,
              child: TextField(
                controller: _weightController,
                decoration: InputDecoration(
                  labelText: 'Weight',
                  filled:  true,
                  fillColor: const Color(0xffF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  suffix: ToggleButtons(
                    borderRadius: BorderRadius.circular(12.0),
                    isSelected: [!isKg, isKg],
                    onPressed: (index) {
                      setState(() {
                        isKg = index == 1;
                      });
                    },
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                            'LBS',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                            'KG',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 55.0,
              width: double.infinity,
              child: TextField(
                controller: _heightController,
                decoration: InputDecoration(
                  filled:  true,
                  fillColor: const Color(0xffF5F5F5),
                  labelText: 'Height',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  suffix: ToggleButtons(
                    //fillColor:Colors.orange ,
                    // color: Colors.orange,
                    focusColor: Colors.orange,
                    borderRadius: BorderRadius.circular(12.0),
                    isSelected: [!isCm, isCm],
                    onPressed: (index) {
                      setState(() {
                        isCm = index == 1;
                      });
                    },
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                            'FEET',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                            'CM',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            // Container(
            //   height: 60.0,
            //   width: double.infinity,
            //   child: TextField(
            //     controller: _heightController,
            //     decoration: InputDecoration(
            //       labelText: 'Height',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12.0),
            //       ),
            //       suffix: ToggleButtons(
            //         borderRadius: BorderRadius.circular(12.0),
            //         isSelected: [!isCm, isCm],
            //         onPressed: (index) {
            //           setState(() {
            //             isCm = index == 1;
            //           });
            //         },
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //             child: Text('FEET'),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //             child: Text('CM'),
            //           ),
            //         ],
            //       ),
            //     ),
            //     keyboardType: TextInputType.number,
            //   ),
            // ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Gender',
                filled:  true,
                fillColor: const Color(0xffF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              value: gender,
              items: const [
                DropdownMenuItem(
                  value: 'Female',
                  child: Text('Female'),
                ),
                DropdownMenuItem(
                  value: 'Male',
                  child: Text('Male'),
                ),
                // Add more items as needed
              ],
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
                filled:  true,
                fillColor: const Color(0xffF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                    0xffB0C929
                ),
              ),
              onPressed: () {
                // Handle save action
              },
              child: const Text(
                  'SAVE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}