import 'package:firebase_database/firebase_database.dart';
import 'package:trmade/screens/welcome_screen.dart';
import 'package:trmade/services/balance_service.dart';

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

  Future <void> dispenserLogic(String token, Function callback) async {
    var ref = databaseDispenserReference.child("dispenserData").child("token");
    await ref.once().then((DatabaseEvent event) {
      var snapshot= event.snapshot;
      var dispenserToken = snapshot.value;
      if (dispenserToken == token) {
        updateDispenserStatus();
        BalanceService().deductBalance(5000, callback);
      }
    });
  }
}

class QRDispenserFirebase extends DispenserFirebase {
  dispenser(String token, Function callback) {
    super.dispenserLogic(token, callback);  
  }
}
