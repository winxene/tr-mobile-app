import 'package:firebase_database/firebase_database.dart';

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
  void dispenserLogic(String token){
    DatabaseReference dispenserToken =databaseDispenserReference.child("dispenserData").child(token);
    dispenserToken.once();
    if(dispenserToken.key == token ){
        updateDispenserStatus();
    }
  }
}

class QRDispenserFirebase extends DispenserFirebase{
  dispenser(String token){
    super.dispenserLogic(token);
  }
}