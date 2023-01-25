import 'package:firebase_database/firebase_database.dart';

final DatabaseReference databaseDispenserReference =
    FirebaseDatabase.instance.ref("D-1");

class DispenserFirebase {
  Future <void> updateDispenserStatus() async {
    await databaseDispenserReference.child("phoneData").set({
      "status": true,
    });
    await databaseDispenserReference.child("dispenserData").set({
      "token": " ",
    });
  }

  Future <void> dispenserLogic(String token) async {
    var ref = databaseDispenserReference.child("dispenserData").child("token");
    await ref.once().then((DatabaseEvent event) {
      var snapshot= event.snapshot;
      var dispenserToken = snapshot.value;
      if (dispenserToken == token) {
        updateDispenserStatus();
      }
    });
  }
}

class QRDispenserFirebase extends DispenserFirebase {
  dispenser(String token) {
    super.dispenserLogic(token);  
  }
}