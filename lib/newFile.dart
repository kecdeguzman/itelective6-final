import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            leading:
                IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.home)),
            title: Text("SHANGHAI CONSERVATORY OF MUSIC"),
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
                              image: AssetImage("images/profile.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    Text(
                      "Kairn Ellis de Guzman",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    Text(
                      "kecdeguzman@addu.edu.ph",
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
                title: Text('Logout'),
                selected: _selectedDestination == 6,
                onTap: () => selectDestination(6),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 40,
                  left: 300,
                ),
                child: Text(
                  "Course Overview",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: new Container(
                  height: 800,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: EdgeInsets.fromLTRB(300, 50, 300, 0),
                    childAspectRatio: 4 / 5,
                    children: [
                      Container(
                        child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                height: 250,
                                width: 450,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage("images/guitar.png"),
                                        fit: BoxFit.fill)),
                              ),
                              Divider(
                                height: 1,
                                thickness: 2,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 5,
                                  top: 10,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.guitar,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 5,
                                    )),
                                    Text(
                                      "Stringed Instrument",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 15,
                                      top: 50,
                                    )),
                                    Text(
                                      "Course: Guitar",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 100,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    //  borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "This course will teach students the basics of the stringed instrument Guitar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 40,
                                ),
                                height: 40,
                                width: MediaQuery.of(context).size.width * .10,
                                child: TextButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Enroll Course',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                height: 250,
                                width: 450,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage("images/drums.jpeg"),
                                        fit: BoxFit.fill)),
                              ),
                              Divider(
                                height: 1,
                                thickness: 2,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 5,
                                  top: 10,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.drum,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 5,
                                    )),
                                    Text(
                                      "Percussion Instrument",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 15,
                                      top: 50,
                                    )),
                                    Text(
                                      "Course: Drums",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 100,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    //  borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "This course will teach students the basics of the percussion instrument Drums",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 40,
                                ),
                                height: 40,
                                width: MediaQuery.of(context).size.width * .10,
                                child: TextButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Enroll Course',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                height: 250,
                                width: 450,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage("images/flute.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              Divider(
                                height: 1,
                                thickness: 2,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 5,
                                  top: 10,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.guitar,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 5,
                                    )),
                                    Text(
                                      "Woodwind Instrument",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 15,
                                      top: 50,
                                    )),
                                    Text(
                                      "Course: Flute",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 100,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    //  borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "This course will teach students the basics of the woodwind instrument Flute",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 40,
                                ),
                                height: 40,
                                width: MediaQuery.of(context).size.width * .10,
                                child: TextButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Enroll Course',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                height: 250,
                                width: 450,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage("images/piano.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              Divider(
                                height: 1,
                                thickness: 2,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 5,
                                  top: 10,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.guitar,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 5,
                                    )),
                                    Text(
                                      "Keyboard Instrument",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 15,
                                      top: 50,
                                    )),
                                    Text(
                                      "Course: Piano",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 100,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    //  borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "This course will teach students the basics of the keyboard instrument Piano",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 40,
                                ),
                                height: 40,
                                width: MediaQuery.of(context).size.width * .10,
                                child: TextButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Enroll Course',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                height: 250,
                                width: 450,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage("images/ukulele.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              Divider(
                                height: 1,
                                thickness: 2,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 5,
                                  top: 10,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.guitar,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 5,
                                    )),
                                    Text(
                                      "Stringed Instrument",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 15,
                                      top: 50,
                                    )),
                                    Text(
                                      "Course: Ukulele",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 100,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    //  borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "This course will teach students the basics of the stringed instrument Ukulele",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 40,
                                ),
                                height: 40,
                                width: MediaQuery.of(context).size.width * .10,
                                child: TextButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Enroll Course',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 5,
                                  right: 5,
                                ),
                                height: 250,
                                width: 450,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage("images/violin.jpg"),
                                        fit: BoxFit.fill)),
                              ),
                              Divider(
                                height: 1,
                                thickness: 2,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 5,
                                  top: 10,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.guitar,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 5,
                                    )),
                                    Text(
                                      "Stringed Instrument",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                      left: 15,
                                      top: 50,
                                    )),
                                    Text(
                                      "Course: Violin",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 100,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    //  borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "This course will teach students the basics of the stringed instrument Violin",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 40,
                                ),
                                height: 40,
                                width: MediaQuery.of(context).size.width * .10,
                                child: TextButton(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Enroll Course',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
