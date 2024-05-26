import 'package:application_project/auth.dart';
import 'package:application_project/constant/colors.dart';
import 'package:application_project/createEvent.dart';
import 'package:application_project/database.dart';
import 'package:application_project/login.dart';
import 'package:application_project/saved_data.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List<Document> events = [];
  @override
  void initState() {
    refresh();
    super.initState();
  }

  void refresh() {
    getAllEvents().then((value) {
      events = value;
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              LogoutUser();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => login_page()));
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text("Hi user 👋",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'inter')),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                        leading: Text(
                          "${index + 1}",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        title: Text(
                          events[index].data["name"],
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        subtitle: Text(
                          events[index].data["Location"],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                  childCount: events.length))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => creatEvent_page()));
          refresh();
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
