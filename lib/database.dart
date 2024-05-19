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
            "name": name,
            "email": email,
            "userId": userId,
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
        queries: [Query.equal("usesrId", id)]);
    print(data);
  } catch (e) {
    print(e);
  }
}
