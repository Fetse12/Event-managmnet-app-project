import 'package:application_project/database.dart';
import 'package:application_project/saved_data.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('664072fa003188b94855')
    .setSelfSigned(
        status: true); // For self signed certificates, only use for development
Account account = Account(client);
// create a new user using email
Future<String> createUser(String name, String email, String password) async {
  try {
    final user = await account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    saveusersData(name, email, user.$id);
    return "Success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}
// login User

Future LoginUser(String email, String password) async {
  try {
    final user = await account.createEmailPasswordSession(
        email: email, password: password);
    SavedData.savedUserId(user.userId);
    return true;
  } on AppwriteException catch (e) {
    return false;
  }
}

//logout user

Future LogoutUser() async {
  await account.deleteSession(sessionId: 'current');
}
//check a user active session

Future checkSession() async {
  try {
    await account.getSession(sessionId: 'current');
    return true;
  } catch (e) {
    return false;
  }
}
