import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'newFile.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      darkTheme: ThemeData(primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/blue.jpg"), fit: BoxFit.fill)),
        child: Center(
          child: Container(
            width: 1200,
            height: 800,
            color: Colors.white,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(top: 40),
                            child: Row(
                              children: [
                                Icon(Icons.house_outlined),
                                Text("SHANGHAI CONSERVATORY OF MUSIC")
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 80, 0, 50),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 100,
                                  child: Image(
                                      image: AssetImage("images/graduate.png")),
                                ),
                                Text("GRADUATE SERVICE")
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * .20,
                            child: TextField(
                              obscureText: false,
                              maxLines: 1,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                border: OutlineInputBorder(),
                                labelText: "Email Address",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * .20,
                            child: TextField(
                              obscureText: true,
                              maxLines: 1,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                border: OutlineInputBorder(),
                                labelText: "Password",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * .20,
                            child: TextField(
                              obscureText: false,
                              maxLines: 1,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                ),
                                border: OutlineInputBorder(),
                                labelText: "Verification Code" +
                                    "                                     8Ad4F",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * .10,
                                  child: TextButton(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        'Login',
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage(
                                                  title: '',
                                                )),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 80),
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 800,
                            width: 765,
                            child: Image.asset(
                              "images/04.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
