import 'package:application_project/auth.dart';
import 'package:application_project/saved_data.dart';
import 'package:appwrite/appwrite.dart';

String databaseId = "6647b883002b633019a7";

final Databases databases = Databases(client);

Future<void> saveusersData(String name, String email, String userId) async {
  return await databases
      .createDocument(
          databaseId: databaseId,
          collectionId: "6647b8a2001c3b918593",
          documentId: ID.unique(),
          data: {
            "Name": name,
            "Email": email,
            "UserId": userId,
          })
      .then((value) => print("document created"))
      .catchError((e) => print(e));
}

//get user data from DB
Future getUserData() async {
  final id = SavedData.getUserId();
  try {
    final data = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: "6647b8a2001c3b918593",
        queries: [Query.equal("UserId", id)]);
    SavedData.savedUserName(data.documents[0].data['Name']);
    SavedData.savedUserEmail(data.documents[0].data['Email']);
  } catch (e) {
    print(e);
  }
}
//create new events

Future<void> createEnvent(
    String name,
    String desc,
    String image,
    String location,
    String dateTime,
    String created,
    String gustes,
    String sponsers) async {
  return await databases
      .createDocument(
          databaseId: databaseId,
          collectionId: "6649e6610032eff3910f",
          documentId: ID.unique(),
          data: {
            "Name": name,
            "Description": desc,
            "Image": image,
            "Location": location,
            "DateTime": dateTime,
            "CreatedBy": created,
            "Gustes": gustes,
            "sponsers": sponsers
          })
      .then((value) => print("Event Created"))
      .catchError((e) => print(e));
}

//read all data
Future getAllEvents() async {
  try {
    final data = await databases.listDocuments(
        databaseId: databaseId, collectionId: "6649e6610032eff3910f");
    return data.documents;
  } catch (e) {
    print(e);
  }
}

//reservation

Future reserveEvent(List participant, String documentId) async {
  final userId = SavedData.getUserId();
  participant.add(userId);
  try {
    await databases.updateDocument(
        databaseId: databaseId,
        collectionId: "6649e6610032eff3910f",
        documentId: documentId,
        data: {"participant": participant});
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
//list all the events

Future manageEvent() async {
  final userId = SavedData.getUserId();
  try {
    final data = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: "6649e6610032eff3910f",
        queries: [Query.equal("CreatedBy", userId)]);
    return data.documents;
  } catch (e) {
    print(e);
  }
}
//update an event

Future<void> updateEvent(
    String name,
    String desc,
    String image,
    String location,
    String dateTime,
    String created,
    String gustes,
    String sponsers,
    String docId) async {
  return await databases
      .updateDocument(
          databaseId: databaseId,
          collectionId: "6649e6610032eff3910f",
          documentId: docId,
          data: {
            "Name": name,
            "Description": desc,
            "Image": image,
            "Location": location,
            "DateTime": dateTime,
            "CreatedBy": created,
            "Gustes": gustes,
            "sponsers": sponsers
          })
      .then((value) => print("Event updated"))
      .catchError((e) => print(e));
}

//Delete an event
Future deleteEvent(String docId) async {
  try {
    final response = await databases.deleteDocument(
        databaseId: databaseId,
        collectionId: "6649e6610032eff3910f",
        documentId: docId);
    print(response);
  } catch (e) {
    print(e);
  }
}
