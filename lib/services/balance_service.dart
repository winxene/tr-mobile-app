import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart';

// Get the currently logged-in user
// Get the email address of the logged-in user
// Look up the balance for the user in the database
DatabaseReference ref = FirebaseDatabase.instance.ref("users");

class BalanceService extends ChangeNotifier{
  int _balance = 0;
  int get balance => _balance;

  set balance(int newBalance){
    _balance = newBalance;
    notifyListeners();
  }

  Future <void> updateBalance(int amount, bool isAdd) async{
    String userID = AuthService(FirebaseAuth.instance).user.uid;
    isAdd? _balance +=amount : _balance -= amount;
    await ref.set({userID:_balance});
    notifyListeners();
  }

  Future <void> getBalance() async{
    String userID = AuthService(FirebaseAuth.instance).user.uid;
    await ref.child(userID).once().then((event) {
      var snapshot = event.snapshot;
      if(snapshot.value != null){
      _balance = snapshot.value as int;
      print(_balance);
      notifyListeners();
      }
    });
  }

  Future <void> getUserInfo() async {
    String userID = AuthService(FirebaseAuth.instance).user.uid;
    bool sameUserFound = false;
    await ref.get().then((snapshot) {
      for(final userIDs in snapshot.children) {
        if (userID == userIDs.key) {
          sameUserFound = true;
          break;
        }
      }
      if (!sameUserFound) {
        _balance = 0;
        ref.child(userID).set(_balance);
        notifyListeners();
      } else {
        // _balance = snapshot.value[userID] as int;
        getBalance();
        notifyListeners();
      }
    });
  }
}

