import 'dart:io';

import 'package:application_project/auth.dart';
import 'package:application_project/constant/custome_input.dart';
import 'package:application_project/containers/custome_input_form.dart';
import 'package:application_project/database.dart';
import 'package:application_project/saved_data.dart';
import 'package:appwrite/appwrite.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'dart:typed_data';

class creatEvent_page extends StatefulWidget {
  const creatEvent_page({Key? key});

  @override
  State<creatEvent_page> createState() => _creatEvent_pageState();
}

class _creatEvent_pageState extends State<creatEvent_page>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  FilePickerResult? _filePickerResult;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _guestController = TextEditingController();
  final TextEditingController _sponsersController = TextEditingController();

  Storage storage = Storage(client);
  bool isUploading = false;
  String useraId = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    useraId = SavedData.getUserId();
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDateTime.year,
          pickedDateTime.month,
          pickedDateTime.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          _dateTimeController.text = selectedDateTime.toString();
        });
      }
    }
  }

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _filePickerResult = result;
      });
    } else {
      print("File picking canceled or failed.");
    }
  }

  Future uploadEventImage() async {
    setState(() {
      isUploading = true;
    });
    try {
      if (_filePickerResult != null && _filePickerResult!.files.isNotEmpty) {
        PlatformFile file = _filePickerResult!.files.first;
        final inputFile = InputFile.fromBytes(
          bytes: file.bytes!,
          filename: file.name,
        );
        final response = await storage.createFile(
            bucketId: '664b7e8e00271c7d3e98',
            fileId: ID.unique(),
            file: inputFile);
        print(response.$id);
        return response.$id;
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 0, 29),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              CustomeHeadText(text: "Create Event"),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () => _openFilePicker(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _filePickerResult != null &&
                          _filePickerResult!.files.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            _filePickerResult!.files.first.bytes!,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 42,
                              color: Colors.black,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Add Event Image",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              CustomInputForm(
                controller: _nameController,
                icon: Icons.event_outlined,
                label: "Event Name",
                hint: "Add Event Name",
              ),
              SizedBox(
                height: 8,
              ),
              CustomInputForm(
                maxLines: 4,
                controller: _descController,
                icon: Icons.description_outlined,
                label: "Description",
                hint: "Add Description",
              ),
              SizedBox(
                height: 8,
              ),
              CustomInputForm(
                controller: _locationController,
                icon: Icons.location_on_outlined,
                label: "Location",
                hint: "Enter the location of Event",
              ),
              SizedBox(
                height: 8,
              ),
              CustomInputForm(
                controller: _guestController,
                icon: Icons.people_outline,
                label: "Gustes",
                hint: "Enter Gustes",
              ),
              SizedBox(
                height: 8,
              ),
              CustomInputForm(
                controller: _dateTimeController,
                icon: Icons.date_range_outlined,
                label: "Date & Time ",
                hint: "Pickup Date Time",
                readOnly: true,
                onTap: () => _selectDateTime(context),
              ),
              SizedBox(
                height: 8,
              ),
              CustomInputForm(
                controller: _sponsersController,
                icon: Icons.attach_money_outlined,
                label: "Sponsers",
                hint: "Enter the sponsers of Event",
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.white,
                  onPressed: () {
                    if (_nameController.text == "" ||
                        _descController.text == "" ||
                        _locationController.text == "" ||
                        _dateTimeController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Event name,Description,location ,Date and time are must",
                          ),
                        ),
                      );
                    } else {
                      uploadEventImage().then((value) {
                        if (value != null) {
                          createEnvent(
                            _nameController.text,
                            _descController.text,
                            value,
                            _locationController.text,
                            _dateTimeController.text,
                            useraId,
                            _guestController.text,
                            _sponsersController.text,
                          ).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Event Created !!")),
                            );
                            Navigator.pop(context);
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Failed to upload event image")),
                          );
                        }
                      });
                    }
                  },
                  child: Text(
                    "Create New Event",
                    style: TextStyle(
                      fontFamily: 'inter',
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
