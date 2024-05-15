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
        userId: ID.unique(), email: email, password: password);
    return "Success";
  } on AppwriteException catch (e) {
    return e.message.toString();
  }
}
