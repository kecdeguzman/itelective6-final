import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/views/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_loginpage/services/firebase_authentication.dart';
import 'package:provider/provider.dart';
import '/models/reg_users.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;
  late List<RegUsers> allusers;
  late bool todisplay;
  late RegUsers currentUser;
  final db = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    allusers = [];
    todisplay = false;
  }

  @override
  Widget build(BuildContext context) {
    RegUsers usr = context.read<Firebase_Authentication>().currentUser;
    print("HomeUI" + usr.display.toString() + " " + usr.displayname);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            leading:
                IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.home)),
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 30,
                        bottom: 10,
                      ),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(usr.photoUrl),
                              fit: BoxFit.fill)),
                    ),
                    Text(
                      usr.displayname,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    Text(
                      usr.email,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.user),
                title: Text('Profile'),
                selected: _selectedDestination == 0,
                onTap: () => selectDestination(0),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.columns),
                title: Text('Dashboard'),
                selected: _selectedDestination == 1,
                onTap: () => selectDestination(1),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.bookOpen),
                title: Text('Grades'),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(2),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.calendar),
                title: Text('Calendar'),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(3),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.envelope),
                title: Text('Messages'),
                selected: _selectedDestination == 4,
                onTap: () => selectDestination(4),
              ),
              Container(padding: EdgeInsets.only(bottom: 20)),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Container(padding: EdgeInsets.only(top: 20)),
              ListTile(
                leading: Icon(FontAwesomeIcons.cogs),
                title: Text('Settings'),
                selected: _selectedDestination == 5,
                onTap: () => selectDestination(5),
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.powerOff),
                title: Text("Logout"),
                selected: _selectedDestination == 6,
                onTap: () async {
                  await Firebase_Authentication()
                      .logOut(context)
                      .whenComplete(() {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginView()),
                        (route) => false);
                  });
                },
              ),
            ],
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<QuerySnapshot>(
              stream: db.collection('items').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else
                  return ListView(
                    children: snapshot.data!.docs.map((doc) {
                      return Container(
                        height: MediaQuery.of(context).size.height * .10,
                        child: Card(
                          child: ListTile(
                            title: Text((doc.data() as Map)['name']),
                            leading: Image.network(
                              (doc.data() as Map)['photoUrl'],
                              height: MediaQuery.of(context).size.height * .50,
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.high,
                            ),
                            trailing: TextButton(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'More Information',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
              },
            )));
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
