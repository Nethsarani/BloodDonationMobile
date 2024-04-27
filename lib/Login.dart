import 'package:flutter/material.dart';


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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Blood Donation Management System"),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),

    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Login', style: TextStyle(fontSize:40)),
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
          height: 20.0,
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
          height: 20.0,
        ),
      ElevatedButton(
        onPressed: () async {
          //List<User>	snapshot =	handler.retrieveUsers() as List<User>;
           _refreshData();
          for(var index=0; index<_allData.length; index++) {
            if(_allData[index].username==userNameController.text &&
                _allData[index].password==passwordController.text) {
              Navigator.push(
                context,MaterialPageRoute(
                  builder: (context) => const HomePage()
              ),
              );
              break;
            }
          }

          userNameController.text="";
          passwordController.text="";

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[600],
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        child: const Text("Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
        Text(_allData.length.toString()
    )

    ],
    )
    );
    }



  }

  


