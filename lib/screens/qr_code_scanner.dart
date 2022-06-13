import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner>{

  String qrCodeResult = "";
  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: Text(qrCodeResult),
    ),
    body: Center(
      child:Column(
        children: <Widget>[
           ElevatedButton(onPressed: scanQRCode, 
           child: Text(
            'text',
            style: TextStyle(fontSize: 24),),
            ),
        ]
      ),
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
      });
    } on PlatformException {
      qrCodeResult = 'Failed to get platform version.';
    }
  }
}

