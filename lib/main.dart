import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginpage/services/firebase_authentication.dart';
import 'package:flutter_loginpage/views/login.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import '/models/reg_users.dart';
import 'newFile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => Firebase_Authentication(),
        ),
        StreamProvider(
          create: (context) => context.read<Firebase_Authentication>().getUser,
          initialData: RegUsers(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      darkTheme: ThemeData(primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: Consumer<RegUsers>(builder: (context, user, __) {
        if (user.uid == "") {
          return const LoginView();
        } else {
          return MyHomePage();
        }
      }),
    );
  }
}
