import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
// Get the currently logged-in user
var user = FirebaseAuth.instance.currentUser;

// Get the email address of the logged-in user
var userID = user?.uid; 
// Look up the balance for the user in the database
var ref = FirebaseDatabase.instance.ref().child('users');

var balance;
class Balance{
  static Future <void> getBalance() async {
  await ref.child(userID!).onValue.listen((event) {
    var snapshot= event.snapshot;
    var balance = snapshot.value;
    });
    return balance;
  }
  static Future <void> addBalance() async {
  await ref.child(userID!).set(balance);
  }
  static Future <void> getUserInfo() async {
    bool sameUserFound = false;
    await ref.get().then((snapshot) =>
    {
      for(final userIDs in snapshot.children){
        userID == userIDs ?
          sameUserFound = true:false
      },
      if (sameUserFound){
        ref.set(userID!)
      } 
    }); 
  }
}


