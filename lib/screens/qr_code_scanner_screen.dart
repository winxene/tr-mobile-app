import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../net/firebase.dart';

//code di bawah ini sementara cuma bwt test dia bisa fetch data atau kagak, untuk lebih lengkapnya, nnti bakal
//diintegrasikan dengan tombol yang dikasi Vendy

QRDispenserFirebase qrDispenserFirebase = QRDispenserFirebase();

class QRCodeScannerDisplay extends StatefulWidget {
  static const routeName = '/qr_code_scanner';

  @override
  State<StatefulWidget> createState() => _QRCodeScannerDisplayState();
}

class _QRCodeScannerDisplayState extends State<QRCodeScannerDisplay> {
  String qrCodeResult = "";
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              false, // remove automatic back button when changing screen
          title: Text(qrCodeResult),
        ),
        body: Center(
          child: Column(children: <Widget>[
            ElevatedButton(
              onPressed: scanQRCode,
              child: Text(
                'text',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ]),
        ),
      );

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
        // Firebase.updateDispenserStatus();
      });
    } on PlatformException {
      qrCodeResult = 'Failed to get platform version.';
    }
  }
}
