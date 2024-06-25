import 'package:application_project/constant/colors.dart';
import 'package:application_project/database.dart';
import 'package:application_project/date_time.dart';
import 'package:application_project/saved_data.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetails extends StatefulWidget {
  final Document data;
  const EventDetails({super.key, required this.data});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool isReserved = false;
  String id = "";
  bool isUserPresent(List<dynamic> participant, String userId) {
    return participant.contains(userId);
  }

  @override
  void initState() {
    id = SavedData.getUserId();
    isReserved = isUserPresent(widget.data.data["participant"], id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 0, 29),
      body: Column(
        children: [
          Stack(children: [
            Container(
                height: 300,
                width: double.infinity,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  child: Image.network(
                    "https://cloud.appwrite.io/v1/storage/buckets/664b7e8e00271c7d3e98/files/${widget.data.data["Image"]}/view?project=664072fa003188b94855",
                    fit: BoxFit.cover,
                  ),
                )),
            Positioned(
              top: 15,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: Colors.white,
                  )),
            ),
            Positioned(
              bottom: 45,
              left: 8,
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 18,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "${formatDate(widget.data.data["DateTime"])}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Icon(
                    Icons.access_time_outlined,
                    size: 18,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "${formatTime(widget.data.data["DateTime"])}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 8,
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${widget.data.data["Location"]}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.data.data["Name"],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Icon(
                      Icons.share,
                      size: 18,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.data.data["Description"],
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Special Guest",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "${widget.data.data["Gustes"] == "" ? "None" : widget.data.data["Gustes"]}",
                    style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Sponsers",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "${widget.data.data["sponsers"] == "" ? "None" : widget.data.data["sponsers"]}",
                    style: TextStyle(color: Colors.white)),
                Text(
                  "More Info",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Time:${formatTime(widget.data.data["DateTime"])}",
                    style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 8,
                ),
                Text("Location:${widget.data.data["Location"]}",
                    style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.map),
                    label: Text("Open with google map")),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${widget.data.data["participant"].length} peoples are attending.",
                  style: TextStyle(
                      color: KlightGreen,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                isReserved
                    ? SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: MaterialButton(
                          color: Colors.white,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("You already reserve you spot")));
                          },
                          child: Text(
                            "Spot Reserved for Event",
                            style: TextStyle(
                              fontFamily: 'inter',
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: MaterialButton(
                          color: Colors.white,
                          onPressed: () {
                            reserveEvent(widget.data.data["participant"],
                                    widget.data.$id)
                                .then((value) {
                              if (value) {
                                setState(() {
                                  isReserved = true;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Spot Reserved succesfully!!")));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "somthing went wrong Try again")));
                              }
                            });
                          },
                          child: Text(
                            "Reserve A Spot",
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
          )
        ],
      ),
    );
  }
}
