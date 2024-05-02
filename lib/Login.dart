import 'package:flutter/material.dart';
import 'package:blood_donation_management_system/User.dart';
import 'package:blood_donation_management_system/DatabaseHandler.dart';
import 'package:blood_donation_management_system/Home.dart';
//import 'package:csharp_rpc/csharp_rpc.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;
  @override
  State<Login> createState() => _LoginState();
}

List<User> _allData=[];

class _LoginState extends State<Login> {
  late	DatabaseHandler	handler;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  } 

  @override
  void	initState()	{
    super.initState();
    handler	=	DatabaseHandler();
    _refreshData();
  }

  void _refreshData() async{
  final data=await handler.retrieveUsers();
  setState(() {
    _allData=data;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            FittedBox(
              fit: BoxFit.fitWidth,
                child: Text("Blood Donation Management System")
            ),
        centerTitle: true,
        elevation: 0.0,
      ),

    body:
       Row(
         children: [
           Expanded(flex: 1,child:Container(),),
           Expanded(flex:8, child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Flexible(flex:1, child: Container(height: 100,)),
               Text('Login', style: TextStyle(fontSize:50)),
               Container(height:100),
               TextFormField (
                 controller: userNameController,
                 decoration: const InputDecoration(
                   labelText: 'Username',
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         color: Colors.blue
                     ),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         color: Colors.grey
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 height: 40.0,
               ),
               TextFormField (
                 controller: passwordController,
                 decoration: const InputDecoration(
                   labelText: 'Password',
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         color: Colors.blue
                     ),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                         color: Colors.grey
                     ),
                   ),
                 ),
               ),

               SizedBox(
                 height: 40.0,
               ),
               ElevatedButton(
                 onPressed: () async {
                   Future<bool> c= handler.init();
                   if(c==false){
                     userNameController.text='connection error';
                   }
                   else if (c==true){
                     userNameController.text='connection ok';
                   }
                   else{
                     userNameController.text=c.toString();
                   }
                   String user=handler.Login(userNameController.text, passwordController.text).toString();
                   if ( user != null) {
                     //userNameController.text= c.toString();
                     /*
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) => const Home()
                      ),
                      );

                      */
                   }
                   else{
                     //userNameController.text="wrong";
                   }

                   //userNameController.text = "";
                   //passwordController.text = "";
                 },


                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.blue[600],
                   padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(25),
                   ),
                 ),
                 child: const Text("Login",
                   style: TextStyle(color: Colors.white, fontSize: 20),
                 ),
               ),

             ],
           ),),
           Expanded(flex: 1, child: Container()),
         ],
       ),

    );
    }



  }

  


