import 'package:application_project/createEventdetail.dart';
import 'package:application_project/database.dart';
import 'package:application_project/editEventPage.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class ManageEvent extends StatefulWidget {
  const ManageEvent({super.key});

  @override
  State<ManageEvent> createState() => _ManageEventState();
}

class _ManageEventState extends State<ManageEvent> {
  List<Document> userCreatedEvents = [];
  bool isLoading = true;

  @override
  void initState() {
    referesh();
    super.initState();
  }

  void referesh() {
    manageEvent().then((value) {
      userCreatedEvents = value;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 0, 29),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Manage Events",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: userCreatedEvents.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        EventDetails(data: userCreatedEvents[index]))),
            title: Text(
              userCreatedEvents[index].data["Name"],
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "${userCreatedEvents[index].data["participant"].length} participants",
              style: TextStyle(color: Colors.black),
            ),
            trailing: IconButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Editeventpage(
                                image: userCreatedEvents[index].data["Image"],
                                name: userCreatedEvents[index].data["Name"],
                                desc: userCreatedEvents[index]
                                    .data["Description"],
                                loc: userCreatedEvents[index].data["Location"],
                                datetime:
                                    userCreatedEvents[index].data["DateTime"],
                                gusts: userCreatedEvents[index].data["Gustes"],
                                sponser:
                                    userCreatedEvents[index].data["sponsers"],
                                docId: userCreatedEvents[index].$id,
                              )));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                )),
          ),
        ),
      ),
    );
  }
}
