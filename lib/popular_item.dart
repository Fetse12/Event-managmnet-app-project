import 'package:appwrite/models.dart';
import 'package:application_project/saved_data.dart';
import 'package:application_project/createEventdetail.dart';
import 'package:flutter/material.dart';
import 'package:application_project/date_time.dart';

class PopularItem extends StatelessWidget {
  final int index;

  final Document eventData;
  const PopularItem({super.key, required this.index, required this.eventData});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventDetails(
                      data: eventData,
                    ))),
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 1, 0, 29),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.white30, width: 1.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(0.0, 2.0),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "$index.",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    eventData.data["Name"],
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.calendar_month_outlined,
                      size: 18, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    formatDate(eventData.data["DateTime"]),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Icon(Icons.access_time_rounded,
                      size: 18, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    formatTime(eventData.data["DateTime"]),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined,
                      size: 18, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    eventData.data["Location"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
