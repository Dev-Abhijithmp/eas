import 'package:eas/managedata/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Stream<User?> changesign = auth.authStateChanges();

Future<int> signinemail(String email, String password) async {
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    print(userCredential.toString());
    return 0;
  } on FirebaseException catch (e) {
    print(e.toString());
    return 1;
  }
}

void signout() async {
  auth.signOut();
  print("Signed out");
}

Future<int> register(String email, String password, String name) async {
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    adduserdata(email, name);
    print('worked');
    return 0;
  } on FirebaseException catch (e) {
    print(e.toString());
    return 1;
  }
}

Future<int> sendpassreset(String email) async {
  try {
    await auth.sendPasswordResetEmail(email: email);
    return 0;
  } on FirebaseApp catch (e) {
    print(e.toString());
    return 1;
  }
}
