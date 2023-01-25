import 'package:flutter/material.dart';
import 'package:trmade/screens/home_screen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:trmade/services/dispenser_service.dart';
import 'package:flutter/services.dart';
import '../components/snack_bar.dart';


QRDispenserFirebase qrDispenserFirebase = QRDispenserFirebase();

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static const routeName = '/payment';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  String qrCodeResult = "";

  Future<void> scanQRCode() async {
    try {
      final qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCodeResult = qrCodeResult;
        qrDispenserFirebase.dispenser(qrCodeResult);
        showSnackBar(context, "QR Code Scanned, Token: $qrCodeResult");
        // Firebase.updateDispenserStatus();
      });
    } on PlatformException {
      qrCodeResult = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // remove automatic back button when changing screen
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
            child: Container(
              padding: EdgeInsets.only(right: 320),
              child: CircleAvatar(
                child: Icon(
                  Icons.navigate_before,
                  size: 40,
                ),
                radius: 20,
                backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            //use sized box to gain more flexibelity in arranging the elements
            height: 100,
          ),
          Container(
            child: Image.asset(
              'assets/images/payments_image.png',
            ),
            width: 330,
          ),
          SizedBox(
            //use sized box to gain more flexibelity in arranging the elements
            height: 40,
          ),
          Center(
            child: Container(
              width: 300,
              child: Text(
                'Hooray!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              child: Text(
                'Your purchase has been succesful. Please wait for the machine to create your drink!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(
            //use sized box to gain more flexibelity in arranging the elements
            height: 60,
          ),
          ElevatedButton.icon(
            onPressed: () {
              scanQRCode();
            },
            icon: Icon(
              Icons.qr_code_scanner_outlined,
              color: Colors.white,
              size: 35,
            ),
            label: Text(
              'Scan again',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(0, 191, 166, 1),
              padding: EdgeInsets.only(
                left: 70,
                right: 70,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
