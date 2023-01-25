import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

// Get the currently logged-in user
// var user = FirebaseAuth.instance.currentUser;
// Get the email address of the logged-in user
// var userID = user?.uid; 
String userID = AuthService(FirebaseAuth.instance).user.uid;
// Look up the balance for the user in the database
var ref = FirebaseDatabase.instance.ref().child('users');

class BalanceService extends ChangeNotifier{
  int _balance = 0;
  // Stream<Event> _balanceStream;
  int get balance => _balance;

  set balance(int newBalance){
    _balance = newBalance;
    notifyListeners();
  }

  Future <void> updateBalance(int amount, bool isAdd) async{
    isAdd? _balance +=amount : _balance -= amount;
    await ref.update({userID!:_balance});
    notifyListeners();
  }

  Future <void> getBalance() async{
    await ref.child(userID!).once().then((event) {
      var snapshot = event.snapshot;
      var _balance = snapshot.value;
      notifyListeners();
    });
  }

  Future <void> getUserInfo() async {
    bool sameUserFound = false;
    await ref.get().then((snapshot) =>
    {
      for(final userIDs in snapshot.children){
        userID == userIDs ?
          sameUserFound = true:false
      },
      if (!sameUserFound){
        _balance = 0,
        ref.push().set(
          {
            userID!: _balance
          })
      } 
      else{
        getBalance()
      }
  });
  notifyListeners();
  }
}

