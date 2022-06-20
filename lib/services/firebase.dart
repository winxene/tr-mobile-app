import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final DatabaseReference databaseDispenserReference = FirebaseDatabase.instance.ref("D-1");

class DispenserFirebase {
  void updateDispenserStatus(){
    databaseDispenserReference.child("phoneData").update({
      "status": true,
    });
    databaseDispenserReference.child("dispenserData").update({
      "token": " ",
    });
  }



  Future <void> dispenserLogic(String token) async {
    DatabaseReference dispenserToken =databaseDispenserReference.child("dispenserData/token");
    
    final getDispenserToken = await dispenserToken.once(DatabaseEventType.value);
    final tokenValue = getDispenserToken.snapshot.value.toString(); //token: " "
    print(tokenValue);
    List tokenValueKey=tokenValue.split(":");
    // DatabaseReference dispenserToken= FirebaseDatabase.instance.ref("D-1/dispenserData/token");
    if(tokenValueKey[1] == '"'+ token + '"'){
        updateDispenserStatus();
    }
  }
}



class QRDispenserFirebase extends DispenserFirebase{
  dispenser(String token){
    super.dispenserLogic(token);
  }
}