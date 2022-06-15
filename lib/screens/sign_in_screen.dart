import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  /*
  Functionability
  - When there is a text in the username textfield the clear button will appear (press to clear the text).
  - There is a button to hide and unhide password text.
  - Password text require to be at least 8 characters (if not the error text will appear).
  */ 

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final usernameController =
      TextEditingController(); //using TextEditingController as the usernameController to utilize TextEditingCOntroller's functions such as clear()
  final passwordController = TextEditingController();
  String passwordError = '';
  bool isPasswordInvisible = true;

  @override
  void initState() {
    super.initState();

    usernameController.addListener(() => setState(() {
          //to refresh the state of the widget in the username (in this case clear icon when there is a text in the textfield)
          //
        }));
  }

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
      body: SingleChildScrollView(
        //to make the screen scrollable when the keyboard is open (there is not enough space to display the textfield)
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              child: Image.asset(
                'assets/images/bottle_and_fresh.png',
              ),
              width: 330,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                right: 220.0,
              ),
              child: Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                right: 250.0,
              ),
              child: Text(
                'Username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: buildUsername()),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                right: 250.0,
              ),
              child: Text(
                'Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: buildPassword()),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                print('Username: ${usernameController.text}');
                print('Password: ${passwordController.text}');
                setState(() {
                  //check if the password value meet the requirement which is at least 8 characters long
                  if (passwordController.text.length < 8)
                    passwordError = "Password must be at least 8 characters";
                  else
                    passwordError = "";
                });
              },
              child: Text('Sign in'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(0, 191, 166, 1),
                padding: EdgeInsets.symmetric(
                  horizontal: 128,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Go Create One!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUsername() => TextField(
        style: TextStyle(
          fontSize: 15,
        ),
        controller: usernameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          filled: true,
          fillColor: Colors.white,
          hintText: 'name@example.com',
          suffixIcon: usernameController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => usernameController
                      .clear(), //to clear any text in the username textfield
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildPassword() => TextField(
        style: TextStyle(
          fontSize: 15,
        ),
        controller: passwordController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter your password',
          errorText: passwordError,
          errorStyle: TextStyle(
            color: Colors.red,
          ),
          suffixIcon: IconButton(
            onPressed: (() => setState(() {
                  isPasswordInvisible = !isPasswordInvisible;
                })),
            icon: isPasswordInvisible
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        obscureText: isPasswordInvisible,
      );
}
