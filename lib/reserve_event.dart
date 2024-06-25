import 'package:application_project/createEventdetail.dart';
import 'package:application_project/database.dart';
import 'package:application_project/saved_data.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class Reserve_Event extends StatefulWidget {
  const Reserve_Event({super.key});

  @override
  State<Reserve_Event> createState() => _Reserve_EventState();
}

class _Reserve_EventState extends State<Reserve_Event> {
  List<Document> events = [];
  List<Document> userEvents = [];
  bool isLoading = true;

  @override
  void initState() {
    refresh();
    super.initState();
  }

  void refresh() {
    String userId = SavedData.getUserId();
    getAllEvents().then((value) {
      events = value;
      setState(() {});
      for (var event in events) {
        List<dynamic> participant = event.data["participant"];

        if (participant.contains(userId)) {
          userEvents.add(event);
        }
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 0, 29),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Reserved Events",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: userEvents.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EventDetails(data: userEvents[index]))),
            title: Text(
              userEvents[index].data["Name"],
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              userEvents[index].data["Location"],
              style: TextStyle(color: Colors.black),
            ),
            trailing: Icon(
              Icons.check_circle,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
