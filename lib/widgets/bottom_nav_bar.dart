import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trmade/screens/home_screen.dart';
import 'package:trmade/screens/payment_screen.dart';
import 'package:trmade/screens/profile_screen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trmade/components/snack_bar.dart';
import '../services/balance_service.dart';
import '../services/dispenser_service.dart';
QRDispenserFirebase qrDispenserFirebase = QRDispenserFirebase();

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  String qrCodeResult = "";
  final user = FirebaseAuth.instance.currentUser!;

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
      });
      if (qrCodeResult == '-1') {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
        showSnackBar(context, "QR Scan is canceled");
      } else {
        Navigator.of(context).pushNamed(PaymentScreen.routeName);
        showSnackBar(context, "QR Code Scanned, Token: $qrCodeResult");
      }
    } on PlatformException {
      qrCodeResult = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      //bottom navigation bar template
      mainAxisAlignment: MainAxisAlignment
          .spaceEvenly, //make the 4 icon evently spaced in the bottom navigation bar
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
          ), //add padding to the bottom of the icon therefore there is a space between the icon and the bottom of the screen
          child: IconButton(
            icon: const Icon(
              Icons.home,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
          ), //add padding to the bottom of the icon therefore there is a space between the icon and the bottom of the screen
          child: IconButton(
            icon: const Icon(
              Icons.search,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
          ), //add padding to the bottom of the icon therefore there is a space between the icon and the bottom of the screen
          child: IconButton(
            icon: const Icon(
              Icons.qr_code_scanner_outlined,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              scanQRCode();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
          ), //add padding to the bottom of the icon therefore there is a space between the icon and the bottom of the screen
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: IconButton(
              icon: 
                user.photoURL == Null
                ? const Icon(Icons.person)
                : Image(image: NetworkImage(user.photoURL!)),
              iconSize: 40,
              onPressed: () {
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              },
            ),
          ),
        ),
      ],
    );
  }
}
