import 'package:blood_donation_management_system/Home.dart';
import 'package:blood_donation_management_system/Login.dart';
import 'package:blood_donation_management_system/Register.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key, required this.title});
  final String title;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  Future<void> login() async {
    Navigator.push(
      context,MaterialPageRoute(
        builder: (context) => const Login(title: 'title')
      ),
    );
  }

  void register(){
    Navigator.push(
      context,MaterialPageRoute(
        builder: (context) => const Register()
      ),
    );
  }

  void guestlog(){
    Navigator.push(
      context,MaterialPageRoute(
        builder: (context) => const Home()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'WELCOME', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0, color: Colors.black, ),
            ),
            Container(height: 50,),
            Text(
              'Blood Donation Management System', style: TextStyle(fontSize: 40), textAlign: TextAlign.center,
            ),
            Container(height: 50,),
            ElevatedButton(onPressed: login, child: Text('Login')),
            Container(height: 50,),
            Text('Are you a new donor'),
            ElevatedButton(onPressed: register, child: Text('Register')),
            Container(height: 50,),
            Text('Continue as a'),
            ElevatedButton(onPressed: guestlog, child: Text('Guest'))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
