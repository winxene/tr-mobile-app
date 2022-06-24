import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final DatabaseReference databaseDispenserReference =
    FirebaseDatabase.instance.ref("D-1");

class DispenserFirebase {
  void updateDispenserStatus() {
    databaseDispenserReference.child("phoneData").update({
      "status": true,
    });
    databaseDispenserReference.child("dispenserData").update({
      "token": " ",
    });
  }
    void dispenserLogic(String token){
      DatabaseReference dispenserToken =databaseDispenserReference.child("dispenserData").child(token);
      dispenserToken.once();
      if(dispenserToken.key == token ){
          updateDispenserStatus();
      }
    }

  // dispenserLogic(String token) async {
  //   DatabaseEvent readDispenserToken = await databaseDispenserReference
  //       .child("dispenserData")
  //       .child('token')
  //       .once();

  //   final dispenserTokenToken = readDispenserToken.snapshot.value.toString();
  //   List tokenValue = dispenserTokenToken.split(":");
  //   if (tokenValue[1] == '"' + token + '"') {
  //     updateDispenserStatus();
  //   }
  // }
}

class QRDispenserFirebase extends DispenserFirebase {
  dispenser(String token) {
    super.dispenserLogic(token);
  }
}
