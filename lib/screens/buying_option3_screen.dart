import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trmade/components/snack_bar.dart';
import 'home_screen.dart';
import 'payment_screen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../services/dispenser_service.dart';
import 'package:provider/provider.dart';

class BuyingOption3Screen extends StatefulWidget {
  const BuyingOption3Screen({Key? key}) : super(key: key);
  static const routeName = '/buying_option3_screen';

  @override
  State<BuyingOption3Screen> createState() => _BuyingOption3ScreenState();
}

enum SizeOption {
  Small,
  Medium,
  Large,
}

class _BuyingOption3ScreenState extends State<BuyingOption3Screen> {
  int value = 0;
  SizeOption? selectedSize;
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
        qrDispenserFirebase.dispenser(qrCodeResult, () {
          Navigator.of(context).pushNamed(PaymentScreen.routeName);
        });
      });
      if (qrCodeResult == '-1') {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
        showSnackBar(context, "QR Scan is canceled");
      } else {
        showSnackBar(context,
            "QR Code Scanned, if it does not change screen, please try again");
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
        children: [
          Container(
            child: Image.asset(
              'assets/images/matcha_latte.png',
              fit: BoxFit.fitWidth,
              width: 400,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 250.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 25,
              ),
              icon: Text(
                'Add to favorites',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Limited Offer: Drinkify's Matcha Latte",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(right: 274),
            child: Text(
              "Description",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Indulge in the rich taste and health benefits of matcha latte. Made with premium matcha powder, this drink is a great way to start your day. Only limited for today at System and Project Engineering bazzar!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(height: 40),
          //small option
          GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = SizeOption.Small;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectedSize == SizeOption.Small
                    ? Color.fromRGBO(0, 191, 166, 1)
                    : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Small",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(150ml)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Rp 5,000",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: [
                GestureDetector(
                  //to make the minus button know when it is being pressed
                  onTap: () {
                    setState(() {
                      if (value < 1) {
                        //decrease its value if its value is less than 1
                        value = 0;
                      } else {
                        value--;
                      }
                    });
                  },
                  child: const CircleAvatar(
                    //minus button
                    backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                    radius: 15,
                    child: Icon(
                      FontAwesomeIcons.minus,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  //weight value
                  '$value',
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  //to make the plus button know when it is being pressed
                  onTap: () {
                    setState(() {
                      value++; //increase its value when pressed
                    });
                  },
                  child: const CircleAvatar(
                    //plus button
                    backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                    radius: 15,
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            //text button sample (in this case I use Trending button)
            onPressed: () {
              if (value == 1 && selectedSize != null) {
                // Navigator.of(context).pushNamed(PaymentScreen.routeName);
                scanQRCode();
              } else if (value == 0) {
                showSnackBar(context, "Please select the quantity");
              } else if (selectedSize == null) {
                showSnackBar(context, "Please select the size");
              } else {
                showSnackBar(context,
                    "During limited event, you can only buy 1 item per transaction");
              }
            },
            child: Text(
              'Checkoout',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 130,
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
        ],
      ),
    );
  }
}
