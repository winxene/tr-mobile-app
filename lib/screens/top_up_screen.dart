import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:trmade/services/balance_service.dart';
import 'package:trmade/widgets/balance_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trmade/widgets/bottom_nav_bar.dart';

import 'package:trmade/components/snack_bar.dart';

class TopUpScreen extends StatefulWidget {
  static const routeName = '/top_up';

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  String drinkifyURL = 'https://drinkify-website.vercel.app/';
  String qrCodeResult = "";

  final tokenEnteredController = TextEditingController();

  Future<void> _launchURL() async {
    final uri = Uri.parse(drinkifyURL);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $drinkifyURL';
    }
  }

  Future<void> tokenQRCode() async {
    try {
      final qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (!mounted) return;

      setState(() async {
        this.qrCodeResult = qrCodeResult;
        await BalanceService().addBalance(5000, qrCodeResult,() {
          showSnackBar(context, "Top up successful, press the balance button to refresh");
        });
      });
      if (qrCodeResult == '-1') {
        Navigator.of(context).pushNamed(TopUpScreen.routeName);
        showSnackBar(context, "QR Scan is canceled");
      } else {
        Navigator.of(context).pushNamed(TopUpScreen.routeName);
      }
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
        title: Text(
          'Top-Up',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.asset(
              'assets/images/top-up_image.png',
            ),
            width: 200,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Balance',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              BalanceWidget(),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'To Top-up, please visit the link below and get the token code. Then, enter the token code in the field below.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _launchURL();
            },
            child: Text(
              'Visit Drinkify Website',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.only(
                left: 70,
                right: 70,
                top: 10,
                bottom: 10,
              ),
              primary: Color.fromRGBO(0, 191, 166, 1), //button color
              onPrimary:
                  Colors.white, //inside button color, in this case Text widget
              minimumSize: Size(120,
                  25), //increase the minimum size of the button (width, height)
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 115),
            child: Text(
              'Please enter your token code here:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: tokenEnteredController,
              decoration: InputDecoration(
                hintText: 'Enter your token code here',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Text(
              'or press the scanQRCode button',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          //button for submit
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  String tokenEntered = tokenEnteredController.text;
                  await BalanceService()
                      .addBalance(5000, tokenEntered, () {
                        showSnackBar(context, "Top up successful");
                      });
                  await BalanceService().getBalance();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                    left: 70,
                    right: 70,
                    top: 10,
                    bottom: 10,
                  ),
                  primary: Color.fromRGBO(0, 191, 166, 1), //button color
                  onPrimary: Colors
                      .white, //inside button color, in this case Text widget
                  minimumSize: Size(120,
                      25), //increase the minimum size of the button (width, height)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              IconButton(
                onPressed: () => tokenQRCode(),
                icon: Icon(Icons.qr_code_scanner_outlined,
                    size: 30, color: Colors.white),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
