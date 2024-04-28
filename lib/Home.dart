import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _loading = true;

  @override
  void initState() {

    setState(() {
      _loading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Global"),
              Text("News",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),

        body: _loading ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Categories",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),),
                    Container(
                      width: 350,
                      margin: EdgeInsets.only(left: 30.0),

                    )

                ]
                )
              )

    );
  }
}


