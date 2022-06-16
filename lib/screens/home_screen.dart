import 'package:flutter/material.dart';
import '../widgets/my_icons_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/drinkify_logo.png',
                ),
                width: 120,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Balance',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Rp 25,000',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 280.0),
              child: Text(
                'Hello, Darian',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 38.0),
              child: Text(
                'Time to Rehydrate!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Trending',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      primary: Color.fromRGBO(0, 191, 166, 1),
                      onPrimary: Colors.white,
                      minimumSize: Size(120,
                          25), //increase the minimum size of the button (width, height)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Available',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      primary: Color.fromRGBO(0, 191, 166, 1),
                      onPrimary: Colors.white,
                      minimumSize: Size(120,
                          25), //increase the minimum size of the button (width, height)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Reccomended',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      primary: Color.fromRGBO(0, 191, 166, 1),
                      onPrimary: Colors.white,
                      minimumSize: Size(120,
                          25), //increase the minimum size of the button (width, height)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //menu information 1
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/tea.png',
                    ),
                    height: 120,
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:
                              160, //limit the width of the text to make two line of text
                          child: Text(
                            "Drinkify's Classic Hot Tea",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Small cup (250 ml)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Tea',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          'Starts from',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          'Rp 12,000',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 191, 166, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Test');
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          CircleAvatar(
                            //next button
                            child: Icon(
                              Icons.navigate_next,
                              size: 40,
                            ),
                            radius: 20,
                            backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                            foregroundColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //menu information 2
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/lemon_soda.png',
                    ),
                    height: 120,
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:
                              160, //limit the width of the text to make two line of text
                          child: Text(
                            "Drinkify's Signature Lemon Soda",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'Small cup (250 ml)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Soda',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          'Starts from',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          'Rp 10,000',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 191, 166, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Test');
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          CircleAvatar(
                            //next button
                            child: Icon(
                              Icons.navigate_next,
                              size: 40,
                            ),
                            radius: 20,
                            backgroundColor: Color.fromRGBO(0, 191, 166, 1),
                            foregroundColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 250.0),
              child: Text(
                'Quick Access',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    MyIcons.credit_card_payment_svgrepo_com,
                    size: 35,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Color.fromRGBO(0, 191, 166, 1),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    MyIcons.pencil_writing_on_paper_svgrepo_com,
                    size: 35,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Color.fromRGBO(0, 191, 166, 1),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.favorite,
                    size: 35,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Color.fromRGBO(0, 191, 166, 1),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.headset_mic_rounded,
                    size: 35,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    primary: Color.fromRGBO(0, 191, 166, 1),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        //bottom navigation bar template
        mainAxisAlignment: MainAxisAlignment
            .spaceEvenly, //make the 4 icon evently spaced in the bottom navigation bar
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ), //add padding to the bottom of the icon therefore there is a space between the icon and the bottom of the screen
            child: IconButton(
              icon: Icon(
                Icons.home,
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
              icon: Icon(
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
              icon: Icon(
                Icons.qr_code_scanner_outlined,
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
              icon: Icon(
                Icons.circle,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}