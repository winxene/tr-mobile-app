import 'package:flutter/material.dart';

class payments extends StatelessWidget {
  const payments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              print('Test');
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
            onPressed: () {},
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